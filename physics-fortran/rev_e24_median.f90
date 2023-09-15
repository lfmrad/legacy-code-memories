! E24. Escribe una subrutina que calcule la mediana de los elementos de un array de reales.

    ! * Para probar la mediana de una serie de n números donde n es par.
    ! real :: test_par(1:6)=(/6,5,4,3,2,1/)
    ! * Para probar la mediana de una serie de n números donde n es impar.
    ! real :: test_impar(1:5)=(/5,4,3,2,1/)

PROGRAM rev_e24_median
implicit none
    REAL :: sample_even(1:6)=0
    real :: sample_odd(1:5)=0
    !real :: test_sample_even(1:6)=(/6,5,4,3,2,1/)
    !real :: test_sample_odd(1:5)=(/5,4,3,2,1/)
    logical :: fillr
    
    print *, '###  PROGRAM: rev_e24_median - LFMA  ###' 
    fillr=.true. ! Enable/disable fill with random numbers.
    
    call main(sample_even,fillr)
    call main(sample_odd,fillr)
    ! Disable 'CALL fillwithrand(a) before use them.
    ! call main(test_sample_even,fillr)
    ! call main(test_sample_odd,fillr)
    
contains
subroutine main(a,fillr)
    real :: a(:)
    integer :: i
    logical :: fillr

    print '(/,a,/,10f7.2)','### Initial data:',(a(i),i=1,size(a))
    if(fillr) CALL fillwithrand(a)
    CALL arrange(a)
    print '(a,/,f7.2)','Median:',median(a)
    
end subroutine
subroutine arrange(a)
    real :: a(:),aux
    integer :: i
    logical :: not_arranged=.true.
    
    i=1
    do while(not_arranged)
        if(a(i)>a(i+1)) then
            aux=a(i); a(i)=a(i+1); a(i+1)=aux;
            if(i>1) i=i-1
        else
            i=i+1
        end if
        if(i==size(a)) not_arranged=.false.
    end do   
    
    print '(a,/,10f7.2)','Arranged data:',(a(i),i=1,size(a))
end subroutine
function median(a)
    real :: median,a(:)
    integer :: d
    d=size(a)
    
    if(mod(d,2)==0) then
        median=(a(d/2)+a(d/2+1))/2
    else
        median=a((d+1)/2)
    end if
end function
subroutine fillwithrand(a)
    real :: a(:),rnd
    integer :: i
    
    call init_random_seed
    do i=1,size(a)
        call random_number(rnd)
        a(i)=rnd
    end do
    print '(a,/,10f7.2)','Filled with random numbers:',(a(i),i=1,size(a))
end subroutine
SUBROUTINE init_random_seed()
    INTEGER :: i, n, clock
    INTEGER, DIMENSION(:), ALLOCATABLE :: seed

    CALL RANDOM_SEED(size = n)
    ALLOCATE(seed(n))

    CALL SYSTEM_CLOCK(COUNT=clock)

    seed = clock + 37 * (/ (i - 1, i = 1, n) /)
    CALL RANDOM_SEED(PUT = seed)
    DEALLOCATE(seed)
    END SUBROUTINE
END

