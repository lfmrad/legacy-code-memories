! E9. Modifica el ejercicio E5 para que se muestre en una tabla la conversión a grados Fahrenheit de 0,5,10,15,..., 100 grados centígrados.
! Los bucles DO k=ini,fin,step necesitan un índice k de tipo entero. Si necesitamos recorrer esos valores con una variable real podemos usar real(k) donde sea necesario. Pero es mejor hacer un bucle del tipo DO k=1,n y usar una variable real auxilar que dentro del bucle se define como x = a*k+b (donde a y b se eligen adecuadamente). 

! http://en.wikipedia.org/wiki/Temperature_conversion_formulas

PROGRAM rev_e9_conversorgrados_ej_bucleavanzado
implicit none
    integer :: centi
    real :: fahr

    
    print *, '###  PROGRAM: rev_e9_conversorgrados_ej_bucleavanzado - LFMA  ###'    
    print *, 'ºC --- ºF'
    do centi=0,100,5
        fahr=9./5*centi+32
        print '(I3 A F5.1)',centi,'    ',fahr
    end do
    
    
END