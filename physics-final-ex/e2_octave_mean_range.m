% e2_octave_mean_range - LUIS FERANANDO MARTINEZ ANDREU
% Para probar: x=[1 2 5 7 9]
function r=e2_octave_mean_range(x,a,b)
	% Respecto al programa escrito, puse && en lugar de & para implicar 'y'
	% pues no recordaba exactamente su sintaxis. Y en el programa escrito había escrito 
	% x(:,1) para los rangos si el vector de entrada fuese una columna, pero he pensado
	% ahora que es más sencillo simplemente poner x(:) que funciona tanto si es una columna
	% para todas las filas o si es una sóla fila para todas las columnas.
	
	% Busca aquellos valores de x que son mayores o igugales a Y menores o iguales b
	range=find(x(:)>=a & x(:)<=b);
	
	% Obtiene la suma de los valores que están en el rango deseado [a,b]
	% Lo divide entre el número de valores que están en ese rango 'length(range)'
	r=sum(x(range))/length(range)
end 