! Dibuja una espiral. Puedes partir del ejemplo param.f90.

PROGRAM rev_e17_espiral
use graphics
implicit none
    real :: delta,x
    integer :: nvueltas
    real,parameter :: pi=acos(-1.)
    
    nvueltas=20
    x=0
    delta=0.001
    
    call dibujo(-2.0,2.0)
    call ejes(1.0,0.1)
    !por el uso de RectaA es necesario indicar el punto de partida del trazo
    !call punto(x(0.),y(0.)) y dentro del bucle:
    !rectaA traza un segmento de recta entre los puntos
    !de forma que la representación siempre 'parezca' continua
        ! call rectaA(x(t),y(t))
    
    call color(255,0,255)
    do while(x<nvueltas*2*pi)
        call punto(param_cos(x),param_sin(x))
        x=x+delta
    end do
    
    x=0
    call color(0,255,255)
    do while(x<nvueltas*2*pi)
        call punto(-param_cos(x),-param_sin(x))
        x=x+delta
    end do
    
    call pulsatecla
    call FinDibujo
    
contains
function param_sin(x)
    real :: param_sin,x
    param_sin=sin(x)*x*0.01
end function
function param_cos(x)
    real :: param_cos,x
    param_cos=cos(x)*x*0.01
end function
END