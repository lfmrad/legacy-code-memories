%Tarea INF3 - EJ7.Fechas - LUIS FERANDO MARTÍNEZ ANDREU

function r=t37(plusdays)
	today=datenum(date);
	future=today+plusdays;
	r=datestr(future,'dd of mmmm, yyyy');
end