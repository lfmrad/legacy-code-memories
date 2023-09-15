! E23. Escribe una funci�n para multiplicar polinomios cuyos coeficientes est�n guardados en arrays. Por ejemplo, 5x**3-7 se representa como:

! real :: x(0:3) = (/ -7, 0, 0, 5 /)
! (Los �ndices de un array normalmente empiezan en 1, pero este valor se puede cambiar. En este caso conviene empezar en cero. La funcion lbound nos da el primer �ndice de un array, y ubound el �ltimo.)

    !Ejemplo realizado manualmente para comprobar que soluci�n es correcta y que el programa funciona ok.
    !pol1: 5x^3 -7
    !pol2: 4x^3 -2x^2 -3
    !resultado: 20x^6 -10x^5 -43x^3 +14x^2 +21

PROGRAM rev_e23_arrays_polyprod
implicit none
    integer :: a1(4)=(/-7,0,0,5/)
    integer :: a2(4)=(/-3,0,-2,4/)
    
    print *, '###  PROGRAM: rev_e23_arrays_polyprod - LFMA  ###' 
    
    ! Para que imprima las cabeceras y t�tulos de cada impresi�n:
    ! 1 (primer t�rmino a multiplicar) 2(segundo) 3(resultado)
    call printer(a1,1)
    call printer(a2,2)
    call printer(polyprod(a1,a2),3)
    
contains
function polyprod(a1,a2)
    integer :: a1(:),a2(:),i,j
    ! El tama�o de polyprod: grado de a1+grado de a2+1t�rmino indp
    ! size(a1) y incluye 1ti. Por tanto, luego size(a2)-1
    integer :: polyprod(size(a1)+size(a2)-1)

polyprod=0
    do i=1,size(a1)
        do j=1,size(a2)
                ! El uso del -1 es porque dado que al sumarse la posici�n 1+1 (t�rmino indp.)
                ! se quedar�a vac�o en polyprod(1) empezando en (2) y necesitar�amos un �ndice
                ! extra para poder llenar el vector, sin embargo, as� se corrige el problema:
                ! adelantando todos los t�rminos un �ndice.
                polyprod(i+j-1)=polyprod(i+j-1)+a1(i)*a2(j)
        end do
    end do
end function

subroutine printer(a,option)
    integer :: a(:),i,option
    
    if(option==1) then
        print *,('(se leen de mayor a menor grado)')
        print *,('Al multiplicar el polinomio,')
    elseif(option==2) then
        print *,('por el polinomio,')
    elseif(option==3) then
        print *,('se obtiene:')
    end if
    
    print '(10i5)', (a(i),i=size(a),1,-1)
    ! Para imprimir el grado de cada t�rmino debajo:
    ! print '(10i5)', (i,i=size(a)-1,0,-1)
end subroutine

END

