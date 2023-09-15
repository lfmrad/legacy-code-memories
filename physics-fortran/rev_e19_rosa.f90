!E19. Dibuja una rosa.

PROGRAM e19_rosa
    use graphics
    implicit none
    real :: t, delta,d,n,k
    real, parameter :: pi = acos(-1.)
    
    call dibujo(-2.0,2.0)
    call ejes(1.0,0.1)
    
    ! para reprenstar una rosa utilizo las funciones
        ! x=cos(kt)sin(t) / y=cos(kt)cos(t) 
        ! http://en.wikipedia.org/wiki/Rose_(mathematics)

        !parámetros para controlar la forma de la rosa 
        ! k determinará la forma de la rosa 
        !ej de funcionamiento: rosa de 8 petálos con n=4 y d=1
        n=7
        d=6
        k=n/d
        !para elegir la forma consultar:
        !http://goo.gl/xHMgE

    t = 0
    delta = 0.01
    
    call color(255,255,0)
    DO while (t<30*2*pi)
        call punto( x(t), y(t) )
        t = t+delta
    END DO
    
    call pulsatecla
    call FinDibujo


contains
    function x(t)
        real :: x,t
        x = cos(k*t)*sin(t)
    end function
    
    function y(t)
        real :: y,t
        y = cos(k*t)*cos(t)
    end function
END
