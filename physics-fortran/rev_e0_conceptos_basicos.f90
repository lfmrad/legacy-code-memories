PROGRAM rev_e0_conceptos_basicos
    ! Sirve para exigir expl�citamente al compilador que todas las variables y su tipo han de estar definidas antes de compilar el programa.
    implicit none
        ! Recuerdo que en Fortran no se distingue entre may�scula y min�scula y que el �nico requisito que ha de cumplir el nombre de la variable es no empezar por un n�mero, aunque s� puede contenerlos en otro lugar. ej: av35, tan23, etc y valor=Valor=VALOR. Tambi�n puedo usar '_', pero no '-'.
        ! Recuerdo los diferentes tipos: integer, real, double precision o real*8, complex :: z=(2.,3.), double complex, character*n (ej: character*11="Hola amigos") y logical (=.true. or =.false.).
        ! Recuerdo el uso de 'type,parameter' para definir constantes. ej: real*8parameter :: pi=3.14
        ! ATENCI�N: Recuerdo que no es necesario poner :: 
            ! UPDATE: Esto es falso, s�lo parece funcionar a veces y no para todos los tipos.
        ! Recuerdo la notaci�n cient�fica: simple precisi�n: 2.37E5 / doble precisi�n: 7.1D2
        ! Recuerdo que para escribir dos funciones en la misma l�nea usar� ';' para separarlas:
        !  x=3;y=2;etc
        
        ! Algunas funciones que requieren argumentos reales no funcionan con enteros. Por ejemplo, en lugar de sqrt(5) debemos poner sqrt(5.0) � simplemente sqrt(5.). Si lo que tenemos es una variable entera n, hacemos sqrt(real(n)).
        
        integer :: val_1 = 59,n,j,k,i,exp,fact,r
        real :: dec_simple = 2.245524356
        ! Le a�ado D0 para que no pierda cifras significativas.
        REAL*8 :: dec_double = 2.245524356D0
      
        ! C�mo escribir constantes:
        integer,parameter :: int_cte=9
        real,parameter :: pi_cte=3.141592654D0
        REAL,Parameter :: g_cte=6.67428D-11
        REAL,PARAMETER :: earthmasskg_cte=5.9721986D24
        REAL,PARAMETER :: earthradiuskm_cte=6367.5
        
        ! Cadenas de caracteres.
        character*6 :: s="cadena"
        
        ! Defino para luego comprobar los tipos de divisi�n y la funci�n mod(a,b).
        REAL :: div_int,div_float
        REAL :: a=5.0,b=2.0
        
        ! Recuerdo que para imprimir puedo usar tanto " como '. 
        ! El l�mite de PRINT es de 118 caracteres, m�s o menos.
        ! No obstante, se invierte el uso de las mismas para usarlas dentro de la frase:
        ! "Introduzca '1' o '2' " o bien 'Introduzca "1" o "2" '
        Print *, "******* Pruebas"
        ! Compruebo que no distingue may�s/minus. 'VAL_1'
        print *, "- Val_1",VAL_1
        ! Impresi�n de reales:
        Print *, "- dec normal/*8",dec_simple,dec_double
        
        ! C�mo imprimir constantes:
        Print *, "******* Constantes"
        PRINT *, "- int cte cualquiera=",int_cte
        PRINT *, "- pi=",pi_cte
        print *, "- G=",g_cte
        print *, "- earth mass (kg)=",earthmasskg_cte
        print *, "- earth radius (km)=",earthradiuskm_cte    
     
        Print *, "******* Divisi�n y resto"
        ! As� devuelve cociente de divisi�n entera.
        div_int=5/2
        ! As� devuelve divisi�n de variables en coma flotante.
        ! El '.' puede estar en los dos o en s�lo uno de ellos.
        div_float=5./2
        print *, "- Divisi�n entera y flotante:",div_int,div_float
        ! Recuerdo que si se fuerza una operaci�n entre distintos tipos de variables, fortran las convertir� pero se puede perder informaci�n: al convertir un real a un entero se trunca (no se redondea), al convertir un complejo en un real se pierde la parte imaginaria, etc.

        ! Recuerdo el uso de la a funci�n mod(a,b), es decir: resto de a/b.
        ! Ha de ser el resto entre dos n�meros con mismo tipo:
        ! (5.,2) o (5,.2) no funcionar� mientras que (5./2.) s� lo har�.
        PRINT *, "- mod entre dos 'int' definidos aqu�",mod(7,2)
        PRINT *, "- mod a,b reales",mod(a,b)
        
        Print *, "******* Impresi�n avanzada de cadenas"
        ! cadena s > n�mero de caracteres de 'hola'
        print *, s > "hola"
        ! concatena cadenas de texto
        Print *, s//"texto"//s
        
        Print *, "******* Ejecuci�n condicional"
        ! if(cond) then     ! Recuerdo las comparaciones:
            ! bloqueV       ! a>b, a<=b, a==b, a/=b
        ! else                 ! .not., .eqv.
            ! bloqueF       ! a<3 .and. b==0 / x<=0 .or. x>=max
        ! end if              ! ejemplo avanzado: logical = ( r .or. x<10) .and. n == 99+2
        ! Recuerdo que la parte 'else' es opcional, y podr�a s�lo usar 'end if'
        ! Recuerdo la 'if' abreviada: if(b/=0) print *, "-check abreviada"
        
        n=50;j=2;k=2
        Print *, "- �Par o impar? n=",n
        if(mod(n,2)==0) then
            print *, " ...n es par"
        else
            print *, " ...n es impar"
        end if
         
        print *, "- if Abreviada si j/=1,j=",j
        If(j/=1) print *, " ...se cumple j/=1 !"
        
        Print *, "******* Bucles y repetici�n"
        ! Recuerdo los bucles:
        ! *infinito*             *con condici�n*       *for*
        ! do                        do while (i<=10)       do var=ini,fin,salto
            ! bloque                    bloque                  bloque
            ! if tal 'exit'      end do                    end do
        ! end do
        
        ! Los bucles nos permiten construir sumatorios.
        ! Respecto al for, si ini>fin no se ejecutar�. 
        ! Si i=10,10: i=10, lo hago, compruebo si i ya es 10 �s�? paro
        ! Si el salto es negativo, ira hacia atr�s. EJ:
        do i=10,0,-1
            print *,i
        end do
        
        !C�lculo de 3^10
        exp=1
        DO i=1,10,1
            exp=exp*3
        end do
        print *, "Con 'for': 3^10=",exp
        
        ! Cuando i=1 e (i<=1), detecta que ya es igual, pero a�n realiza la iteraci�n una �ltima vez, de forma que si utilizamos i=1 mientras que (i<=10) har� 10 repeticiones y es an�logo al caso de i=1,10 del 'for'.
        exp=1; i=1
        Do while (i<=10)
            exp=exp*3
            i=i+1
        end do
        print *, "Con 'do while': 3^10=",exp
        
        ! Programaci�n est�ndar de:          _b_
        ! real :: r = 0                            r =\       f(k)
        ! integer :: k                                 /_ _
        ! do k = a, b                                   k=a
        ! r = r + f(k)    Prod: r=r*f(k)
        ! end do          Prod: la condici�n inicial ya no podr� ser r=0, sino r=1
        
        ! 7! resultado=5040
        print *, "-factorial:"
        fact=7; r=1
        do i=2,fact
            r=r*i
            ! print *,r,fact-i
        end do
        print *, r
        
        ! Ejemplo de bucle anidado
        !~ do i=1,5
            !~ do j=1,i
               !~ Print *, i,j
            !~ end do
        !~ end do
        
        !~ print *, "-tablas de multiplicar."
        !~ ! Tablas de multiplicar
        !~ DO i=1,10
            !~ Do j=1,10
                !~ print *, i,"x",j,"=",i*j
            !~ end do
        !~ end do
        
    
    PRINT *, "******* FUNCIONES"
    ! Si la funci�n es de tipo 'real' debemos enviarle los argumentos con el mismo tipo. ej: n.
    ! Recuerdo que no puedo llamar directamente a una funci�n: prime(57) pues como va a devolver a alg�n valor necesito que est� introducida al menos en un printf o pase a alguna variable su resultado.
    ! prime(57) sin m�s generar� error.
    
    print *, "- funci�n trig. prueba"
    print *, f(1.),f(0.),f(0.5),f(1.)
    print *, prime(57)

    ! Las variables globales, definidas en el programa principal, son accesibles desde cualquier fun-ci � on, siempre que su nombre no quede oculto por alguna variable local con el mismo nombre. Sirven para compartir informaci � on que no es c � omodo pasar expl� icitamente como par�metro a las funciones.

    ! IMPORTANTE: No inicializar las variables en su definici�n de tipo como se puede hacer normalmente dentro de una funci�n. REAL :: x=2 (incorrecto) / REAL :: x; x=2 (correcto). Sirve para que el valor inicial se restablezca en todas y cada una de las llamadas a la funci�n. Si el valor inicial se da en la definici�n Fortran conservar� su valor en las sucesivas llamadas.
    
    PRINT *, "******* SUBRUTINAS"
    ! Recuerdo que las subrutinas se llaman con 'call'. CALL SUBRUTINA(n)
    ! Cuando defino una subrutina, no he definir su tipo en INTEGER :: subrutinanombre, pues la funci�n no tiene ning�n tipo, s�lo realiza un bloque de acciones.
    
    PRINT *, "******* ARRAYS"
    ! Recuerdo que en FORTRAN, cuando defino un array 'x(10)' dispondr� de 10 variables, no 11 (como en C -desde 0) puesto que ir� desde el 1 hasta el 10.
    ! Puedo crear arrays de hasta 7 �ndices.... 
    ! Puedo consultar las dimensiones de un array 'm' mediante 'shape(m)' cuyo resultado ser� otro array de entero con el # de elementos x dimensi�n.
        ! El n�mero de elementos de m en la dimensi�n k se obtiene: 'size(m,k)' Si s�lo tiene 1 dimensi�n: 'size(m)'
    ! Necesitar� usar bucles anidados para recorrer un array de m�s de una dimensi�n.
    ! Es necesario inicializarlos (como las variables)... ej: INTEGER :: y(2,3)=0
    
    
    contains
    ! Recuerdo que puedo poner REAL FUNCTION o definir f en real :: abajo.
    real function f(x)
        real :: x
        ! Las funciones trigonom�tricas s�lo admiten tipos reales.
        f=sin(cos(sin(x)))
    end function
    
    logical function prime(n)
        integer :: n,i
        print *, "- �Es primo? n=",n
        
        do i=2,n-1
            if(mod(n,i)==0) then
                prime=.false.
                return
            end if
        end do
        prime=.true.
        if (n==0 .or. n==1) prime=.false.
    end function
END