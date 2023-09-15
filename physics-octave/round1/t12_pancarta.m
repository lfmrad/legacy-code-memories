% Tarea INF1 - EJ2 - Superficie Pancarta | Luis F. Martinez Andreu
function result=pancarta(boxlength,msg)
	% Calcula la suma de los cuadrados en blanco que forman el marco y de los que contienen letras.
	% *3 porque por cada letra en la fila, habrá uno en blanco arriba y otro debajo.
	% El +6 porque hay 3 blancos adicionales en cada lado completando el 'marco' de la pancarta.
	boxsnumber=length(msg)*3+6;
	% El resultado es el número de total de cuadros por la superficie de uno de ellos.
	disp('Superficie en cm2 que ocupa la pancarta rodeada con un marco en blanco:')
	result=boxsnumber*boxlength^2;
end