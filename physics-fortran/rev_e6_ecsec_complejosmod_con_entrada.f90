! E6. Modifica el ejemplo ecsec-0.f90 para que detecte los casos en que la solución es compleja. En ese caso puede indicarlo y no hacer nada, o mejor, podemos calcular la parte real e imaginaria de las soluciones y mostrarlas. Primero haz el ejercicio sin utilizar variables de tipo complejo. Cuando funcione bien puedes simplificarlo usando variables complejas.

PROGRAM rev_e6_ecsec_complejosmod_con_entrada
implicit none 
    integer :: salida
    COMPLEX :: sol1,sol2,a,b,c,inroot
    
    print *,'### PROGRAM: rev_e6_ecsec_complejosmod_con_entrada - LFMA  ###'
    
    do while(salida/=1)
        a=input('Introduzca a: ')
        b=input('Introduzca b: ')
        c=input('Introduzca c: ')
        
        ! Uso REAL(inroot) puesto que no se puede comparar directamente un número complejo, y como en este caso 'inroot' sólo tiene parte real, lo único que hacer es extraerla para poder compararla.
        inroot=b**2-4*a*c
        if(real(inroot)<0) THEN
            print *,'La solucion es compleja: '
        else
            print *,'La solucion es real (ignora la parte imaginaria de las soluciones "0.000..." : '
        end if
        
        sol1=(-b+sqrt(inroot))/(2*a)
        sol2=(-b-sqrt(inroot))/(2*a)
        
        print *,'sol1 = ',sol1
        print *,'sol2 = ',sol2
        
        salida=input('Introduzca opcion (escriba "1" para salir o "2" para realizar otra operacion):  ')
    end do
    
contains
REAL function input(msg)
    character(LEN=*) :: msg
    write(*,'(A)',advance='no') msg
    read(*,*) input
end function

END