PROGRAM rev_e0_conceptos_basicos
    ! Sirve para exigir explícitamente al compilador que todas las variables y su tipo han de estar definidas antes de compilar el programa.
    implicit none
        ! Recuerdo que en Fortran no se distingue entre mayúscula y minúscula y que el único requisito que ha de cumplir el nombre de la variable es no empezar por un número, aunque sí puede contenerlos en otro lugar. ej: av35, tan23, etc y valor=Valor=VALOR. También puedo usar '_', pero no '-'.
        ! Recuerdo los diferentes tipos: integer, real, double precision o real*8, complex :: z=(2.,3.), double complex, character*n (ej: character*11="Hola amigos") y logical (=.true. or =.false.).
        ! Recuerdo el uso de 'type,parameter' para definir constantes. ej: real*8parameter :: pi=3.14
        ! ATENCIÓN: Recuerdo que no es necesario poner :: 
            ! UPDATE: Esto es falso, sólo parece funcionar a veces y no para todos los tipos.
        ! Recuerdo la notación científica: simple precisión: 2.37E5 / doble precisión: 7.1D2
        ! Recuerdo que para escribir dos funciones en la misma línea usaré ';' para separarlas:
        !  x=3;y=2;etc
        
        ! Algunas funciones que requieren argumentos reales no funcionan con enteros. Por ejemplo, en lugar de sqrt(5) debemos poner sqrt(5.0) ó simplemente sqrt(5.). Si lo que tenemos es una variable entera n, hacemos sqrt(real(n)).
        
        integer :: val_1 = 59,n,j,k,i,exp,fact,r
        real :: dec_simple = 2.245524356
        ! Le añado D0 para que no pierda cifras significativas.
        REAL*8 :: dec_double = 2.245524356D0
      
        ! Cómo escribir constantes:
        integer,parameter :: int_cte=9
        real,parameter :: pi_cte=3.141592654D0
        REAL,Parameter :: g_cte=6.67428D-11
        REAL,PARAMETER :: earthmasskg_cte=5.9721986D24
        REAL,PARAMETER :: earthradiuskm_cte=6367.5
        
        ! Cadenas de caracteres.
        character*6 :: s="cadena"
        
        ! Defino para luego comprobar los tipos de división y la función mod(a,b).
        REAL :: div_int,div_float
        REAL :: a=5.0,b=2.0
        
        ! Recuerdo que para imprimir puedo usar tanto " como '. 
        ! El límite de PRINT es de 118 caracteres, más o menos.
        ! No obstante, se invierte el uso de las mismas para usarlas dentro de la frase:
        ! "Introduzca '1' o '2' " o bien 'Introduzca "1" o "2" '
        Print *, "******* Pruebas"
        ! Compruebo que no distingue mayús/minus. 'VAL_1'
        print *, "- Val_1",VAL_1
        ! Impresión de reales:
        Print *, "- dec normal/*8",dec_simple,dec_double
        
        ! Cómo imprimir constantes:
        Print *, "******* Constantes"
        PRINT *, "- int cte cualquiera=",int_cte
        PRINT *, "- pi=",pi_cte
        print *, "- G=",g_cte
        print *, "- earth mass (kg)=",earthmasskg_cte
        print *, "- earth radius (km)=",earthradiuskm_cte    
     
        Print *, "******* División y resto"
        ! Así devuelve cociente de división entera.
        div_int=5/2
        ! Así devuelve división de variables en coma flotante.
        ! El '.' puede estar en los dos o en sólo uno de ellos.
        div_float=5./2
        print *, "- División entera y flotante:",div_int,div_float
        ! Recuerdo que si se fuerza una operación entre distintos tipos de variables, fortran las convertirá pero se puede perder información: al convertir un real a un entero se trunca (no se redondea), al convertir un complejo en un real se pierde la parte imaginaria, etc.

        ! Recuerdo el uso de la a función mod(a,b), es decir: resto de a/b.
        ! Ha de ser el resto entre dos números con mismo tipo:
        ! (5.,2) o (5,.2) no funcionará mientras que (5./2.) sí lo hará.
        PRINT *, "- mod entre dos 'int' definidos aquí",mod(7,2)
        PRINT *, "- mod a,b reales",mod(a,b)
        
        Print *, "******* Impresión avanzada de cadenas"
        ! cadena s > número de caracteres de 'hola'
        print *, s > "hola"
        ! concatena cadenas de texto
        Print *, s//"texto"//s
        
        Print *, "******* Ejecución condicional"
        ! if(cond) then     ! Recuerdo las comparaciones:
            ! bloqueV       ! a>b, a<=b, a==b, a/=b
        ! else                 ! .not., .eqv.
            ! bloqueF       ! a<3 .and. b==0 / x<=0 .or. x>=max
        ! end if              ! ejemplo avanzado: logical = ( r .or. x<10) .and. n == 99+2
        ! Recuerdo que la parte 'else' es opcional, y podría sólo usar 'end if'
        ! Recuerdo la 'if' abreviada: if(b/=0) print *, "-check abreviada"
        
        n=50;j=2;k=2
        Print *, "- ¿Par o impar? n=",n
        if(mod(n,2)==0) then
            print *, " ...n es par"
        else
            print *, " ...n es impar"
        end if
         
        print *, "- if Abreviada si j/=1,j=",j
        If(j/=1) print *, " ...se cumple j/=1 !"
        
        Print *, "******* Bucles y repetición"
        ! Recuerdo los bucles:
        ! *infinito*             *con condición*       *for*
        ! do                        do while (i<=10)       do var=ini,fin,salto
            ! bloque                    bloque                  bloque
            ! if tal 'exit'      end do                    end do
        ! end do
        
        ! Los bucles nos permiten construir sumatorios.
        ! Respecto al for, si ini>fin no se ejecutará. 
        ! Si i=10,10: i=10, lo hago, compruebo si i ya es 10 ¿sí? paro
        ! Si el salto es negativo, ira hacia atrás. EJ:
        do i=10,0,-1
            print *,i
        end do
        
        !Cálculo de 3^10
        exp=1
        DO i=1,10,1
            exp=exp*3
        end do
        print *, "Con 'for': 3^10=",exp
        
        ! Cuando i=1 e (i<=1), detecta que ya es igual, pero aún realiza la iteración una última vez, de forma que si utilizamos i=1 mientras que (i<=10) hará 10 repeticiones y es análogo al caso de i=1,10 del 'for'.
        exp=1; i=1
        Do while (i<=10)
            exp=exp*3
            i=i+1
        end do
        print *, "Con 'do while': 3^10=",exp
        
        ! Programación estándar de:          _b_
        ! real :: r = 0                            r =\       f(k)
        ! integer :: k                                 /_ _
        ! do k = a, b                                   k=a
        ! r = r + f(k)    Prod: r=r*f(k)
        ! end do          Prod: la condición inicial ya no podrá ser r=0, sino r=1
        
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
    ! Si la función es de tipo 'real' debemos enviarle los argumentos con el mismo tipo. ej: n.
    ! Recuerdo que no puedo llamar directamente a una función: prime(57) pues como va a devolver a algún valor necesito que esté introducida al menos en un printf o pase a alguna variable su resultado.
    ! prime(57) sin más generará error.
    
    print *, "- función trig. prueba"
    print *, f(1.),f(0.),f(0.5),f(1.)
    print *, prime(57)

    ! Las variables globales, definidas en el programa principal, son accesibles desde cualquier fun-ci ´ on, siempre que su nombre no quede oculto por alguna variable local con el mismo nombre. Sirven para compartir informaci ´ on que no es c ´ omodo pasar expl´ icitamente como parámetro a las funciones.

    ! IMPORTANTE: No inicializar las variables en su definición de tipo como se puede hacer normalmente dentro de una función. REAL :: x=2 (incorrecto) / REAL :: x; x=2 (correcto). Sirve para que el valor inicial se restablezca en todas y cada una de las llamadas a la función. Si el valor inicial se da en la definición Fortran conservará su valor en las sucesivas llamadas.
    
    PRINT *, "******* SUBRUTINAS"
    ! Recuerdo que las subrutinas se llaman con 'call'. CALL SUBRUTINA(n)
    ! Cuando defino una subrutina, no he definir su tipo en INTEGER :: subrutinanombre, pues la función no tiene ningún tipo, sólo realiza un bloque de acciones.
    
    PRINT *, "******* ARRAYS"
    ! Recuerdo que en FORTRAN, cuando defino un array 'x(10)' dispondré de 10 variables, no 11 (como en C -desde 0) puesto que irá desde el 1 hasta el 10.
    ! Puedo crear arrays de hasta 7 índices.... 
    ! Puedo consultar las dimensiones de un array 'm' mediante 'shape(m)' cuyo resultado será otro array de entero con el # de elementos x dimensión.
        ! El número de elementos de m en la dimensión k se obtiene: 'size(m,k)' Si sólo tiene 1 dimensión: 'size(m)'
    ! Necesitaré usar bucles anidados para recorrer un array de más de una dimensión.
    ! Es necesario inicializarlos (como las variables)... ej: INTEGER :: y(2,3)=0
    
    
    contains
    ! Recuerdo que puedo poner REAL FUNCTION o definir f en real :: abajo.
    real function f(x)
        real :: x
        ! Las funciones trigonométricas sólo admiten tipos reales.
        f=sin(cos(sin(x)))
    end function
    
    logical function prime(n)
        integer :: n,i
        print *, "- ¿Es primo? n=",n
        
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