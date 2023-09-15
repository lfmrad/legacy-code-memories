#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>

//prt4.1
//Esta funci�n almacena todo el texto y es llamada cuando se quiere mostrar.
int
titulos(int crn){
    switch(crn){ 
        //Si le enviamos 0 imprimir� la cabecera. 
        case 0:
            printf("-------------------------------\n");
            printf("JUEGO DEL BINGO SIMPLIFICADO\n");
            printf("-------------------------------\n\n");
            printf("* Bolas: ");
        break;
        //Para 1 y para 2 su cart�n correspondiente.
        case 1:
        case 2:
            printf("\nCARTON %d\n\n",crn);
        break;
        //Para 3 la despedida.
        case 3:
            printf("\n\nPulse cualquier tecla para salir.");
        break;
        case 4:
            printf("\nPulse cualquier tecla para sacar la siguiente bola...\n");
        break;
    }
    return(crn);
}

//Esta funci�n llamada por impresi�n, imprime bolas y las conserva en pantalla.
int
printbolas(int i, int vran[]){
    while(i>=0){
        printf("%4d",vran[i]);
        i--;
    }
    printf("\n");
    return(vran[100]);
}

//Esta funci�n llamada por impresi�n, imprime cart�n y tacha las coincidencias.
int
printcarton(int vcarton[],int vran[],int ncarton){
    int i;
    //Se env�a a t�tulo el N� de cart�n que ha de poner en t�tulo a imprimir.
    titulos(ncarton);
    for(i=0;i<20;i++){
        //Donde encuentra un -1 (antes metido), imprime una X.
        if(vcarton[i]==-1){
            printf("    X");
            //Por cada X, suma 1, contador hasta que rellene cart�n.
            if((i+1)%5==0){
                printf("\n");
            }
        //Si no lo encuentra, imprime normalmente la siguiente posici�n.
        }else{
            printf("%5d",vcarton[i]);
            if((i+1)%5==0){
                printf("\n");
            }
        }
    }
    return(vran[100]);
}

/*Por �ltimo, esta funci�n imprime los cartones, los tacha y permite ir 
sacando bolas. Cuando un jugador gana, lo muestra y finaliza el programa*/

int
impresion(int vran[], int aux[], int aux2[]){
    int x,i,k,j,a,b;
    //Estas variables har�n de contadores para cuantas X pone para cada cart�n.
    a=0;
    b=0;    
       
    /*Este for permite ir comprobando y tachando los cartones si se requiere, 
    para cada bola que sacamos*/
    //Cuando la a o la b lleguen a 20, se habr� completado un cart�n y fin.
    for(i=0;i<100&&a<20&&b<20;i++){
        //Matiene la cabecera del programa para cada iteraci�n.
        titulos(0);
        //Aqu� vamos imprimiendo las bolas y conserv�ndolas en pantalla.
        printbolas(i,vran);
        //Susituye con un -1 donde la bola coincide con un n�mero en un cart�n
        for(x=0;x<20;x++){
            if(aux[x]==vran[i]){
                aux[x]=-1; 
                a++;               
            }
            if(aux2[x]==vran[i]){
                aux2[x]=-1;  
                b++;
                              
            }
        }
        /*Esta pone X en las coincidentes del primer y segundo cart�n
        (llam�ndola dos veces), cosa que sabe porque antes hemos metido un -1 
        en dicha posici�n*/        
        printcarton(aux,vran,1);
        printf("\n");
        printcarton(aux2,vran,2);
        //Llama a un texto.
        titulos(4);

        //Si finaliza un cart�n, imprimir� el ganador:
        if(a==20 && b==20){
            printf("\nHabeis empatado...");
            titulos(3);
        }else{
            if(a==20){
                printf("\n* Gana el jugador 1 !!");
                titulos(3);
            }else{
                if(b==20){
                printf("\n* Gana el jugador 2 !!");
                titulos(3);
                }
            }
        }
    //Para ir sacando bolas a cada INTRO.
    getche();
    system("cls");
    }   
    return(vran[100]);
}

//Al ser llamada mand� un cart�n �nico a la anterior para que los guarde.
int
cartones(int vcar[]){
    
    //Creamos un vector y lo llenamos con 100 n�meros para usarlo luego.
    int i,al1,al2,extr,x,k; 
       
    //Llena el vector de n�meros del 1 al 100.
    for(i=0;i<100;i++){        
        vcar[i]=i+1;
    }
    
    for(i=0;i<10000;i++){
        /*Desoordena para obtener un cart�n de n�meros aleatorios no repetidos.
        Intercambia contenido de posiciones aleatorias en vcrt 10000 veces.*/
        al1=rand()%100;
        al2=rand()%100;
        //Aqu� realiza el intercambio de posiciones.
        extr=vcar[al1];
        vcar[al1]=vcar[al2];
        vcar[al2]=extr;
    }
    return(vcar[20]);
}

/*Luego, esta funci�n guarda cada cart�n en una variable aux para utilizarla
m�s tarde y que no se gener�n nuevos cartones cada vez que iteramos*/
int
almacen(int vran[], int vcar[], int aux[], int aux2[]){
    int i;
      
    //Recibe el primer cart�n y lo almacena en una variable auxiliar 1.
    cartones(vcar);
    for(i=0;i<20;i++){
        aux[i]=vcar[i];
    }
    
    //Recibe el segundo cart�n y lo almacena en otra variable auxiliar 2.
    cartones(vcar);
    for(i=0;i<20;i++){
        aux2[i]=vcar[i];
    }
    
    //Llama a la siguiente funci�n donde se imprimir�n cart y se ir� tachando.
    impresion(vran,aux,aux2);   
    return(vran[100]);
}

//En primer lugar, esta funci�n genera el vector de bolas aleatorias distintas.
int
generadorbolas(int vran[], int vcar[], int aux[], int aux2[]){
    int extrbol[100],al1,i;
    
    /*Rellena el vector externo con 0, que servir� de referencia para saber 
    si el aleatorio que entregar� al cart�n est� repetido o no.*/
    for(i=0;i<100;i++){
        extrbol[i]=0;
    }
    
    //Mete aleatorios al vector de las bolas.
    for(i=0;i<100;i++){
        al1=rand()%100;
        /*Si encuentra un 1, es que ha metido el mismo aleatorio en ese 
        lugar antes, por tanto, esta vez no pondr� y volver� una posici�n 
        atr�s, para repetir la iteraci�n con uno nuevo, sin dejar ning�n 
        lugar vac�o.*/
        if(extrbol[al1]!=1){
            vran[i]=al1;
            extrbol[al1]=1;
        }else{
            i--;
        }   
    }
    //Se llama a almac�n envi�ndole las variables para posteriores usos.
    almacen(vran,vcar,aux,aux2);
    return(vran[100]);
}

//Esta funci�n define vectores principales y lanza la cadena de funciones.
void
prt41(){
    /*Definimos el vector de las bolas (vran), el de los cartones (vcar) y 
    dos vectores auxiliares que luego utilizaremos (aux y aux2)*/
    int vran[100],vcar[100],aux[20],aux2[20];
    //Inicializamos la semilla temporal para todo el programa.
    srand(time(0));
    //Se empiezan a llamar las funciones en cadena.
    generadorbolas(vran,vcar,aux,aux2);
    //Despedida, tras finalizar la funci�n del programa.
    
    return;
}


////////////////////////////////MAIN////////////////////////////////////////
int
main(void){
    //Llama a la funci�n que lanzar� las dem�s funciones en cadena.
    prt41();
    return(0);
}


