PROGRAM eclase_vectorespruebas
IMPLICIT NONE
    REAL :: v1(5)=(/ 10,20,30,40,50 /)
    integer :: k
    real :: b(5)=(/(k,k=5,1,-1)/)
    real :: espejo (10)
    
    print *, "**** Vectores Pruebas - Resuelto en clase ****"
    
    ! ------------------ PRUEBAS DE EXTRACCIÓ DE DATOS
    print *, "Pruebas de impresión"
    print *, v1
    !impresión de valor-posición
    print *, v1(3), v1(2+2)
    print *, b
    print *, b(2)
    b(2:4)=0 !asignar un subvector
    print *, b
    v1(3:1:-1) = b(3:5)+8
    print *, v1
    
    espejo(1:5)=v1
    espejo(6:10)=v1(5:1:-1)
    print *, "Espejo",espejo
  
END