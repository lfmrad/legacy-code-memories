#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <time.h>
#include <string.h>

//prt4.2
//definimos la constante de la dimensión de la matriz
#define n 10


char
copiar(char tab[n][n]){
    int i,j;
    char copi[n][n];       
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            copi[i][j]=tab[i][j];
        }
    }
    return(copi[n][n]);
}   

char
imprimir(char tab[n][n],int z,int cp){
    int i,j;    
            
    printf("-------------------------\n");
    printf("JUEGO DEL GUSANO\n");
    printf("-------------------------\n");
             
    //imprimir matriz
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){            
            printf("%2c",tab[i][j]);
            if((j+1)%10==0){
                printf("\n");
            }
            
        }
    }
    printf("\nPuntuacion actual: %d",z);
    printf("\n\nCONTROLES:\n");
    printf("-cursores para mover el gusano\n");
    printf("i para inicar de nuevo el panel\n");
    printf("s para salir\n");
    if(cp==1){
        printf("\n\t\t\\\\\\\\\\FIN DE LA PARTIDA CON %d PUNTOS//////////",z);
    }
    
    return(tab[n][n]);
}

char
mover(char tab[n][n],int a,int *x,int *y,int *z){     
    int b,c,cp;
    cp=0;
    b=0;
    c=0;         
    switch(a){
        case 1:
            b=-1;         
        break;
        case 2:
            b=1;            
        break;
        case 3:
            c=-1;            
        break;
        case 4:
            c=1;            
        break;
    }
    
    
    if(tab[*x-1][*y]!='.'){
        if(tab[*x+1][*y]!='.'){
            if(tab[*x][*y-1]!='.'){
                if(tab[*x][*y+1]!='.'){                    
                    cp=1;
                }
            }
        }
    }   
    if(cp==0){
        
    if(tab[*x+b][*y+c]=='.'&&(*y+c)!=n&&(*y+c)!=-1){
        switch(a){
            case 1:
                //cambiar posición arriba
                tab[*x][*y]='-';
                tab[*x-1][*y]='x';
                *x=*x-1;
                *z=*z+1;
                
            break;
            case 2:
                //cambiar posición abajo
                tab[*x][*y]='-';
                tab[*x+1][*y]='x';
                *x=*x+1;
                *z=*z+1;
                
            break;
            case 3:
                //cambiar posición izquierda
                tab[*x][*y]='-';
                tab[*x][*y-1]='x';
                *y=*y-1;
                *z=*z+1;
                
            break;
            case 4:
                //cambiar posición derecha
                tab[*x][*y]='-';
                tab[*x][*y+1]='x';
                *y=*y+1;
                *z=*z+1;
                
            break;        
        }
    }

    } 
    imprimir(tab,*z,cp);    
    return(tab[n][n]);
} 

char
entrada(char tab[n][n],int x,int y){                  
    char b,inicio[n][n];
    int z=0;
    inicio[n][n]=copiar(tab); 
    imprimir(tab,0,0);   
    do{
    b=getche();
    if(b==-32||b==0){
        b=getche();
    }
    system("cls");    
    switch(b){      
        
        case 'i':
            //volver inicio
            tab[n][n]=imprimir(inicio,0,0); 
                  
        break;
        case 's':
            //salir del programa
        break;
        case 72:
            //arriba
            
            tab[n][n]=mover(tab,1,&x,&y,&z);           
            
        break;
        case 80:
            //abajo
            
             tab[n][n]=mover(tab,2,&x,&y,&z);
             
        break;
        case 75:
            //izquierda
            
             tab[n][n]=mover(tab,3,&x,&y,&z);
            
        break;
        case 77:
            //derecha
            
             tab[n][n]=mover(tab,4,&x,&y,&z);
             
        break;
    }
    
    }while(b!='s');    
    return(tab[n][n]);
}   

char
tablero(char tab[n][n],int dif){
    int k,i,a,b,c,d,e;
    char inicio[n][n];
    e=0;
    i=0;
    k=dif*10*n*n/100;    
    while(i<k){
        a=rand()%n;
        b=rand()%n;
        if(tab[a][b]=='.'){            
            tab[a][b]='*';
            i++;
        }
    }    
    while(e!=1){
        c=rand()%n;
        d=rand()%n;
        if(tab[c][d]=='.'){
            tab[c][d]='x';
            e=1;
        }
    }     
    entrada(tab,c,d);
    return(tab[n][n]);
} 

int
matriz(int dif){
    int i,j;
    char tab[n][n];    
    //rellenar matriz
    for(i=0;i<n;i++){
        for(j=0;j<n;j++){
            tab[i][j]='.';
        }
    }
    tablero(tab,dif);
    return(dif);
} 

void
prt42(){
    int a,dif;            
      
    printf("1-Facil\n");
    printf("2-Medio\n");
    printf("3-Dificil\n");
    while(a!=1&&a!=2&&a!=3){
        printf("\nElige dificultad:");        
        scanf("%d",&a);
    }
    switch(a){
        case 1:
            dif=1;
        break;
        case 2:
            dif=2;
        break;
        case 3:
            dif=3;
        break;
    }
    system("cls");
    matriz(dif);
    return;
}
/////////////////////////////MAIN//////////////////////////////////////////
int
main(void){
    srand(time(0));
    prt42();    
    return(0);
}











//}while((tab[*x-1][*y]==tab[*x+1][*y]==tab[*x][*y-1]==tab[*x][*y+1]!='.'));
