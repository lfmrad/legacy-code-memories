! E10. Escribe un programa que compruebe, para sucesivos valores de n, que la suma de los n primeros números impares es igual a n^2. Una forma de hacer esto es ir guardando en una variable la suma de los sucesivos impares.

PROGRAM rev_e10_serieimpares_comprobacion
implicit none
    integer :: i,sum_imp,generar_n_imp,n_2
    
    generar_n_imp=10
    sum_imp=0
    
    ! Generar-1 puesto que empezamos desde el 0 para que sum_imp genere también el 1.
    do i=0,generar_n_imp-1
        ! La forma más eficiente de generar números impares, en lugar de ir comprobando de 0 a x cuáles son (mod); es:
        ! conociendo que un número par cumple que se puede expresar como 2*n donde n es un número entero,
        ! podemos sumar 1 a esta condición pora que por cada número par generado se genere su respectivo impar. 
        ! Así se obtiene el sumatorio de tantos n impares como yo desee para luego comprobar que es igual a n^2.
        sum_imp=sum_imp+2*i+1
    end do
    
    ! n^2
    n_2=generar_n_imp**2
    
    ! Comprueba que se cumple la condición e informa al usuario:
    print *, '###  PROGRAM: rev_e10_serieimpares_comprobacion - LFMA  ###'    
    IF(sum_imp==n_2) THEN
        print '(A I3 A I5)', 'Se cumple que la suma de n=',generar_n_imp,' primeros impares que es igual a',sum_imp
        print '(A I5)', '...es igual que n^2=',n_2
    ELSE
        print *, 'No se cumple la igualdad.'
    END if
END