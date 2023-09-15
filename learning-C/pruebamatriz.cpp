#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

#define Y 4
#define X 5

//PROGRAMA TESTEO MATRICES

//a la matriz solo le llega la direccion X
//como V es un vector, con una X le vale
void
imprimir(int M[Y][X], int V[]){
    int i,j;

    for(i=0;i<Y;i++){
        for(j=0;j<X;j++){
            //3 espaciado
            printf("%3d",M[i][j]);
        }
        //para que baje fila
        printf("\n");
    }
    
    printf("\n\n");
    
    for(i=0;i<Y;i++){
        printf("%d",V[i]);
    }
    return;
}


int
main(void){
    int M[Y][X],i,j;
    int V[Y];
    
    for(i=0;i<Y;i++){
        V[i]=0;
        for(j=0;j<X;j++){
            M[i][j]=0;
        }
    }
    
    M[0][1]=-1; 
    
    //a M le esta enviando solo [x]
    imprimir(M,V);
    
    getche();
    return(0);
}
