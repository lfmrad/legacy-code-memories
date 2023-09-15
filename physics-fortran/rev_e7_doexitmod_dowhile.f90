! E7. Modifica el ejemplo doexit.f90 utilizando la construcción DO WHILE.
! Info sobre el método de newton en pg4 apuntes.
! propiedad: n/sqrt(n)=sqrt(n), ergo n/x=x
! newton, iterar: x'<-1/2(x+n/x)

PROGRAM rev_e7_doexitmod_dowhile
implicit none
    REAL*8 :: aprox,x,root
    logical :: solsinconverger=.true.
    
    ! Incialización de variables:
    root=2 ! Raíz cuadrada de: root
    x=1

    do while (solsinconverger)
        aprox=(x+root/x)/2
        if(abs(x-aprox)<1D-10) solsinconverger=.false.
        ! Se pone aquí para que el if pueda comprobar cuál es su diferencia antes de igualarse.
        x=aprox
    end do
    
    print *, '###  PROGRAM: rev_e7_doexitmod_dowhile - LFMA  ###'    
    print '(A F4.2 A F12.10)', "La solución ha convergido, sqrt(",root,") = ",aprox
end 