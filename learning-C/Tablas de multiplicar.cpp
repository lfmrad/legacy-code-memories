#include <stdio.h>
#include <string.h>
#include <conio.h>

int
main(void){
    
    int i,j;
    unsigned long int tab;
    
    printf("Introduzca el numero de tablas:\n\n");
    scanf("%d",&tab);
    
    for(i=0;i<=tab;i++){
        printf("\n");
        for(j=0;j<=10;j++){
            printf("%d x %d = %d\n",i,j,i*j);
        }   
    }
    
    getche();
    return(0);
}
