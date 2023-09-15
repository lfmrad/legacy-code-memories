! E21. Observa el programa fact2.f90. Escribe una función que calcule la suma de los n primeros números impares y comprueba su funcionamiento.

PROGRAM rev_e21_arrays_serieimpares
implicit none
    print *, '###  PROGRAM: rev_e21_arrays_serieimpares - LFMA  ###'   

    CALL sumnimp(5)
    CALL sumnimp(10)
    CALL sumnimp(20)
    
contains
subroutine sumnimp(n)
    integer :: suma,n,i
    suma=sum( (/(2*i+1,i=0,n-1)/) )
    print '(a,i3,a,i4)', "Para n= ",n," impares su suma es =",suma
end subroutine

END