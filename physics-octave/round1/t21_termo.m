'TAREA INF2 - EJ3_Termodinamica - Luis F. Martinez Andreu.'

clear all
% *************************** FUNCIONES 
% Func(t) Variación de entalpía.
function r=y1(t)
	r=-98900-3.9*(t-298);
end

% Func(t) Variación de entropía.
function r=y2(t)
	r=-94-3.9*log(t/298);
end

% Func(t) de la cual se necesita encontrar la raíz para obtener la temperatura
% a partir de la cual la reacción deja der espontánea.
function r=y12(t)
	r=y1(t)-t*y2(t);
end

disp('Reaccion: SO_2 + 1/2 O_2 -> SO_3')
% *************************** FSOLVE 
disp('# Temperatura en K a partir de la cual la reaccion deja de ser espontanea:')
% Inicializo con t0>0 porque la Tª es en Kelvin y las eq. no respoderán con coherencia física para val. inferiores
% y resultado no tendrá sentido.
fsolve('y12',1)

% A usar en caso de que se quieran comprobar los datos adicionales de 'fsolve':
% [x, fvec, info, output, fjac]=fsolve('y12',1)
% info=1 -> solución converge.

% *************************** GRÁFICAS 
% Vector para la representación gráfica en el rango de 250-1250K exigido.
t=linspace(250,1250,1000);
% Uso subplot en lugar de representarlas juntas para que se aprecien mejor sus tendencias puesto que
% de otra manera la entalpía parece una constante cuando no lo es.
% Para comprobarlo: no usar subplot y configurar los ejes así (automáticamente no muestra ambas): 
% axis([200,1400,-120000,20000])
rn=2; hold on; 
subplot(rn,1,1), plot(t,y2(t),'g'), 
	title('Variaciones de entalpia y entropia de la reaccion en el intervalo t=[250,1250]')
	grid,axis([250,1250]) % Para visualizar mejor la representación.
	legend('Entalpia: y1(t)=-98900-3.9*(t-298)')
	xlabel('Temperatura (K)')
	ylabel('Entalpia')
subplot(rn,1,2), plot(t,y1(t),'r'), 
	grid,axis([250,1250])
	legend('Entropia: y2(t)=-94-3.9*log(t/298)')
	xlabel('Temperatura (K)')
	ylabel('Entropia')
disp('# Las representaciones graficas se deben haber abierto.')