#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <windows.h>

//FUNCIONES DEL PROGRAMA ----------------------------------------------------

//Para minizimar el espacio en la finalización de las funciones de los pgr.
void
finfunc(){
    getche();
    return; 
}
// EJERCICIO 1.1 -> Posición respecto de un número.
void
pgr11(){
    int a;
    system("cls");
    
    do{
        printf("Introduce un numero del 1 al 5 para determinar posicion: \n");
        scanf("%d",&a);
    }while(a!=1 && a!=2 && a!=3 && a!=4 && a!=5);
    
    system("cls");
    //revisar while
    
    switch(a){
        case 1:
            printf("Luis Fernando Martinez Andreu");
            break;
        case 2:
            printf("\t\t\t\t\t\t Luis Fernando Martinez Andreu");
            break;
        case 3:
            printf("\n\n\n\n\n\n\n\n\n\n\n\t\
            \ Luis Fernando Martinez Andreu");
            break;
        case 4:
            printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\
            \n\n\n Luis Fernando Martinez Andreu");
            break;
        case 5:
            printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\
            \t Luis Fernando Martinez Andreu");
            break;
    }   
    finfunc();
}

//EJERCICIO 1.2 -> Cambio de dinero.
void
pgr12(){
    float a,q,FIXFLOAT;
    int B500,B200,B100,B50,B20,B10,B5,M2,M1,M05,M02,M01,M005,M002,M001;
    FIXFLOAT=0.001;
    system("cls");
    
    printf("*** Programa Cambio *** \n\n");
    printf("Introduzca la cantidad deseada en euros: ");
    scanf("%f",&a);

    B500=(int)a/500; 
    a=a-500*B500;

    if (B500>0) {printf ("\n\t* %d billete(s) de 500 euros.",B500);}
    
    B200=(int)a/200; 
    a=a-200*B200;
    if (B200>0) {printf ("\n\t* %d billete(s) de 200 euros.",B200);}
    
    B100=(int)a/100; 
    a=a-100*B100;
    if (B100>0) {printf ("\n\t* %d billete(s) de 100 euros.",B100);}
    
    B50=(int)a/50;
    a=a-50*B50;
    if (B50>0)  {printf ("\n\t* %d billete(s) de 50 euros.",B50);}
    
    B20=(int)a/20; 
    a=a-20*B20;
    if (B20>0)  {printf ("\n\t* %d billete(s) de 20 euros.",B20);}
    
    B10=(int)a/10; 
    a=a-10*B10;
    if (B10>0)  {printf ("\n\t* %d billete(s) de 10 euros.",B10);}
    
    B5=(int)a/5; 
    a=a-5*B5;
    if (B5>0)   {printf ("\n\t* %d billete(s) de 5 euros.",B5);} 

    printf("\n");
    
    M2=(int)a/2; 
    a=a-2*M2;
    if (M2>0)  {printf ("\n\t* %d moneda(s) de 2 euros.",M2);}  
    
    M1=(int)a/1; 
    
    a=a-1*M1+FIXFLOAT;
    if (M1>0)  {printf ("\n\t* %d moneda(s) de 1 euros.",M1);}   
    
    q=a/0.5; 
    M05=(int)q; 
    a=a-0.5*M05;
    if (M05>0)  {printf ("\n\t* %d moneda(s) de 50 centimos.",M05);}
    
    q=a/0.2; 
    M02=(int)q; 
    a=a-0.2*M02;
    if (M02>0)  {printf ("\n\t* %d moneda(s) de 20 centimos.",M02);}
    
    q=a/0.1; 
    M01=(int)q; 
    a=a-0.1*M01;
    if (M01>0)  {printf ("\n\t* %d moneda(s) de 10 centimos.",M01);}
    
    q=a/0.05; 
    M005=(int)q; 
    a=a-0.05*M005;
    if (M005>0) {printf ("\n\t* %d moneda(s) de 5 centimos.",M005);}
    
    q=a/0.02; 
    M002=(int)q; 
    a=a-0.02*M002;
    if (M002>0) {printf ("\n\t* %d moneda(s) de 2 centimos.",M002);}
    
    q=a/0.01; 
    M001=(int)q; 
    a=a-0.01*M001;
    if (M001>0) {printf ("\n\t* %d moneda(s) de 1 centimos.",M001);}
    
    finfunc();  
}

