#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>

int
main(void){
    char cd1[100], cd2[100], cd3[100];
    int y, l, i, j, x, k;
    x=0;
    
    printf("*** Buscador de texto ***\n\n");   
    //Pedimos al usuario la frase principal.
    printf("Introduzca la frase:\n\n");
    gets(cd1);
    
    //Pedimos al usuario la cadena que quiere buscar en la frase.
    printf("\nIntroduzca la cadena que desea buscar en la frase anterior:\n\n");
    gets(cd2);
           
    //Declaramos strlen de cada una para l e y.
    y=strlen(cd1);       
    l=strlen(cd2);
         
    //Instrucciones. RESOLVER CAGOENDIOS.
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
    //Mostramos el resultado al usuario.
    printf("\n\n---------------------------------------------------\n");
    printf("\n* Hay %d coincidencias con la cadena buscada. \n", x);
    printf("* Frase sin la cadena buscada: \n\n\t- %s \n", cd1);
    
    getche();
    return(0);
}
           
           
