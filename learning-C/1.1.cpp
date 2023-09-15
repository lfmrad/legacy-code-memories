#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

int
main(void){
    int a;

    //Petición de número al usuario asociado a una posición.
    printf("Introduce un numero del 1 al 5 para determinar posicion: \n");
    scanf("%d",&a);
   
    //Esta instrucción borrará la pantalla tras la introducción de los datos.
    system("cls");
    
    /*"Switch" para establecer las respuesta asociada al dato entregado 
    por el usuario.*/
    
    switch(a){
        case 1:
            printf("Luis Fernando Martinez Andreu");
            break;
        case 2:
            printf("\t\t\t\t\t\t Luis Fernando Martinez Andreu");
            break;
        case 3:
            printf("\n\n\n\n\n\n\n\n\n\n\n\t\
            \t Luis Fernando Martinez Andreu");
            break;
        case 4:
            printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\
            \n\n\n Luis Fernando Martinez Andreu");
            break;
        case 5:
            printf("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\t\
            \t Luis Fernando Martinez Andreu");
            break;
    }   
    /*Utilización de "getche()" para evitar que se cierre el programa al 
    entregar la respuesta.*/
    getche();
    return(0); 
}
