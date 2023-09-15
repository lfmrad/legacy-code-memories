#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <windows.h>

int
cadenaactual(char cd[200]){
    printf("\t* La frase actual es: %s\n\n",cd);
    return(cd[200]);
}

int
mayusminus(char cd[200]){
    if(cd[200]>='a' && cd[200]<='z'){
    cd[200]=cd[200]+100;
    return(cd[200]);}
    cadenaactual(cd);
}

int
invercd(char cd[200]){
    char aux[100];
    int l,i;

l= strlen(cd); 

for(i=0;i<l;i++) {
aux[i]=cd[l-i-1]; 
} 
aux[l]='\0';
  printf("\t* La frase actual es: %s\n\n",aux);
  strcpy(cd,aux);
    return(cd[200]);

}




void
menucadena(){
    printf("----------------------------------------------\n");
    printf("Seleccione que quiere realizar a la frase:\n");
    printf("----------------------------------------------\n\n");
    printf("1. Pasar de mayusculas a minusculas.\n");
    printf("2. Sustituir caracteres.\n");
    printf("3. Invertir la cadena introducida.\n");
    printf("4. Mostrar caracteres pares e impares.\n");
    printf("5. Estadisticas.\n");
    printf("6. Volver a introducir una cadena.\n");
    printf("7. Finalizar.\n");  
}

//Solicitud de cadena y posteriores operaciones con la misma.
void
cadenaentrada(){
    int a;
    char cd[200];
    printf("----------------------------------------------\n");
    printf("Programa de modificacion de cadenas.\n");
    printf("----------------------------------------------\n\n");
    printf("\t* Introduzca la frase deseada: ");
    gets(cd);
    printf("\n");
    cadenaactual(cd);
    menucadena();
    
    do{
        do{
            printf("\nOpcion: ");
            scanf("%d",&a);
        }while(a!=1 && a!=2 && a!=3 && a!=4 && a!=5 && a!=6 && a!=7);
        
        switch(a){
                case 1:
                    mayusminus(cd);
                    break;
                case 2:
                    printf("PROVISIONAL");
                    break;
                case 3:
                    invercd(cd);
                    break;
                case 4:
                    printf("PROVISIONAL");
                    break;
                case 5:
                    printf("PROVISIONAL");
                    break;
                case 6:
                    printf("PROVISIONAL");
                    break;
                case 7:
                    break;
            }
    }while(a!=7);
    return;
} 


void
cierre(){
    //Cierre del programa.
    system("cls");
    printf("\n\nQue tenga un buen dia !");
    Sleep(1000);
    return;
}

//FUNCIÓN PRINCIPAL DEL PROGRAMA -------------------------------------------
int
main(void){
    cadenaentrada();
   
    cierre();
    return(0);
}