// EJERCICIO 1.3 -> De DNI a NIF.
void
pgr13(){
    int a,x;
    system("cls");
    
    printf("*** DNI ----> NIF *** \n\n");
    printf("Introduzca DNI:\t");
    scanf("%d",&a);
    printf("\n");
    
    x=a%23;

    switch(x){
        case 0:
            printf("El NIF asociado al DNI %d es %d-T",a,a);
            break;
        case 1:
            printf("El NIF asociado al DNI %d es %d-R",a,a);
            break;
        case 2:
            printf("El NIF asociado al DNI %d es %d-W",a,a);
            break;
        case 3:
            printf("El NIF asociado al DNI %d es %d-A",a,a);
            break;
        case 4:
            printf("El NIF asociado al DNI %d es %d-G",a,a);
            break;
        case 5:
            printf("El NIF asociado al DNI %d es %d-M",a,a);
            break;
        case 6:
            printf("El NIF asociado al DNI %d es %d-Y",a,a);
            break;
        case 7:
            printf("El NIF asociado al DNI %d es %d-F",a,a);
            break;
        case 8:
            printf("El NIF asociado al DNI %d es %d-P",a,a);
            break;
        case 9:
            printf("El NIF asociado al DNI %d es %d-D",a,a);
            break;
        case 10:
            printf("El NIF asociado al DNI %d es %d-X",a,a);
            break;
        case 11:
            printf("El NIF asociado al DNI %d es %d-B",a,a);
            break;
        case 12:
            printf("El NIF asociado al DNI %d es %d-N",a,a);
            break;
        case 13:
            printf("El NIF asociado al DNI %d es %d-J",a,a);
            break;
        case 14:
            printf("El NIF asociado al DNI %d es %d-Z",a,a);
            break;
        case 15:
            printf("El NIF asociado al DNI %d es %d-S",a,a);
            break;
        case 16:
            printf("El NIF asociado al DNI %d es %d-Q",a,a);
            break;
        case 17:
            printf("El NIF asociado al DNI %d es %d-V",a,a);
            break;
        case 18:
            printf("El NIF asociado al DNI %d es %d-H",a,a);
            break;
        case 19:
            printf("El NIF asociado al DNI %d es %d-L",a,a);
            break;
        case 20:
            printf("El NIF asociado al DNI %d es %d-C",a,a);
            break;
        case 21:
            printf("El NIF asociado al DNI %d es %d-K",a,a);
            break;
        case 22:
            printf("El NIF asociado al DNI %d es %d-E",a,a);
            break;
    }
    finfunc(); 
}

//EJERCICIO 2.1 -> Buscador de texto.
void
pgr21(){
    char cd1[100], cd2[100], cd3[100];
    int y, l, i, j, x, k;
    x=0;
    system("cls");
    
    printf("*** Buscador de texto ***\n\n");
    printf("Introduzca la frase:\n\n");
    gets(cd1);
    
    printf("\nIntroduzca la cadena que desea buscar en la frase anterior:\n\n");
    gets(cd2);
           
    y=strlen(cd1);       
    l=strlen(cd2);
         
    for(i=0;i<=y-l;i++){
        for (j=0;j<=l-1;j++){ 
        cd3[j]=cd1[i+j];
        }
        cd3[l]= '\0';
        
        if(strcmp(cd2,cd3)==0){
            x=x+1; 
            for(k=i;k<i+j;k++){
                cd1[k]=' ';                     
            }
        } 
    }
    cd1[y+1]='\0';

    printf("\n\n---------------------------------------------------\n");
    printf("\n* Hay %d coincidencias con la cadena buscada. \n", x);
    printf("* Frase sin la cadena buscada: \n\n\t- %s \n", cd1);
    finfunc();
}

