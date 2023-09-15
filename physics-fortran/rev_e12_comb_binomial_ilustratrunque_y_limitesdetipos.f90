! E12. Escribe una función que calcule el número de combinaciones de m elementos tomados de k en k.

! Podemos partir del ejemplo fact.f90, donde ya tenemos una función fact que calcula n!. En el programa principal podemos añadir una instrucción que compruebe el resultado en dos o tres casos de prueba, p.ej. 5 sobre 2, 7 sobre 4, 3 sobre 2, etc. Esto implica que tenemos que elegir un nombre para la función, p.ej. comb. Si compilamos el programa obtendremos el error de que la función comb no está definida.

! El paso siguiente es escribir el "esqueleto" de la función: su cabeza (nombre y argumentos con su tipo) y un cuerpo muy simple, aunque sea incorrecto (p.ej. que simplemente devuelva la constante 0.), y comprobar que el programa se compila correctamente y al ejecutarlo funciona sin errores (aunque devolviendo ese resultado incorrecto).

! Ya sólo queda definir correctamente la función. Para ello podemos apoyarnos en la función fact, que ya está definida en este mismo programa. Una vez corregidos los errores que puedan surgir el programa debe responder correctamente en los casos de prueba.

! Añade un caso de prueba un poco más grande, p.ej. 52 sobre 5 = 2598960, y observa el resultado. Descubre lo que está ocurriendo e intenta resolver este problema mediante una segunda versión de la función.
    ! DONE. Divagación acerca de qué pasaba y cómo ha sido solucionado abajo.

!Escribe una función para calcular el coeficiente binomial m sobre n.
!  / n \                  n!
! |      |  =  ---------------------
!  \ m /             m! (n-m)!

PROGRAM rev_e12_comb_binomial_ilustratrunque_y_limitesdetipos
implicit none
    integer n,m
    ! real a ! Para el ejemplo de trunque.
    
    ! Para unos valores tan grandes, el programa se quedaba 'colgado' Solución modificando las funciones aclarada abajo:
    n=52
    m=5
    
    print *, '###  PROGRAM: rev_e12_comb_binomial - LFMA  ###'   
    print '(A I2 A I2 A F10.0)', 'La binomial para n =',n,' y m =',m,' es ',binom(n,m)
    ! print *,fact(52) ! Para comprobar la magnitud de los factoriales que daban problemas por ser tan grandes.

    ! Ejemplo trunque *
    ! a=5/2.
    ! print '(F3.1)',a ! Restringir decimales a 0 para que tenga que redondear, o poner 1 decimal para ver el valor real.
    
contains
! #### 2º PROBLEMA: EL REDONDEO DE BINOM NO ES CORRECTO: correcto=2598960 / estado inicial definida como 'integer' = 2598959 (la que producía el error).
! Si no defino esta función con un tipo 'REAL' el redondeo es incorrecto pues al convertir fact('REAL*8') a un 'INTEGER' se trunca. Aclaración:
! Ejemplo de trunque: a=5./2, donde a es un 'INTEGER', 5. un 'REAL' y 2 otro 'INTEGER' -> almacenará en 2 en 'a'. Mmmm...
! ...en lugar de si es 'REAL', que mostrará 3, redondedo correcto si limitamos los digitos dicimales a 0 con PRINT; o la cantidad decimal 2.5 si no restringimos el # de digitos decimales.
! Jugar con [ print '(F3.1-0)',a ] para verlo.* +info también en pg 12(índice)/15(desde 0).
REAL function binom(n,m)
    INTEGER n,m
    binom=fact(n)/( fact(m)*fact(n-m) )
end function

! #### 1º PROBLEMA: NO FUNCIONA PARA n=52 y m=5... veamos... 
! fact(52)=8.06581751709438768E+067 (obtenido a posteriori, pero se puede comprobar en cualquier calculadora).
! Recodamos los límites de almacenamiento de cada variable... 
! Con 67 de magnitud > LÍMITE VAR_INT > LÍMITE VAR_REAL pero < LÍMITE VAR_REAL*8=+380 -> ergo, CON REAL*8 debe funcionar.
! Por tanto, probamos (límites con almacenamiento de 32bits):
! Int (ESTADO INICIAL QUE PRODUCÍA EL ERROR) -> Overflow y se rompe. LÍMITE VAR_INT: +/- 2,147,483,647. / 
! Real -> Aproxima y dice que es infinito.  LÍMITE VAR_REAL: 7digitos-10^+/-38
! Real*8 -> Muestra el auténtico valor (SOLUCIONADO). LÍMITE VAR_REAL*8: 14 dígitos-10^+/-380
! +info también en pg 8(índice)/11(desde 0).
REAL*8 function fact(n)
    integer i,n
    fact=1
    do i=1,n
        fact=fact*i
    end do
end function
END