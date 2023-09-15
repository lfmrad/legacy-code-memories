! E11. Modifica el ejercicio E10 definiendo una función que calcule la suma de los n primeros números impares.

PROGRAM rev_e11_e10mod_serieimpares_func
implicit none
    integer n_2,generar_n_imp,sum_imp
    
    generar_n_imp=10
    sum_imp=sum_n_imp(generar_n_imp)
    n_2=generar_n_imp**2
    
    print *, '###  PROGRAM: rev_e11_e10mod_serieimpares_func - LFMA  ###'    
    if(n_2==sum_imp) then
        print '(A I3 A I5)','Se cumple que la suma de los n=',generar_n_imp,' primeros impares que es igual a',sum_imp
        print '(A I5)','...es igual a n^2=',n_2
    else
        print '(A I10 A I5)', 'No se cumple la igualdad: ',sum_imp,' /= ',n_2
    end if

contains
function sum_n_imp(n)
    integer i,sum_n_imp,n
    sum_n_imp=0
    do i=0,n-1
        sum_n_imp=sum_n_imp+2*i+1
    end do
end function

END