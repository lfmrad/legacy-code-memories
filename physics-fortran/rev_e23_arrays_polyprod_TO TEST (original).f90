!E23. Escribe una funci�n para multiplicar polinomios cuyos coeficientes est�n !guardados en arrays. Por ejemplo, 5x**3-7 se representa como:
!real :: x(0:3) = (/ -7, 0, 0, 5 /)

PROGRAM e23_x_polinomios
implicit none
    integer :: i,j

    !Ejemplo realizado manualmente para comprobar que soluci�n es correcta y que el programa funciona ok.
    !pol1: 5x^3 -7
    !pol2: 4x^3 -2x^2 -3
    !resultado: 20x^6 -10x^5 -43x^3 +14x^2 +21
    
    !Aqu� se introducen los dos polinomios a multiplicar
    !de menor a mayor grado como especifica el ejercicio
    !aq�i se espefican las dimensiones del vector de 0:n porque
    !es m�s intuitivo a la hora de identificar el grado en las operaciones
    REAL :: pol1(0:3) = (/-7,0,0,5/)
    REAL :: pol2(0:3) = (/-3,0,-2,4/)
    
    ! Para asegurar que el vector resultado va a poder almacenar la soluci�n
    ! sumo el mayor grado de cada polinomio a multiplicar mediante SIZE
    ! del pol1 y pol2 y le resto 2 para corregir el que SIZE cuente a partir de 1.
    ! * La correcci�n de SIZE aparecer� varias veces a lo largo del programa
    ! para que los contadores del bucle funcionen correctamente.
    REAL :: polR(0:(SIZE(pol1)+SIZE(pol2)-2))=0
    
    ! Explicaci�n del sistema multiplicaci�n:
    ! 2 bucles anidados para poder multiplicar cada miembro de un vector
    ! por cada miembro del otro; la implementaci�n de la suma de sus potencias
    ! la realizo almcenando el resultado de la multiplicaci�n de los t�rminos
    ! en el t�rmino del vector resultado que es la suma de las potencias +
    ! lo que hab�a previamente ah� almacenado (que equivaldr�a al hecho de simplificar
    ! el resultado del polinomio sumando los t�rminos de mismo grado).
    do i=0,size(pol1)-1
        do j=0,size(pol2)-1
            polR(i+j)=polR(i+j)+pol1(i)*pol2(j)
        end do
    end do

    !apartado de impresi�n de los polinimios y el resultado de su multiplicaci�n
    print *, "**** e21 - Multiplicador de polinomios ****"
    PRINT *, "> Polinimio 1 a multiplicar:"
    call impresion(pol1)
    PRINT *, "> Polinimio 2 a multiplicar:"
    CALL impresion(pol2)
    PRINT *, "> Resultado de la multiplicaci�n de 1 y 2:"
    call impresion(polR)
    
contains 
    !creo una subrutina y no una funci�n, dado que no necesito que devuelva ning�n valor,
    !para usarla en la impresi�n porque quiero reutilizarla tanto para imprimir
    !los polinomios a multiplicar como el resultado de su multiplicaci�n
    subroutine impresion(v)
        real :: v(:)
        integer :: i
        
        ! Utilizo un do while porque he decidido imprimirlo al rev�s de modo que
        ! quede ordenado de mayor a menor grado y no se puede implimentar con
        ! un DO k=0 ... 
        i=size(v)
        do while (i>0)
            if (v(i)/=0) then
                !i-1 porque al pasar el vector como par�metro lo convierte a (1:n)
                !y quiero usar e imprimir el valor real del grado y no el del orden (1:n)
                if (i-1>0) then !la impresi�n del t�rmino + x^n cuando no es el T.I.
                    print *, v(i),"� x^",i-1,"+"
                else !la impresi�n del t�rmino independiente
                    print *, v(i)
                end if
            end if
        i=i-1
        end do
        !espaciado
        print *," "
    end subroutine 
END PROGRAM 