% e2_octave_mean_range - LUIS FERANANDO MARTINEZ ANDREU
% Para probar: x=[1 2 5 7 9]
function r=e2_octave_mean_range(x,a,b)
	% Respecto al programa escrito, puse && en lugar de & para implicar 'y'
	% pues no recordaba exactamente su sintaxis. Y en el programa escrito hab�a escrito 
	% x(:,1) para los rangos si el vector de entrada fuese una columna, pero he pensado
	% ahora que es m�s sencillo simplemente poner x(:) que funciona tanto si es una columna
	% para todas las filas o si es una s�la fila para todas las columnas.
	
	% Busca aquellos valores de x que son mayores o igugales a Y menores o iguales b
	range=find(x(:)>=a & x(:)<=b);
	
	% Obtiene la suma de los valores que est�n en el rango deseado [a,b]
	% Lo divide entre el n�mero de valores que est�n en ese rango 'length(range)'
	r=sum(x(range))/length(range)
end 