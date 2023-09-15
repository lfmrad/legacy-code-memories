! E20. Escribe una función my_dot que calcule el producto escalar de dos vectores. Intenta evitar el uso de bucles. Comprueba que obtiene el mismo resultado que la función "dot_product" propia de Fortran.

PROGRAM rev_e20_arrays_product
implicit none
    integer :: i
    real :: v1_3(3)=(/ (i**2,i=1,3) /)
    real :: v2_3(3)=(/ 1,2,3 /)
    real :: v3_4(4)=(/ (i,i=4,1,-1) /)
    real :: v4_4(4)=(/ (i,i=1,4) /)
    
    print *, '###  PROGRAM: rev_e20_arrays_product - LFMA  ###'   
    
    print '(a,3f7.2,/,a,3f7.2,/,a,4f7.2,/,a,4f7.2)',"v1_3 =",v1_3, "v2_3 =",v2_3,"v3_4 =",v3_4,"v4_4 =",v4_4
    
    !or
    !print '(a,f7.2)',"v1_3 =",(v1_3(i),i=1,3,1)
    !write (*,1) "v1_3 =",(v1_3(i),i=1,size(v1_3))
    !1 format (a,3f7.2)
    
    print '(a,/,a,f7.2,/,a,f7.2)',"** 'dot_product':","v1_3 x v2_3 =",dot_product(v1_3,v2_3),"v1_3 x v2_3 =",dot_product(v3_4,v4_4)
    print '(a,/,a,f7.2,/,a,f7.2)',"** Mi función:","v1_3 x v2_3 =",myscapro(v1_3,v2_3),"v3_4 x v4_4 =",myscapro(v3_4,v4_4)
    ! No es posible porque para hacer el producto escalar necesito que sean de la misma dimensión.
    ! print '(a,/,f7.2)',"** v1_3 x v3_4",dot_product(v1_3,v3_4)
    
contains
function myscapro(a1,a2)
    real :: myscapro,a1(:),a2(:)
    
   myscapro=sum(a1*a2)  
    

end function


END