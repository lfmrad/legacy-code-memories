! E14. Escribe una funci�n que calcule la suma de los n�meros primos desde el n-simo hasta el m-simo. Por ejemplo sumpri(4,7) = 7+11+13+17 = 48. Puedes apoyarte en una funci�n que calcule el primo n-simo, que puede apoyarse a su vez en una funci�n que determina si un n�mero es primo o no (ver ejemplo primo.f90).

! Lo que debe hacer el programa es observar el rango, ir generando primos hasta llegar al n-simo, y entonces empezar� a sumar este y los primos que queden comprendidos hasta llegar al m-simo.
! El e14 sin revisar (antiguo) es incorrecto, pues lo que hago es sumar los primos comprendidos entre los n�meros 4 y 7 (5+7)  y no los primos comprendidos entre el primo n�mero 4 y n�mero 7 (7+11+13+17).

PROGRAM rev_e14_sumaprimos_rango
implicit none

print *, '###  PROGRAM: rev_e14_sumaprimos_rango - LFMA  ###'
print *, sumprim(4,7)

contains
function sumprim(range_first,range_last)
    integer sumprim,n,x,range_first,range_last
    
    print '(A I2 A I2 A)','La suma de los primos desde el n-simo hasta el m-simo: (',range_first,',',range_last,') es:'
    
    x=1; sumprim=0; n=0
    ! 1. El bucle comienza contando desde 2 para ir generando primos y los condicionales se encargar�n de decidir qu� hacer con ellos...
    Do while(n<range_last)  ! 5. ...que se encuentre con que n ya ha alcanzado el fin del rango exigido por el usuario (range_last), 
                                            ! no obstante, uso < y no <= porque la suma del �ltimo t�rmino n=range_last ya se hizo en la �ltima iteraci�n.
        x=x+1
        ! 2. �Es el n�mero 'x' primo?
        IF(checkprim(x)) then
            ! 3. Si lo es, �qu� t�rmino n-simo ser�? El 1�, por tanto, sumar� 1 a 'n' que ir� llevando la cuenta de a qu� 'n' pertenece cada primo generado. 2-n=1 / 3-n=2 / 5-n=3 / 7-n=4
            n=n+1
            ! 4. Lo que interesa es sumar s�lo los que est�n en un rango que el usuario nos ha indicado. �C�mo?
            ! El programa comprueba si ya hemos generado el primo n�mero n que coincide con el primer t�rmino del rango que nos exige el usuario (range_first).
            ! Si lo hace, sumar� el primo y todos los consiguientes dentro del rango exigido hasta... Ir a 5.
            if(n>=range_first) sumprim=sumprim+x
        end if
    end do
end function

! Comprueba si el n�mero x es primo o no.
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