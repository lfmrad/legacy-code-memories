! E22. Escribe un programa para comprobar el "Teorema de Nicomachus".
! +info: http://mathworld.wolfram.com/NicomachussTheorem.html

! Teorema de Nicomachus: n^3 es la suma de los n consecutivos n�meros impares (es decir, a partir de ese mismo n, incluy�ndose a s� mismo).
! Ilustraci�n.
    ! 1^3 = 1
    ! 2^3 = 3 + 5 
    ! 3^3 = 7 + 9 + 11
    ! 4^3 = 13 + 15 + 17 +19

PROGRAM rev_e22_arrays_nicomachus_theorem
implicit none
    integer :: sum_result,n,cubicn

    print *, '###  PROGRAM: rev_e22_arrays_nicomachus_theorem - LFMA  ###'   

    n=3
    
    sum_result=sum_nicomachus(n)
    cubicn=n**3
    if(sum_result==cubicn) then
        print '(a,i4,a,i4)',"Si es n es =",n," entonces n^3 =",cubicn
        print '(a,i4)',"que ser� igual a la suma de los n consecutivos n�meros impares =",sum_result
    else
        print *, "No se est� cumpliendo el Teorema, ergo: el programa est� mal.",sum_result,cubicn
    end if
    
contains
function sum_nicomachus(n)
    integer :: sum_nicomachus,n,i
    sum_nicomachus=sum( (/( n*(n-1)+1+2*(i-1), i=1,n )/) )
END function
end 

! byproducts curiosos:
    ! REFERENCIA: default correcto (seg�n definici�n): n*(n-1)-1+2*i
    ! el que yo saqu� que es casi an�logo: n*(n-1)+1+2*(i-1)

    ! Otras perlas:
    ! Funciona perfecto... 
    ! y a�n me sigue pareciendo intrigante porque no recuerdo c�mo se me ocurri�... 
    ! sum( (/ ( 2*k-1,k=1,n) /) )*n
    
    ! Este no es ni siquiera un sumatorio sino que equivale directamente a n^3
    ! es decir, una manera harto complicada de construir el cubo de n.
    ! sum_result=n*(n-1)+1+(n-1)*(n*(n-1)+1)+n*(n-1)
