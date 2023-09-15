!E18. Dibuja figuras de Lissajous.

PROGRAM e18_lissajous
    use graphics
    implicit none
    real :: t, delta,dfase,A,B,factor
    real, parameter :: pi = acos(-1.)
    integer :: nvueltas
    
    call dibujo(-2.0,2.0)
    call ejes(1.0,0.1)

    t = 0
    delta = 0.001
    
    nvueltas=8
    !parámetros para modificar los tipos de figuras
    A=3
    B=2
    !para indicar la fase
    dfase=pi/2
    !para variar el espaciado
    factor=0.7
    
    
    call punto(x(0.),y(0.))
    
    DO while (t<nvueltas*2*pi)
        call color(0,255,255)
        call rectaA( x(t), y(t) )
        t = t+delta
    END DO
    
    call pulsatecla
    call FinDibujo
    
!se usan la condiciones de lissajous para crear las figuras
!http://es.wikipedia.org/wiki/Curva_de_Lissajous

contains
    function x(t)
        real :: x,t
        x = sin(A*factor*t)
    end function
    
    function y(t)
        real :: y,t
        y = sin(B*factor*t*dfase)
    end function
END
