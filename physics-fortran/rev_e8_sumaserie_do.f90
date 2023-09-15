! E8: Utiliza un bucle do para calcular la suma de una serie. Por ejemplo: sum{k=0..10} 1/2^k

PROGRAM rev_e8_sumaserie_do
implicit none
    integer :: b,k
    REAL :: r=0
    
    b=10
    
    do k=0,b
        r=r+1./2**k
    end do
    
    print *, '###  PROGRAM: rev_e8_sumaserie_do - LFMA  ###'    
    print '(A I2 A F6.3)', 'sum{k=0..',b,'} 1/2^k =',r
END