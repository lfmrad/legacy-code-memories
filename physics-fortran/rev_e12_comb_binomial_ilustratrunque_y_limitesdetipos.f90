! E12. Escribe una funci�n que calcule el n�mero de combinaciones de m elementos tomados de k en k.

! Podemos partir del ejemplo fact.f90, donde ya tenemos una funci�n fact que calcula n!. En el programa principal podemos a�adir una instrucci�n que compruebe el resultado en dos o tres casos de prueba, p.ej. 5 sobre 2, 7 sobre 4, 3 sobre 2, etc. Esto implica que tenemos que elegir un nombre para la funci�n, p.ej. comb. Si compilamos el programa obtendremos el error de que la funci�n comb no est� definida.

! El paso siguiente es escribir el "esqueleto" de la funci�n: su cabeza (nombre y argumentos con su tipo) y un cuerpo muy simple, aunque sea incorrecto (p.ej. que simplemente devuelva la constante 0.), y comprobar que el programa se compila correctamente y al ejecutarlo funciona sin errores (aunque devolviendo ese resultado incorrecto).

! Ya s�lo queda definir correctamente la funci�n. Para ello podemos apoyarnos en la funci�n fact, que ya est� definida en este mismo programa. Una vez corregidos los errores que puedan surgir el programa debe responder correctamente en los casos de prueba.

! A�ade un caso de prueba un poco m�s grande, p.ej. 52 sobre 5 = 2598960, y observa el resultado. Descubre lo que est� ocurriendo e intenta resolver este problema mediante una segunda versi�n de la funci�n.
    ! DONE. Divagaci�n acerca de qu� pasaba y c�mo ha sido solucionado abajo.

!Escribe una funci�n para calcular el coeficiente binomial m sobre n.
!  / n \                  n!
! |      |  =  ---------------------
!  \ m /             m! (n-m)!

PROGRAM rev_e12_comb_binomial_ilustratrunque_y_limitesdetipos
implicit none
    integer n,m
    ! real a ! Para el ejemplo de trunque.
    
    ! Para unos valores tan grandes, el programa se quedaba 'colgado' Soluci�n modificando las funciones aclarada abajo:
    n=52
    m=5
    
    print *, '###  PROGRAM: rev_e12_comb_binomial - LFMA  ###'   
    print '(A I2 A I2 A F10.0)', 'La binomial para n =',n,' y m =',m,' es ',binom(n,m)
    ! print *,fact(52) ! Para comprobar la magnitud de los factoriales que daban problemas por ser tan grandes.

    ! Ejemplo trunque *
    ! a=5/2.
    ! print '(F3.1)',a ! Restringir decimales a 0 para que tenga que redondear, o poner 1 decimal para ver el valor real.
    
contains
! #### 2� PROBLEMA: EL REDONDEO DE BINOM NO ES CORRECTO: correcto=2598960 / estado inicial definida como 'integer' = 2598959 (la que produc�a el error).
! Si no defino esta funci�n con un tipo 'REAL' el redondeo es incorrecto pues al convertir fact('REAL*8') a un 'INTEGER' se trunca. Aclaraci�n:
! Ejemplo de trunque: a=5./2, donde a es un 'INTEGER', 5. un 'REAL' y 2 otro 'INTEGER' -> almacenar� en 2 en 'a'. Mmmm...
! ...en lugar de si es 'REAL', que mostrar� 3, redondedo correcto si limitamos los digitos dicimales a 0 con PRINT; o la cantidad decimal 2.5 si no restringimos el # de digitos decimales.
! Jugar con [ print '(F3.1-0)',a ] para verlo.* +info tambi�n en pg 12(�ndice)/15(desde 0).
REAL function binom(n,m)
    INTEGER n,m
    binom=fact(n)/( fact(m)*fact(n-m) )
end function

! #### 1� PROBLEMA: NO FUNCIONA PARA n=52 y m=5... veamos... 
! fact(52)=8.06581751709438768E+067 (obtenido a posteriori, pero se puede comprobar en cualquier calculadora).
! Recodamos los l�mites de almacenamiento de cada variable... 
! Con 67 de magnitud > L�MITE VAR_INT > L�MITE VAR_REAL pero < L�MITE VAR_REAL*8=+380 -> ergo, CON REAL*8 debe funcionar.
! Por tanto, probamos (l�mites con almacenamiento de 32bits):
! Int (ESTADO INICIAL QUE PRODUC�A EL ERROR) -> Overflow y se rompe. L�MITE VAR_INT: +/- 2,147,483,647. / 
! Real -> Aproxima y dice que es infinito.  L�MITE VAR_REAL: 7digitos-10^+/-38
! Real*8 -> Muestra el aut�ntico valor (SOLUCIONADO). L�MITE VAR_REAL*8: 14 d�gitos-10^+/-380
! +info tambi�n en pg 8(�ndice)/11(desde 0).
REAL*8 function fact(n)
    integer i,n
    fact=1
    do i=1,n
        fact=fact*i
    end do
end function
END