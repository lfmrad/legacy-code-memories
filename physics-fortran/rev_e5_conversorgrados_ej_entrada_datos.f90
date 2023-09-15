! E5. Escribe un programa que convierta grados cent�grados en grados Fahrenheit. (Puedes almacenar el dato de entrada directamente en una variable.)
! http://en.wikipedia.org/wiki/Temperature_conversion_formulas

program rev_e5_conversorgrados_ej_entrada_datos
implicit none
    ! Para pruebas de entrada de datos en consola y l�nea de �rdenes.
    ! REAL :: a,b
    ! EJEMPLO ACTIVO: ENTRADA DE DATOS DESDE CONSOLA:
    REAL :: selector,aconvertir,output,salir
    print *, '###  PROGRAM: rev_e5_conversorgrados_ej_entrada_datos - LFMA  ###'    
    do while (salir/=1)
        selector=0
        DO WHILE (selector/=1 .and. selector /=2)
        selector=input("Introduzca '1' para grados C->F o '2' para grados F->C: ")
        end do
        
        if(selector==1) THEN
            aconvertir=input('Introduzca valor en grados C a convertir: ')
             ! conversor C�-Fahr
            output=1.8*aconvertir+32
            print '(A F5.1)','...son en grados F = ',output
        else
            aconvertir=input('Introduzca valor en grados F a convertir: ')
            ! conversor Fahr-C�
            output=(aconvertir-32)/1.8
            print '(A F5.1)','...son en grados C = ',output
        end if
    salir=input('Escriba 1 si desea salir del programa o cualquier otro numero si desea realizar otra conversion:  ')
    END DO

    ! ENTRADA DE DATOS EN L�NEA DE �RDENES: input_lo
        ! ej: >rev_e5_conversorgrados_ej_entrada_datos 1 2 // 1 y 2 ir�an a a y b
        !~ a=input_lo(1)
        !~ b=input_lo(2)
        !~ print '(A F5.2 A F5.2)', 'Una solucion es',a,'  y la otra es',b
        
    ! ENTRADA DE DATOS DESDE CONSOLA: input
        !~ a=input('Introduce a:')
        !~ b=input('Introduce b:')
        !~ print '(A F5.2 A F5.2)', 'Una solucion es',a,'  y la otra es',b
        !~ ! Para no cerrar el programa despu�s de acabar si se ejecuta en consola.
        !~ WRITE (*, '(A)',ADVANCE='no') 'Pulsa cualquiera tecla para terminar...'
        !~ reaD (*,*) 

    ! MANEJO DE PRINT CON FORMATO AVANZADO
    ! 'print' con opciones de formato: > cadena: A;      integer: Iw; real: Fw.d
    ! w=ancho deseado (n�mero de decimales + un espacio por el punto + unidad)
    ! d=n�mero de decimales deseado
    ! ej: print '(A F5.2 A F5.2), "Una soluci�n es",a,"  y la otra es",b

contains
! ENTRADA DE DATOS DESDE CONSOLA: input
function input(msg)
    ! Se adapta autom�ticamente al tama�o de la cadena
    ! que se le env�a como par�metro.
    character(LEN=*) :: msg
    real :: input
    ! Imprime msg y espera a que el usuario introduzca el valor a continuaci�n.
    write (*,"(A)",advance='no') msg
    reaD (*,*) input
end FUNCTION

! ENTRADA DE DATOS EN L�NEA DE �RDENES: input_lo
function input_lo(n)
    integer :: n
    real :: input_lo
    character*30 :: aux
    call getarg(n,aux)
    read (aux,*) input_lo
end function
end
