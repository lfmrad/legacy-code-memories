//JUEGO PUZZLE NUMEROS *********************************************************
//LIBRERIAS --------------------------------------------------------------------
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
//Tamaño panel
#define N 4

//IMPRIMIRPANEL ----------------------------------------------------------------
void
imprimirpanel(int M[N][N]){
    int i,j;
    printf("\n--- PANEL DEL JUEGO ---------\n\n\n");
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            if(M[i][j]>=0){printf("%3d",M[i][j]);
            }else{printf(" []");}
        }
        printf("\n\n");
    }
    return;
}
    
//BUSCARHUECO ------------------------------------------------------------------
//funcion que busca hueco con el *
//(el único número negativo del panel)
void
buscarhueco(int M[N][N], int &posi, int &posj){
    int i,j;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            if(M[i][j]<0){
                posi=i; posj=j;
            }
        }
    }
    return;
}

//MOVIMIENTO -------------------------------------------------------------------
int
movimiento(int M[N][N],int m){
    int salida=0;
    int i,j;
    buscarhueco(M,i,j);
    
    //la m elige el mecanismo para generar el movimiento
    switch(m){
        case 0: //arriba
            if(i>0){
                M[i][j]=M[i-1][j];
                M[i-1][j]=-1;
                salida=1;
            }
            break;
        case 1: //derecha
            if(j<N-1){
                M[i][j]=M[i][j+1];
                M[i][j+1]=-1;
                salida=1;
            }
            break;
        case 2: //abajo
            if(i<N-1){
                M[i][j]=M[i+1][j];
                M[i+1][j]=-1;
                salida=1;
            }
            break;
        case 3: //izquierda
            if(j>0){
                M[i][j]=M[i][j-1];
                M[i][j-1]=-1;
                salida=1;
            }
            break;
        break;
    }
    //1 movimiento existoso, 0 no se ha movido
    return(salida);
}

//INICIALIZAR ------------------------------------------------------------------
void
inicializar(int M[N][N]){
    int nivel,ncambios,i,j;
    
    srand(time(0));
    system("cls");
    printf("Inicializacion del panel:\n\n");
    
    //nivel de juego
    printf("\t* Nivel de dificultad 1/2/3:\n");
    scanf("%d",&nivel);
    ncambios=N*N*nivel;
    
    //inicializacion en orden, llena de numeros en orden la matriz
    int act=1;
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            M[i][j]=act;
            act++;
        }
    }
    
    M[N-1][N-1]=-1; //hueco(abajo derecha) señalado con -1
    
    //generamos movimientos aleatorios
    while(ncambios>0){
        if(movimiento(M,rand()%4)==1){
            ncambios--;
        }
    }
    return;
}

//SOLUCIONADO ------------------------------------------------------------------
int
solucionado(int M[N][N]){
    int i,j,soluc=1,act=1;
   
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            if((i<N-1 || j<N-1)&&M[i][j]!=act){soluc=0;}
            act++;
        }
    }
    return(soluc);
}

//JUEGO ------------------------------------------------------------------------
void
juego(void){
    int M[N][N];
    inicializar(M);
    char opc;
    
    do{
        system("cls");
        imprimirpanel(M);
        printf("\nOpciones --------------------\n\n");
        printf(" - CURSORES: mover hueco\n");
        printf(" - ESC: finalizar\n");
        printf(" - R: reiniciar juego\n");
        
        //PAD DE CONTROL
        opc=getche();
        switch(opc){
            case 27: //escape
                break;
            case 72: //ariba
                printf("ARRIBA\n");
                movimiento(M,0);
                break;
            case 75: //izquierda
                printf("IZQUIERDA\n");
                movimiento(M,3);
                break;
            case 77: //derecha
                printf("DERECHA\n");
                movimiento(M,1);
                break;
            case 80: //abajo
                printf("ABAJO\n");
                movimiento(M,2);
                break;
            case 'r':
                inicializar(M);
                break;
        }
        
    }while(solucionado(M)!=1 && opc!=27);
    
    if(opc==27){
        system("cls");
        printf("\n\n** FIN DEL JUEGO, PULSE CUALQUIER TECLA PARA SALIR **\n");
    }else{
        system("cls");
        imprimirpanel(M);
        printf("\nFelicidades, has ganado!!\n");
    }
    return;
}

//MAIN**************************************************************************
int
main(void){
    juego();
    getche();
    return(0);
}
