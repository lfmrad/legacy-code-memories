'###  PROGRAM: rev_t410_anomalia - LFMA'
clear all,clf

% ### Entrada de datos:
	% ecc=input('Introduzca la excentricidad: ')
	% a=input('Introduzca el semieje mayor: ')
	% t=input('Introduzca el numero de dias transcurridos desde el perihelio: ')
	% sol.: E=13.03 grados
	ecc=0.016700
	a=1
	t=13

% ### Método gráfico: 
	% Conversión de datos a rad para poder operar correctamente:
	M=0.9856076686*t*a^(-3/2);  % grados de anomalía media
	Mrad=M*pi/180;  			% radianes de anomalía media
	
	E=0:0.01:360; 				% grados de anomalía excéntrica
	Erad=E*pi/180; 				% radianes de anomalía excéntrica
	
	% Método para obtener E:
	% 1. E = M + e*sin(E)
	% 2. (E-M)/ecc = sin(E)
	% 3. y1 = (E-M)/ecc | y2 = sin(E)
	y1=(Erad-Mrad)/ecc; y2=sin(Erad);
	% Por tanto, busco el E que haga y1=y2
	% Respuesta: donde y1 e y2 se corten entre sí.
	% ¿Cómo? % Método JBG: Explicación abajo *
	pto_corte=find( abs(y1-y2)==min(abs(y1-y2)) ); 
	resultado_E_por_metodo_grafico=E(pto_corte)

	% Representación gráfica:
		% plot(E,y1,"r",E,y2,"g")
		hold on
		% axis([0 360 -1 1])
		axis([0 2*pi -1 1])
		plot(Erad,y1,"r",Erad,y2,"g"); 
		
		title("Anomalia E por metodo grafico");
		grid on, xlabel("E [rad]");
		legend('sin(E)','(E-M) / ecc')

% * Cuando queremos buscar y1=y2 el principal problema que surge es que dado que las funciones son discretas es casi imposible que coincidan exactamente en alguno de sus valores, impidiendo hacer simplemente: pto_corte(find(abs(y1-y2)==0). No obstante, se puede solucionar utilizando la misma idea pero haciendo que sean 'casi' iguales con una tolerancia como está descrito arriba, y que se puede entender de esta forma: busca y dime donde la diferencia entre las dos funciones {abs(y1-y2)} es igual a la mínima diferencia entre las dos funciones (la más cercana a 0) {min(abs(y1-y2)} para todos sus valores. Con el índice que nos devuelve, sólo tenemos que sustuir en en E para obtener su valor.