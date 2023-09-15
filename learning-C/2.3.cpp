#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>

int
main(void){
    int x=100,al1,al2,apu1,apu2,apu25;
    char a;
    
    //Semilla de los números variables.
    srand(time(0));
    
    printf("*** JUEGO DE LOS DADOS ***\n\n");
    printf("Bienvenido al juego de dados. Posee 100 euros iniciales.\n\n");
    
    //Aclaraciones de control del juego.
    printf("- La maxima apuesta estara limitada por la mitad de su caja.\n");
    printf("- Introduca la combinacion de la apuesta, por ejemplo, asi: 1.3\n");
    printf("  para un correcto funcionamiento del programa.\n\n");
    
    //"Do while" principal que permite la repetición de las apuestas hasta que quede dinero.
    do{
        //Introducimos los números aleatorios en la repetición del while para que se reinicien cada vez.
        al1=rand()%6+1;
        al2=rand()%6+1;
        
        printf("\n-------------------------------------------\n");
        printf("Caja %d euros.\n",x);
    
        /* Utilizamos un "do while" para volver a lanzar al usuario la cuestión en caso de que
        nos proporcione un dato incorrecto; en un par de ocasiones he utilizado uno sobre otro
        porque no me funcionaba el while si le ponía dos condiciones separadas con && */
        
        do{
            printf("Desea apostar o retirarse (a/r)?  ");
            scanf("%s",&a);  
        }while(a!='a'&&a!='r');
        
        if(a=='a'){
            //Aquí obtenemos los datos necesarios del usuario para disparar el programa.
            //OJEAR, NO FUNCIONA
            do{
                do{
                    printf("Combinacion:  ");
                    scanf("%d.%d",&apu1,&apu2);
                }while(apu2<1&&apu2>6);
            }while(apu1<1&&apu1>6);
            
            do{
                do{
                    //El segundo while limita la apuesta a la mitad del dinero en caja, como nos pide la práctica.
                    printf("Apuesta (de 1 a %d):  ",x/2);
                    scanf("%d",&apu25);
                }while(apu25>x/2);
            }while(apu25<1);
   
            //Aquí se inicia la estructura de resultados para las apuestas.
            if(al1==apu1&&al2==apu2){
                x=x+apu25;
                printf("Resultado del lanzamiento: %d y %d --> COINCIDEN!\n\n\t* Gana la apuesta!",al1,al2);
            }else{
                if(al1==al2){ 
                    x=x;
                    printf("Resultado del lanzamiento: %d y %d --> PAREJA\n\n\t* No pierde ni gana nada.", al1, al2);
                }else{
                    if(al1==1&&al2==1){
                        x=x-2*apu25;
                        printf("Resultado del lanzamiento: %d y %d --> DOBLE 1\n\n\t* Pierde el doble de lo que ha apostado.", al1, al2);
                    }else{
                        x=x-apu25;
                        printf("Resultado del lanzamiento: %d y %d \n\n\t* Pierde la cantidad apostada.", al1, al2);
                    }
                }
            }
        }
    //Finaliza el programa tanto si nos retiramos como si la caja llega a 0 euros; o en caso contrario, lo reinicia.
    }while(a!='r'&&x>1);
    printf("\n\nTerminas el juego con %d euros.\n\n",x);
    getche();
    return(0);    
}
