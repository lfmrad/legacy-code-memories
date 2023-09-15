! E13. Comprueba cuántos números primos genera el polinomio n^2-n+41 para n = 0,1,2,...
! * Corrijo el planteamiento: no tiene sentido empezar en 0, porque para 0 y 1 se va a a generar el mismo número, sea primo o no: 1^2-1+41=0^2-0+41=41

! Información respecto al polinomio generador de primos y otros de este tipo:
! http://gaussianos.com/polinomios-generadores-de-numeros-primos-los-numeros-afortunados-de-euler-y-el-163/
! La 1ª versión de la web es n^2+n+41, análogo al nuestro, sólo que funciona de 0 a 39 (el nuestro de 1 a 40).
! El nuestro aparece más abajo y es comparado con éste igualmente.

PROGRAM rev_e13_polinomio_generaprimos
implicit none
    integer n,i,x,primcounter
    
    ! A partir de 40 ya no genera primos de forma coherente. El polinomio sólo es válido para n<41. +info en el link.
    ! El programa, a partir de 40, sólo mostrará aquellos números que sí sean primos.
    n=45

    print *, '###  PROGRAM: rev_e13_polinomio_generaprimos - LFMA  ###'

    print *, ' n    ','primo'
        
    primcounter=0
    ! Desde i=1 y no 0 por lo comentado en *
    Do i=1,n
        x=i**2-i+41
        IF(checkprim(x)) then
            print '(I3 I8)',i,x
            primcounter=primcounter+1
        end if
        IF(i==40)  then
            Print *,'ATENCIÓN! A partir de aquí ya no genera primos continuamente,'
            print *,'y el programa sólo mostrará aquellos números que sí lo sean:'
        end if
    end do
        
    print '(A I3 A I3)', 'Para n =',n,' se han generado tantos primos:',primcounter
    
contains
logical function checkprim(x)
    integer i,x
    
    do i=2,x-1
        if(mod(x,i)==0) then
            checkprim=.false.
            return
        end if
    end do 
    checkprim=.true.
end function
END