'TAREA INF4 - EJ11_Taylor - Luis F. Martinez Andreu.'
clear all; clf; 

% Valor de prueba:
x=0.9;

% ***************** C�LCULO DE LA SERIE
% Serie de Taylor (-1)^(n+1)*(x^n)/n 
N=100; % N�mero de t�rminos con los que quiero probar.
n0=1; % i=1
% Inicio el 1� t�rmino del sumatorio fuera del bucle para poder,
% dentro de �l, ir sum�ndole el valor anterior (n-1) del vector
% (en el que voy a ir almacenando los resultados del sumatorio) sin
% problemas debido a que si lo iniciase dentro no existir�a (n-1).
% El motivo de almacenar el valor actual de la suma de la serie para 
% cada N en un vector es poder representar luego gr�ficamente su convergencia.
serie(n0)=(-1)^(n0+1)*(x^n0)/n0;
for n=n0+1:N
	% Almacena en serie el resultado actual + el anterior (sumatorio).
	serie(n)=serie(n-1)+(-1)^(n+1)*(x^n)/n;
end

% ***************** RESULTADOS
disp('Resultado de la serie de Taylor { (-1)^(n+1)*(x^n)/n } para'),N
% El �ltimo valor de serie, N; es el total del sumatorio:
convergencia_serie=serie(N)
% Compara con el resultado de referencia.
disp('Referencia: ln(1+x)')
ref=log(1+x)

% ***************** REPRESENTACI�N
disp('Espere a que se cargue la representacion...');
% Utilizo 'line' para poder representar el valor de referencia como una cte. 
% en la gr�fica y poder ver c�mo la serie tiende a �l cuando N tiende a inf.
line=ref*ones(N);
hold on; grid on;
plot(serie,'b');
plot(line,'r');
	legend('(-1)^(n+1)*(x^n)/n)','Referencia: ln(1+x)')
	title('Evolucion de la serie de Taylor: (-1)^(n+1)*(x^n)/n ')
	xlabel('n')
	ylabel('Evolucion de la serie y referencia:');

disp('La representacion grafica se debe haber abierto. *Ampliar con el boton derecho para observar el detalle de la convergencia.')


