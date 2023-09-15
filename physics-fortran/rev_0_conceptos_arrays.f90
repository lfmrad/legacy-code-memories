! Recuerdo que en FORTRAN, cuando defino un array 'x(10)' dispondr� de 10 variables, no 11 (como en C -desde 0) puesto que ir� desde el 1 hasta el 10.
! Puedo crear arrays de hasta 7 �ndices.... 
! Puedo consultar las dimensiones de un array 'm' mediante 'shape(m)' cuyo resultado ser� otro array de entero con el # de elementos x dimensi�n.
    ! El n�mero de elementos de m en la dimensi�n k se obtiene: 'size(m,k)' Si s�lo tiene 1 dimensi�n: 'size(m)'
    
! Necesitar� usar bucles anidados para recorrer un array de m�s de una dimensi�n.
! Es necesario inicializarlos (como las variables)... ej: INTEGER :: y(2,3)=0
! Tambi�n se puede contruir expl�citamente un array:
! real ::z(4) = (/1.,-2.,-7.,8./) o integer :: v(5) = (/ 3*k+1, k=1,5/)

! Los ar pueden pasarse como argumentos a funciones y ser devueltos como resultado.
! Si se env�a un array a una subrutina y se modifica, el original tambi�n quedar� modificado en mem.

PROGRAM rev_e20_arrays_product
implicit none
    integer :: k,i,j,x,suma
    real :: q=1,w=2,e=3
    
    ! *** Construcci�n de arrays vac�os de determinada dimensi�n.
    integer :: a_n(3) = 0
    ! (rows,columns)
    real :: a_nxm(3,4) = 0
    ! *** Construcci�n especial (�til para reproducir funciones f(x)=x^2 ...etc
    ! Construye un array almacenando outputs de f(k)=3*k+1 desde k=1 a k=5
    ! El rango de k va a limitar lo grande que deba ser el array, si k=1,5 -> v(5)
    integer :: v(5) = (/ (3*k+1, k=1,5) /)
    ! Construye un array almacenando outputs de f(k)=k desde k=1 a k=5, con salto -1
    integer :: b(5)=(/(k,k=5,1,-1)/)
    integer :: fancy(4)=(/ (x**2,x=1,4,1) /)
    ! *** Construcci�n de array de forma manual est�ndar.
    real :: z(4) = (/1.,-2.,-7.,8./)
    integer :: arr(10) = (/ 1,2,3,4,5,11,12,13,14,15 /)
    real :: a(10) =(/ 1,2,3,4,5,11,12,13,14,15 /)
    
    print *, '###  ARRAYS ###'   
    ! Se puede imprimir arrays directamente... 
    ! Los arrays se pueden imprimir con print *, pero si son de varias dimensiones se muestra toda la colecci�n de datos obtenida �concatenando las columnas, no las filas!
    print *, '** Impresiones de ARRAYS'
        print *, 'De construcci�n dimensional:'
        print *, a_n
        print *, a_nxm
        
        print *, 'De construcci�n manual:'
        print '(F6.2)',z
        
        print *, 'De construcci�n especial:'
        print *,b
        print *,v
        print *,fancy
    
    print *, '** Operaciones con ARRAYS'
        ! Recorrer bucle de 2 dimensiones...
        !~ do i=1,size(a_nxm,1)
            !~ DO j=1,size(a_nxm,2)
                !~ print *, a_nxm(i,j)
            !~ end do
        !~ end do
        
        ! Suma manual de elementos de un array...
        suma=0
        do i=1,size(arr,1)
            suma=suma+arr(i)
        end do
        ! Utilizando el potencial de Fortran la obtendr�amos con sum(arr)
        print *,"La suma de 'arr' es: ",suma,sum(arr)
        ! Muchas operaciones sobre variables individuales funcionan tambi�n sobre arrays de tama�o compatible. Como ejemplo:
        print *, '** Impresi�n avanzada usando WRITE'
        ! IMPRESI�N ULTRA �TIL
        ! * (escr�belo en pantalla),1(etiqueta format) dato,dato,dato
        ! 1 (etiqueta) FORMAT (txt,n�entidadesimpF7.2,saltolinea,txt,f5.2)
        write(*,1) 'La suma de',( a(i),i=size(a),1,-1 ),'es igual a',desv(a)
        1 format (a,10f7.2,/,a,f5.2)
        ! or.... 
        print '(a,10f7.2,/,a,f5.2)','La suma de',( a(i),i=size(a),1,-1 ),'es igual a',desv(a)


contains
function media(a)
    real :: media,a(:)
    media=sum(a)/size(a,1)
end function

function desv(a)
    real :: desv,a(:)
    desv=sqrt(media( (a-media(a))**2 ))    
end function      
END

  
!~ END