% Tarea INF1 - EJ1 - Fortunas | Luis F. Martinez Andreu
disp('**** Tarea INF1 - EJ1 - Fortunas | Luis F. Martinez Andreu ****')
clear all
% ---------- Inicializaci�n de las variables.
dias_totales=100;
disp('> Fortunas iniciales (euros):')
A=5e6
B=4e6
C=3e6

% ---------- Operaci�n diaria e impresi�n de sus valores.
disp('> Evolucion de las fortunas con el paso de los dias:')
for dia=1:dias_totales
	% A le traspasa a B la mitad de su fortuna.
	A=A/2; B=B+A; 
	% B le traspasa a C la mitad de su (nueva) fortuna.
	B=B/2; C=C+B;
	% C marcha a casa de A para donarle la mitad de su (nueva) fortuna.
	C=C/2; A=A+C;
	% Almacena la fortuna para cada d�a de modo que luego se pueda representar gr�ficamente su evoluci�n.
	hisA(dia)=A;
	hisB(dia)=B;
	hisC(dia)=C;
	
	% Impresi�n seg�n los requerimientos de la tarea: durante los primeros 10 d�as y cada 10 a partir de entonces.
	% Cond: imprime s�lo si el d�a es menor o igual a 10 o si el resto del d�a/10 es igual a 0, para hacerlo cada 10 d�as.
	if(dia<=10|rem(dia,10)==0)
		dia
		A
		B
		C
		format long
	end	
end

% ---------- Representaci�n gr�fica de la evoluci�n de las fortunas respecto a los d�as.
% Defino un vector con el n� total de d�as para hacer la representaci�n.
x=[1:1:dias_totales];
% Para poder representar varias funciones con respecto a la misma variable en la misma gr�fica.
hold on
plot(x,hisA(x),'r')
plot(x,hisB(x),'g')
plot(x,hisC(x),'b')
title('Evolucion de las fortunas en funcion de los dias.       Ref.: A (rojo), B (verde) y C (azul).')
xlabel('Dia')
ylabel('Fortunas (euros)')
disp('> La representacion grafica se debe haber abierto.')
