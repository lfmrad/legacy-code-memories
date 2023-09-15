#include <conio.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

void
imprimiroculta(char oculta [100]){
    char aux[100];
    int i,l;
    
    srand(time(0));
    strcpy(aux,oculta);
    l=strlen(aux);
    
    for(i=0;i<l*0.75;i++){
        int r=rand()%l;
        if(aux[r]=='*'){i--;
        }else{aux[r]='*';}
    }
    
    printf("Palabra oculta: %s\n\n",aux);
    return;   
}

void
juego(void){
    char oculta [100], actual[100];
    int intentos=0;
    
    printf("Introduzca palabra oculta:\n\n");
    gets(oculta);
    
    do{
        system("cls");
        intentos++;
        printf("Intento numero: %d\n\n",intentos);
        imprimiroculta(oculta);
        printf("Escriba la palabra:\n\n");
        gets(actual); 
    }while(intentos<3 && strcmp(oculta,actual)!=0);
    
    if(strcmp(oculta,actual)==0){
        printf("\nHas acertado la palabra !!\n");
    }else{
        printf("\nLo siento, perdiste. La palabra era: %s.\n",oculta);
    }
    return;   
}
    

int
main(void){
    juego();
    getche();
    return(0);
}
