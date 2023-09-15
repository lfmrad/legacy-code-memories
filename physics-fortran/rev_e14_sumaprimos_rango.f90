! E14. Escribe una función que calcule la suma de los números primos desde el n-simo hasta el m-simo. Por ejemplo sumpri(4,7) = 7+11+13+17 = 48. Puedes apoyarte en una función que calcule el primo n-simo, que puede apoyarse a su vez en una función que determina si un número es primo o no (ver ejemplo primo.f90).

! Lo que debe hacer el programa es observar el rango, ir generando primos hasta llegar al n-simo, y entonces empezará a sumar este y los primos que queden comprendidos hasta llegar al m-simo.
! El e14 sin revisar (antiguo) es incorrecto, pues lo que hago es sumar los primos comprendidos entre los números 4 y 7 (5+7)  y no los primos comprendidos entre el primo número 4 y número 7 (7+11+13+17).

PROGRAM rev_e14_sumaprimos_rango
implicit none

print *, '###  PROGRAM: rev_e14_sumaprimos_rango - LFMA  ###'
print *, sumprim(4,7)

contains
function sumprim(range_first,range_last)
    integer sumprim,n,x,range_first,range_last
    
    print '(A I2 A I2 A)','La suma de los primos desde el n-simo hasta el m-simo: (',range_first,',',range_last,') es:'
    
    x=1; sumprim=0; n=0
    ! 1. El bucle comienza contando desde 2 para ir generando primos y los condicionales se encargarán de decidir qué hacer con ellos...
    Do while(n<range_last)  ! 5. ...que se encuentre con que n ya ha alcanzado el fin del rango exigido por el usuario (range_last), 
                                            ! no obstante, uso < y no <= porque la suma del último término n=range_last ya se hizo en la última iteración.
        x=x+1
        ! 2. ¿Es el número 'x' primo?
        IF(checkprim(x)) then
            ! 3. Si lo es, ¿qué término n-simo será? El 1º, por tanto, sumará 1 a 'n' que irá llevando la cuenta de a qué 'n' pertenece cada primo generado. 2-n=1 / 3-n=2 / 5-n=3 / 7-n=4
            n=n+1
            ! 4. Lo que interesa es sumar sólo los que estén en un rango que el usuario nos ha indicado. ¿Cómo?
            ! El programa comprueba si ya hemos generado el primo número n que coincide con el primer término del rango que nos exige el usuario (range_first).
            ! Si lo hace, sumará el primo y todos los consiguientes dentro del rango exigido hasta... Ir a 5.
            if(n>=range_first) sumprim=sumprim+x
        end if
    end do
end function

! Comprueba si el número x es primo o no.
logical function checkprim(x)
    integer i,x
    do i=2,x-1
        IF(mod(x,i)==0) then
            checkprim=.false.
            return
        end if
    end do
    checkprim=.true.
end function
END