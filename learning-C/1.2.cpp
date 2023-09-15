#include <stdio.h>
#include <conio.h>

int
main(void){
    /*La dinero entregado será float a, la cual extraeremos como (int) 
    en los billeltes para luego poder obtener los céntimos.*/
    float a,q,FIXFLOAT=0.001;
    int B500,B200,B100,B50,B20,B10,B5,M2,M1,M05,M02,M01,M005,M002,M001;
    
    printf("*** Programa Cambio *** \n\n");
    printf("Introduzca la cantidad deseada en euros: ");
    scanf("%f",&a);

    /*El procedimiento llevado acabo es la obtención del Nº de billetes 
    mediante la división de la cantidad por el billete; luego establecemos 
    una función que resta a la cantidad total la cantidad para BXXX de billetes 
    y, en consecuencia, la siguiente operación tendrá en cuenta la cantidad 
    restante y no el total. */
    
    

    //Entrega de billetes.
    B500=(int)a/500; 
    a=a-500*B500;
    //If para evitar que aparezcan 0 sin relevancia en la entrega de datos.
    if (B500>0) {printf ("\n\t* %d billete(s) de 500 euros.",B500);}
    
    B200=(int)a/200; 
    a=a-200*B200;
    if (B200>0) {printf ("\n\t* %d billete(s) de 200 euros.",B200);}
    
    B100=(int)a/100; 
    a=a-100*B100;
    if (B100>0) {printf ("\n\t* %d billete(s) de 100 euros.",B100);}
    
    B50=(int)a/50;
    a=a-50*B50;
    if (B50>0)  {printf ("\n\t* %d billete(s) de 50 euros.",B50);}
    
    B20=(int)a/20; 
    a=a-20*B20;
    if (B20>0)  {printf ("\n\t* %d billete(s) de 20 euros.",B20);}
    
    B10=(int)a/10; 
    a=a-10*B10;
    if (B10>0)  {printf ("\n\t* %d billete(s) de 10 euros.",B10);}
    
    B5=(int)a/5; 
    a=a-5*B5;
    if (B5>0)   {printf ("\n\t* %d billete(s) de 5 euros.",B5);} 
    //Espacio estético para separar billetes de monedas.
    printf("\n");
    
    /*Para las monedas, seguimos el mismo método, sólo que establecemos una 
    variable llamada q para que al otorgar el valor a MXX podamos tratar la 
    cantidad obtenida en q como un entero y que no apareza así como 
    resultado X.000000 en el programa*/
    
    //Entrega de monedas.
    M2=(int)a/2; 
    a=a-2*M2;
    if (M2>0)  {printf ("\n\t* %d moneda(s) de 2 euros.",M2);}  
    
    M1=(int)a/1; 
    
    //Con FIXFLOAT evitamos que los float corten la cantidad real relevante.
    a=a-1*M1+FIXFLOAT;
    if (M1>0)  {printf ("\n\t* %d moneda(s) de 1 euros.",M1);}   
    
    q=a/0.5; 
    M05=(int)q; 
    a=a-0.5*M05;
    if (M05>0)  {printf ("\n\t* %d moneda(s) de 50 centimos.",M05);}
    
    q=a/0.2; 
    M02=(int)q; 
    a=a-0.2*M02;
    if (M02>0)  {printf ("\n\t* %d moneda(s) de 20 centimos.",M02);}
    
    q=a/0.1; 
    M01=(int)q; 
    a=a-0.1*M01;
    if (M01>0)  {printf ("\n\t* %d moneda(s) de 10 centimos.",M01);}
    
    q=a/0.05; 
    M005=(int)q; 
    a=a-0.05*M005;
    if (M005>0) {printf ("\n\t* %d moneda(s) de 5 centimos.",M005);}
    
    q=a/0.02; 
    M002=(int)q; 
    a=a-0.02*M002;
    if (M002>0) {printf ("\n\t* %d moneda(s) de 2 centimos.",M002);}
    
    q=a/0.01; 
    M001=(int)q; 
    a=a-0.01*M001;
    if (M001>0) {printf ("\n\t* %d moneda(s) de 1 centimos.",M001);}
    
    getche();
    return(0);   
}
