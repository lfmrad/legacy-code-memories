'TAREA INF4 - EJ12_Oscilador - Luis F. Martinez Andreu.'
clear all; clf;

% ***************** PREPARACIÓN DE DATOS PARA LSODE
% ecu. dif: m(d2x/dt2)+n(dx/dt)+kx=F0cos(wt)
% cambio variable: mx''+nx'+kx=F0cos(wt)
% 				   mv'+nv+kx=F0cos(wt)
% 		x'=v
% 		v'=(F0cos(wt)-nv-kx)/m

% ***************** FUNCIONES A RESOLVER
% Oscilador armónico sin amortiguamiento.
function r=osc_sin(ini,t)
	F0=0;  % Parámetro para que no tenga amortiguamiento.
	n=0; k=0.4; m=0.1;
	w0=sqrt(k/m); fs=w0*t;
	r(1)=ini(2);
	r(2)=(F0*cos(fs)-n*ini(2)-k*ini(1))/m;
end
% Oscilador forzado con F0=0.5.
function r=osc_fr(ini,t)
	F0=0.5; % Parámetro: forzado.
	n=0; k=0.4; m=0.1; 
	w0=sqrt(k/m); fs=w0*t;
	r(1)=ini(2);
	r(2)=(F0*cos(fs)-n*ini(2)-k*ini(1))/m;
end

% ***************** RESOLUCIÓN
t=linspace(0,7,100);
% Los distintos valores x0 propuestos que he demostrar que no afectan a la w0.
x0_1=4; x0_2=1; x0_3=-2;
v0=0;
% Resuelvo la ecus. para cada una de las x0.
% Oscilador libre sin amortiguamiento. 
rx01 = lsode('osc_sin',[x0_1,v0],t);
rx02 = lsode('osc_sin',[x0_2,v0],t);
rx03 = lsode('osc_sin',[x0_3,v0],t);
% Oscilador forzado F0=0.5.
rfrx01 = lsode('osc_fr',[x0_1,v0],t);
rfrx02 = lsode('osc_fr',[x0_2,v0],t);
rfrx03 = lsode('osc_fr',[x0_3,v0],t);

% ***************** REPRESENTACIÓN GRÁFICA
hold on; 
% Oscilador sin amortiguamiento.
subplot(2,1,1), plot(t,rx01(:,1),'r',t,rx02(:,1),'g',t,rx03(:,1),'b')
	title('Oscilador sin amortiguamiento (F=0)'), grid on 
	legend('x0=4','x0=1','Sx0=-2'),ylabel('x'),xlabel('t')
% Oscilador forzado.
subplot(2,1,2), plot(t,rfrx01(:,1),'r',t,rfrx02(:,1),'g',t,rfrx03(:,1),'b')
	title('Oscilador forzado (F=0.5)'), grid on
	legend('x0=4','x0=1','Sx0=-2'),ylabel('x'),xlabel('t')

disp('Las representaciones graficas se deben haber abierto.')