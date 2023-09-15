#include <stdio.h>
#include <conio.h>

int
main(void){
    int a,x;
    
    //El programa pede al usuario el DNI:
    printf("*** DNI ----> NIF *** \n\n");
    printf("Introduzca DNI:\t");
    scanf("%d",&a);
    printf("\n");
    
    /*Resto de la división entera del DNI entre 23 para obtener un número 
    asociado a una letra.*/
    x=a%23;

    /*Conocido el DNI busca su letra asociada al número obtenido de la x y se 
    la entrega al usuario.*/
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
    getche();
    return(0);  
}
