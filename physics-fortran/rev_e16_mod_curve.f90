!Modifica el ejemplo curva.f90 para que dibuje diferentes funcione.
!ejemplo sin paramétricas

program rev_e16_mod_curve
use graphics
implicit none
    real :: t,delta
    
    t=-2
    delta=0.001
    
    ! Ventana gráfica con intervalo de valores en abcisas.
    call dibujo(-2.0,2.0)
    call ejes(1.0,0.1)
    
    call color(255,255,255)
    do while(t<2)
        call punto(t,f(t))
        t=t+delta
    end do
    
    call pulsatecla
    call FinDibujo
    
contains
function f(t)
    real :: f,t
    f=t**2
end function
    
end program 