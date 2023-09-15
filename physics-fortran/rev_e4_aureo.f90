! E4. Escribe un programa que calcule e imprima el valor de la razón áurea g = (1+sqrt(5))/2 y comprueba que tiene la propiedad de que (g+1)/g es igual que g. Para ello define una variable real (o de doble precisión), asigna el valor de la expresión anterior, e imprime tanto el valor de g como el de (g+1)/g. Imprime también el resultado de la condición lógica (g+1)/g == g. Explica el resultado obtenido.

! Algunas funciones que requieren argumentos reales no funcionan con enteros. Por ejemplo, en lugar de sqrt(5) debemos poner sqrt(5.0) ó simplemente sqrt(5.). Si lo que tenemos es una variable entera n, hacemos sqrt(real(n)).

program rev_e4_aureo
implicit none
    REAL :: aureo,propiedad
    LOGICAL :: cumple=.false.

    aureo=(1+sqrt(5.))/2
    propiedad=(aureo+1)/aureo
    ! Opción simple que funciona correctamente con REAL*8 y REAL en este caso:
    ! if(propiedad==aureo) cumple=.true.
    ! Opción avanzada para controlar el número de decimales que deben coincidir:
    ! print *, "Control:",abs(propiedad-aureo),1D-6 // Para controlar la aproximación.
    IF(abs(propiedad-aureo)<1E-8) cumple=.true.
    
    Print *, "###  PROGRAM: rev_e4_aureo - LFMA  ### "
    print *, "Razón áurea (1+sqrt(5.))/2 =",aureo
    print *, "Propiedad (g+1)/g =",propiedad
    print *, "¿Se cumple que la propiedad es igual a la razón áurea?",cumple
end 