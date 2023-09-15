% Ejercicio propuesto en clase. 20121126 | Luis F. Mart�nez Andreu.
pol=input('Introduce los cocientes de P(x) de mayor a menor grado entre [ ... ]:');

%	He implementado la resoluci�n para los polinomios de 2� grado manualmente para comprobar
% si las ra�ces son reales o no e indicarlo. De todos modos, para no limitar su uso, he hecho que
% el programa resuelva sus ra�ces para cualquier otro grado usando la funci�n 'roots' de Octave 
% en su lugar.

disp('** Resolucion para polinomio de grado: '),disp(length(pol)-1)
if(length(pol)==3)
	% Paso los valores a variables para manipularlos m�s c�modamente.
	a=pol(1);b=pol(2);c=pol(3);
	
	% Calcula la parte de la ra�z de la ecuaci�n.
	raiz=b^2-4*a*c;
	
	% Indica si las soluciones ser�n o no reales como se ped�a.
	if(raiz<0)
	disp('> Las raices no son reales:')
	else
	disp('> La raices son reales:')
	end
	
	% Obtiene las soluciones, y como Octave trabaja con n�meros complejos, las resolver� en ambos casos.
	solucion1=(-b-sqrt(raiz))/(2*a)
	solucion2=(-b+sqrt(raiz))/(2*a)
else
	% Usa roots para cualquier otro grado.
	disp('Como el grado del polinomio es distinto de 2, resuelve con la funcion de Octave "roots":')
	roots(pol)
end
	