//EJERCICIO 2.2 -> Juego de dados.
void
pgr22(){
    int x=100,al1,al2,apu1,apu2,apu25;
    char a;
    system("cls");
    
    srand(time(0));
    
    printf("*** JUEGO DE LOS DADOS ***\n\n");
    printf("Bienvenido al juego de dados. Posee 100 euros iniciales.\n\n");
    printf("- La maxima apuesta estara limitada por la mitad de su caja.\n");
    printf("- Introduca la combinacion de la apuesta, por ejemplo, asi: 1.3\n");
    printf("  para un correcto funcionamiento del programa.\n\n");
    
    do{
        al1=rand()%6+1;
        al2=rand()%6+1;
        
        printf("\n-------------------------------------------\n");
        printf("Caja %d euros.\n",x);
        
        do{
            printf("Desea apostar o retirarse (a/r)?  ");
            scanf("%s",&a);  
        }while(a!='a'&&a!='r');
        
        if(a=='a'){
            //OJEAR, NO FUNCIONA
            do{
                do{
                    printf("Combinacion:  ");
                    scanf("%d.%d",&apu1,&apu2);
                }while(apu2<1&&apu2>6);
            }while(apu1<1&&apu1>6);
            
            do{
                do{
                    printf("Apuesta (de 1 a %d):  ",x/2);
                    scanf("%d",&apu25);
                }while(apu25>x/2);
            }while(apu25<1);
   
            if(al1==apu1&&al2==apu2){
                x=x+apu25;
                printf("Resultado lanzamiento: %d y %d --> COINCIDEN!\n\n\
                * Gana la apuesta!",al1,al2);
            }else{
                if(al1==al2){ 
                    x=x;
                    printf("Resultado lanzamiento: %d y %d --> PAREJA\n\n\
                    * No pierde ni gana nada.", al1, al2);
                }else{
                    if(al1==1&&al2==1){
                        x=x-2*apu25;
                        printf("Resultado lanzamiento: %d y %d --> DOBLE 1\n\n\
                        * Pierde el doble de lo que ha apostado.", al1, al2);
                    }else{
                        x=x-apu25;
                        printf("Resultado lanzamiento: %d y %d \n\n\
                        * Pierde la cantidad apostada.", al1, al2);
                    }
                }
            }
        }
    }while(a!='r'&&x>1);
    printf("\n\nTerminas el juego con %d euros.\n\n",x);
    finfunc();   
}

//EJERCICIO 2.3 -> Apuestas de caballos.
void
pgr23(){
    system("cls");
    printf("Programa sin finalizar");
    finfunc();
}

//Menú compartido para las prácticas pues necesitan el mismo.
void
menupracticas(){
    printf("\n\n\ta. Ejercicio 1.\n");
    printf("\tb. Ejercicio 2.\n");
    printf("\tc. Ejercicio 3.\n");
    printf("\td. Volver.\n");
    return;
}

/*Repetidor compartido de la solicitud de "opción" en caso de error de entrega,
usado en cada función "practica1 o 2"*/
int
repetidor(char a){
    do{
        printf("\nOpcion: ");
        a=getche();
        printf("\n\n\n");
    }while(a!='a' && a!='b' && a!='c' && a!='d');
    return(a);
}

//Menú práctica 1.
void
practica1(){
    char a;
    do{
        system("cls");
        //Presentamos el menú llamando a "menupracticas" y las opciones.
        printf("----------------------------\n");
        printf("Selector de practicas.\n");
        printf("----------------------------\n\n");
        printf("-- PRACTICA 1 --");
        menupracticas();
        //Llamamos a repetidor para que oferecer la opción a elegir.
        a=repetidor(a);
        switch(a){
            case 'a':
                pgr11();
                break;
            case 'b':
                pgr12();
                break;
            case 'c':
                pgr13();
                break;
            case 'd':
                break;
        }
    }while(a!='d');
    return;
}

//Menú práctica 2.
void
practica2(){
    char a;
    do{
        system("cls");
         //Presentamos el menú llamando a "menupracticas" y las opciones.
        printf("----------------------------\n");
        printf("Selector de practicas.\n");
        printf("----------------------------\n\n");
        printf("-- PRACTICA 2 --");
        menupracticas();
        //Llamamos a repetidor para que oferecer la opción a elegir.
        a=repetidor(a);
        switch(a){
            case 'a':
                pgr21();
                break;
            case 'b':
                pgr22();
                break;
            case 'c':
                pgr23();
                break;
            case 'd':
                break;
        }
    }while(a!='d');
    return;
}

//MENU PRINCIPAL desde donde accedemos a las prácticas.
void
mainmenu(){
    char a,b,c;
    
    //"Do while" repetidor el programa hasta que se finalice (opción c).
    do{
        system("cls");
        printf("----------------------------\n");
        printf("Selector de practicas.\n");
        printf("----------------------------\n\n");
        printf("-- MENU PRINCIPAL --\n\n");
        printf("\ta. Practica 1.\n");
        printf("\tb. Practica 2.\n");
        printf("\tc. Salir.\n");
    
        //Repetidor menú principal.
        do{
            //Para la introducción de la opción deseada por el usuario:
            printf("\nOpcion: ");
            a=getche();
            printf("\n\n\n");
        }while(a!='a' && a!='b' && a!='c');
    
        switch(a){
            case 'a':
                practica1();
                break;
            case 'b':
                practica2();
                break;
            case 'c':
                break;
        }
    }while(a!='c');
    return;
}

void
cierre(){
    //Despedida del programa.
    system("cls");
    printf("\n\nQue tenga un buen dia !");
    Sleep(1000);
    return;
}

//FUNCIÓN PRINCIPAL DEL PROGRAMA -------------------------------------------
int
main(void){
    mainmenu();
    cierre();
    return(0);
}

