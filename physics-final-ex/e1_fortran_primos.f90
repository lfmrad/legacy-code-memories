PROGRAM e1_fortran_primos
implicit none
    integer :: i,j,n,sum,dif
    
    print *,'###  e1_fortran_primos - Luis F. Martinez Andreu  ###'
    
    n=99
    
    ! En principio hab�a supuesto que el 1 no era primo porque seg�n he le�do su aceptaci�n como tal ha cambiado a lo largo de la historia.
    ! As� que lo dejo partiendo de i=2 para ser coherente con el examen escrito, tal y como hab�a pensado al principio.
    
    do i=2,99 ! El bucle anidado comprobar� todas las posibles combinaciones de primos que cumplen la propiedad que sean menores de 100.
        if(checkprim(i)) then ! Si el n�mero es primo, pasa a realizar todas las combinaciones con otra serie de primos.
            Do j=2,99
                if(checkprim(j)) then ! Si el n�mero de esta serie es primo, comprueba la propiedad, y si la cumple, imprime los datos.
                    sum=i+j+1
                    dif=i-j-1
                    if(checkprim(sum) .and. checkprim(dif)) then ! Comprobar de propiedad (.and. porque ha de cumplir ambas a la vez).
                    print '(A I3 A I3 A I3 A I3)','La cumplen: ',i,' e ',j,' ## Sum: ',sum,' Dif: ',dif ! Impresi�n.
                    end if
                end if
            end do ! Continuar� para realizar todas las combinaciones con cada  'i' que esa primo.
        end if
    end do 

contains

logical function checkprim(x)
    integer :: i,x
    do i=2,x-1
        IF(mod(x,i)==0) then
            checkprim=.false.
            return
        end if
    end do
    checkprim=.true.
    ! Controla que no de falsos positivos si la dif es negativa y que 1 y 0 no son primos.
    if(x<2) checkprim=.false.
end function
end 