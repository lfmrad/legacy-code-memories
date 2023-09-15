//JUEGO BUSCAMINAS SIMPLE ******************************************************
//LIBRERIAS --------------------------------------------------------------------
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <time.h>
//Tamaño del tablero
#define N 8
//numero de minas
#define M 10

//IMPRIMIR TABLERO -------------------------------------------------------------
void
imprimir(int T[N][N],int opc){
    int i,j;
    
    printf("\n--- PANEL DEL JUEGO ---------\n\n\n");
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            switch(opc){
                //Tablero oculto
                case 1:
                    if(T[i][j]==1 || T[i][j]==0){
                        printf(" ? ");
                    }else{
                        printf(" X ");
                    }
                    break;
                //Tablero descubierto
                case 2:
                    if(T[i][j]==1){
                        printf(" * ");
                    }else{
                        if(T[i][j]==0){
                            printf(" - ");
                        }else{
                            printf(" X ");
                            
                        }
                    }
                    break;
            }
        }
        //espacio linea matriz
        printf("\n");
    }
    return;
}

//INICIALIZAR ------------------------------------------------------------------
void
inicializar(int T[N][N]){
    int i,j,al1,al2;
    srand(time(0));
    //Rellenamos de 0
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            T[i][j]=0;
        }
    }
    //Introducimos M minas en posiciones aleatorias
    for(i=0;i<M;i++){
        al1=rand()%N;al2=rand()%N;
        if(T[al1][al2]!=1){T[al1][al2]=1;}else{i--;}
    }
    return;
}

//TIRADA -----------------------------------------------------------------------
int
tirada(int T[N][N]){
    int i,j,resul;
    
    printf("\n\n>> Introduzca fila de 0 a %d: ",N);
    scanf("%d",&i);
    printf("\n>> Introduzca columna de 0 a %d: ",N);
    scanf("%d",&j);
    
    system("cls");
    
    if(T[i][j]==0){
        T[i][j]=2;
        resul=1;
    }else{
        if(T[i][j]==2){
            printf("\n\nPosicion ya descubierta !!!!");
            getche();
        }else{
            resul=-1;
        }
    }
    return(resul);
}

//JUEGO ------------------------------------------------------------------------
void
juego(void){
    int T[N][N],hide=1,win,resul,contador=0;
    char opc;
    inicializar(T);

    do{
        system("cls");
        //Para mostrar descubierto o normal
        if(hide==1){imprimir(T,1);}else{imprimir(T,2);hide=1;}
        printf("\nOpciones --------------------\n\n");
        printf(" - T: Tirar\n");
        printf(" - H: Hacer trampa\n");
        printf(" - ESC: Terminar\n\n");
        printf("\t* SELECCIONA OPCION:");
        //scanf("%d",&opc);
        opc=getche();
        switch(opc){
            case 't':
                //al sacar el valor ya esta llamando a la funcion OJO
                resul=tirada(T);
                if(resul==1){contador++;}
                if(resul==-1){win=resul;}
                //si las X son iguales al numero de casillas-minas: win!
                if(contador==(N*N)-M){win=1;}
                break;
            case 'h':
                hide=0;
                break;
            case 27:
                break;
        }  
    }while(opc!=27 && win!=1 && win!=-1);
    
    //FINALIZACION
    system("cls");
    if(win==1){
        imprimir(T,2);
        printf("\n\nFelicidades, has ganado la partida !!!");
    }else{
        if(win==-1){
            imprimir(T,2);
            printf("\n\nHas perdido la partida !!!");
        }else{
            printf("EL JUEGO HA TERMINADO");
        }
    }
    return;
}

//MAIN *************************************************************************
int
main(void){
    juego();
    getche();
    return(0);
}
