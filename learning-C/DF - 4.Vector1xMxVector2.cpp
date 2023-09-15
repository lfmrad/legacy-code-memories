#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>

#define NFIL 4
#define NCOL 5

// nºi filas, nºj columnas
void
inimatriz(int M[NFIL][NCOL]){
    int i,j;
    for(i=0;i<NFIL;i++){
        for(j=0;j<NCOL;j++){
            M[i][j]=rand()%101;
        }
    }
    return;
}

void
inivector(int V[], int tam){
    int i;
    for(i=0;i<tam;i++){
        V[i]=rand()%101;
    }
    return;
}

void
impmatriz(int M[NFIL][NCOL]){
    int i,j;
    for(i=0;i<NFIL;i++){
        for(j=0;j<NCOL;j++){
            printf("%4d",M[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    return;
} 

void
impvector(int V[], int tam){
    int i;
    for(i=0;i<tam;i++){
        printf("%4d",V[i]);
    }
    printf("\n\n");
    return;
}

int
operacion(int V1[NFIL], int M[NFIL][NCOL], int V2[NCOL]){
    int R[NCOL],resul=0,i,j;
    //primera operacion R=V1xM
    for(j=0;j<NCOL;j++){
        R[j]=0;
        for(i=0;i<NFIL;i++){
            //el x+ va sumando cada multiplicacion al numero aterior
            R[j]+=V1[i]*M[i][j];
        }
    }
    //segunda operacion resul=RxV2
    for(j=0;j<NCOL;j++){
        resul+=R[j]*V2[j];
    }
    return(resul);
}

void
problema(void){
    int V1[NFIL],M[NFIL][NCOL],V2[NCOL];
    
    printf("------------ V1 x M x V2 = ? -------------\n\n");
    
    srand(time(0));
    inivector(V1,NFIL);
    inimatriz(M);
    inivector(V2,NCOL);
    
    printf("V1:\n"); impvector(V1,NFIL);
    printf("M:\n"); impmatriz(M);
    printf("V2:\n"); impvector(V2,NCOL);
    
    int resul=operacion(V1,M,V2);
    printf("El resultado de la operacion es: %d\n",resul);
    return;
}

int
main(void){
    problema();
    getche();
    return(0);
}
