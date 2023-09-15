% Tarea INF1 - EJ1 - Fortunas | Luis F. Martinez Andreu
disp('**** Tarea INF1 - EJ1 - Fortunas | Luis F. Martinez Andreu ****')
clear all
% ---------- Inicialización de las variables.
dias_totales=100;
disp('> Fortunas iniciales (euros):')
A=5e6
B=4e6
C=3e6

% ---------- Operación diaria e impresión de sus valores.
disp('> Evolucion de las fortunas con el paso de los dias:')
for dia=1:dias_totales
	% A le traspasa a B la mitad de su fortuna.
	A=A/2; B=B+A; 
	% B le traspasa a C la mitad de su (nueva) fortuna.
	B=B/2; C=C+B;
	% C marcha a casa de A para donarle la mitad de su (nueva) fortuna.
	C=C/2; A=A+C;
	% Almacena la fortuna para cada día de modo que luego se pueda representar gráficamente su evolución.
	hisA(dia)=A;
	hisB(dia)=B;
	hisC(dia)=C;
	
	% Impresión según los requerimientos de la tarea: durante los primeros 10 días y cada 10 a partir de entonces.
	% Cond: imprime sólo si el día es menor o igual a 10 o si el resto del día/10 es igual a 0, para hacerlo cada 10 días.
	if(dia<=10|rem(dia,10)==0)
		dia
		A
		B
		C
		format long
	end	
end

% ---------- Representación gráfica de la evolución de las fortunas respecto a los días.
% Defino un vector con el nº total de días para hacer la representación.
x=[1:1:dias_totales];
% Para poder representar varias funciones con respecto a la misma variable en la misma gráfica.
hold on
plot(x,hisA(x),'r')
plot(x,hisB(x),'g')
plot(x,hisC(x),'b')
title('Evolucion de las fortunas en funcion de los dias.       Ref.: A (rojo), B (verde) y C (azul).')
xlabel('Dia')
ylabel('Fortunas (euros)')
disp('> La representacion grafica se debe haber abierto.')
