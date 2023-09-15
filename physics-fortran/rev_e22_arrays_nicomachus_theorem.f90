! E22. Escribe un programa para comprobar el "Teorema de Nicomachus".
! +info: http://mathworld.wolfram.com/NicomachussTheorem.html

! Teorema de Nicomachus: n^3 es la suma de los n consecutivos números impares (es decir, a partir de ese mismo n, incluyéndose a sí mismo).
! Ilustración.
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
        print '(a,i4)',"que será igual a la suma de los n consecutivos números impares =",sum_result
    else
        print *, "No se está cumpliendo el Teorema, ergo: el programa está mal.",sum_result,cubicn
    end if
    
contains
function sum_nicomachus(n)
    integer :: sum_nicomachus,n,i
    sum_nicomachus=sum( (/( n*(n-1)+1+2*(i-1), i=1,n )/) )
END function
end 

! byproducts curiosos:
    ! REFERENCIA: default correcto (según definición): n*(n-1)-1+2*i
    ! el que yo saqué que es casi análogo: n*(n-1)+1+2*(i-1)

    ! Otras perlas:
    ! Funciona perfecto... 
    ! y aún me sigue pareciendo intrigante porque no recuerdo cómo se me ocurrió... 
    ! sum( (/ ( 2*k-1,k=1,n) /) )*n
    
    ! Este no es ni siquiera un sumatorio sino que equivale directamente a n^3
    ! es decir, una manera harto complicada de construir el cubo de n.
    ! sum_result=n*(n-1)+1+(n-1)*(n*(n-1)+1)+n*(n-1)
