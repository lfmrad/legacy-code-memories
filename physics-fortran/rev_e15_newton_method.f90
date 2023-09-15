! E15. Haz un programa que aplique el m�todo de Newton para encontrar la soluci�n de cualquier ecuaci�n f(x)=0. La idea es definir la funci�n y su derivada en la secci�n CONTAINS y utilizarlas en el programa principal.

!Info del M�todo de Newton usado.
!http://es.wikipedia.org/wiki/M%C3%A9todo_de_Newton
!Funci�n elegida para obtener su ra�z: f(x)=x^3-x^2-3

! x'=x-f(x)/f'(x)

PROGRAM rev_e15_newton_method
implicit none
    logical :: sinconverger=.true.
    real*8 aprox,x,dec
    
    print *, '###  PROGRAM: rev_e15_newton_method  ###'

    dec=1D-15
    x=5
    do while(sinconverger)
        aprox=x-f(x)/dx(x)
        if(abs(x-aprox)<dec) sinconverger=.false.
        x=aprox
        print *,x
    end do
    
    print '(A F12.10)', 'La soluci�n ha convergido para  f(x)=x^3-x^2-3; x = ',aprox

contains
function f(x)
    real*8 f,x
    f=x**3-x**2-3
end function

function dx(x)
    real*8 dx,x
    dx=3*x**2-2*x
end function

END