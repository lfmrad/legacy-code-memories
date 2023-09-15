#include <stdio.h>
#include <conio.h>
#include <string.h>
//system cls
#include <stdlib.h>


//SOLICITAR CADENA -------------------------------------------------------------
void
solicitarcadena(char original[]){
    system("cls");
    printf("--- ACCIONES CADENA ---\n\n");
    printf("\nIntroduzca la frase deseada: ");
    gets(original);
    return;
}

//MAYUSCULAS MINUSCULAS --------------------------------------------------------
void
mayusminus(char cad[]){
    char aux[100];
    int l,i;
    l=strlen(cad);
    aux[l]='\0';
    
    
    //Cambio mayusminus MUY IMPORTANTE RECORDAR PERMUTACIONES
    for(i=0;i<l;i++){
        if(cad[i]>='a' && cad[i]<='z'){
            aux[i]=cad[i]-'a'+'A';
        }else{
            if(cad[i]>='A' && cad[i]<='Z'){
                aux[i]=cad[i]-'A'+'a';
            }else{
                aux[i]=cad[i];
            }
        }
    }
    
    //Impresion
    printf("\n\nCadena resultante: %s\n",aux);
    return;
}

//SUSTITUCION NO ALFABETICOS ---------------------------------------------------
void
sustituir(char cad[]){
    char aux[100];
    int i,l;
    l=strlen(cad);
    //No entiendo muy bien que consigue con esto
    aux[l]='\0';
    
    for(i=0;i<l;i++){
        if((cad[i]>='a'&&cad[i]<='z')||(cad[i]>='A' && cad[i]<='Z')){
            aux[i]=cad[i];
        }else{
            aux[i]='*';
        }    
    }
    printf("\n\nCadena resultante: %s\n",aux);
    return;
}

//OPCIONES ---------------------------------------------------------------------
void
opciones(void){
    char original[100];
    int opc;
    
    solicitarcadena(original); 

    do{ 
        printf("\n\n1. Mayusculas / Minusculas\n");
        printf("2. Sustituir caracteres no alfabeticos por *\n");
        printf("3. Solicitar cadena original de nuevo\n");
        printf("ESC. Salir.");
        printf("\t\n\n * SELECCIONE OPCION: ");
        //scanf("%d",&opc);
        
        opc=getche();
        
        switch(opc){
            case '1':
                mayusminus(original);
                break;
            case '2':
                sustituir(original);
                break;
            case '3':
                solicitarcadena(original);
                break;
            case 27:
                break;
        }
    }while(opc!=27);
    return;
}
    

//MAIN**************************************************************************
int
main(void){
    opciones();
    getche();
    return(0);
}
