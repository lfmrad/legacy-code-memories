'###  PROGRAM: rev_t35_diff_tiro - LFMA  ###'

% Ec. diff. inicial: m*a = -m*g[j]-k(vx[i]+vy[j])
% Descomposición en componentes y respectivos cambios de variable:

% X: m*ax=-k*vx -> m*vx'=-k*vx -> x' = vx
%							      vx'= -k*vx/m

% Y: m*ay=-m*g-k*vy -> m*vy'=-m*g-k*vy - > y' = vy
%									       vy'= -g-k*vy/m

clear all; clf;
format bank;
global k m g
k=1.05; m=0.7; g=9.8;

% función con r=[x y vx vy]
function r=proyectil(ini,t)
	global k m g
	r(1)=ini(3); % x' = vx
	r(2)=ini(4); % y' = vy
	r(3)=-k*ini(3)./m; % vx'= -k*vx/m
	r(4)=-g-k*ini(4)./m; % vy'= -g-k*vy/m
end

% *** Condiciones iniciales:
	v0=10;
	angle=45;
	x0=y0=0;
	vx0=v0*cosd(angle);
	vy0=v0*sind(angle);
	ini=[x0,y0,vx0,vy0];

	t=linspace(0,3,500);
	
% *** Resolución numérica con 'lsode':
r=lsode('proyectil',ini,t);

% *** Alcance para delimitar la representación gráfica:
% Introduce en 'above' los subíndices de todos los valores de y, es decir: r(:,2)
% que sean >=0. La idea es tener un vector que me sirva para representar la función
% desde que se dispara el proyectil hasta que cae al suelo exclusivamente.
above=find(r(:,2)>=0);
% Obtiene el alcance. Como el último subíndice guardado en above es el que se refiere
% a la última y=0 que es cuando toca el suelo, para ese mismo subíndice encontraremos
% la x del alcance (cuando y se hace precisamente 0).
xmax=r(length(above),1)
ymax=max(r(:,2))

	% Método contrario (almacenando las que quedan debajo de suelo)
	% pero que presenta problemas al implementar la rep. gráfica.
	% metaindex=find(r(:,2)<0);
	% index_y0=metaindex(1)
	% xmax=r(index_y0,1)

% Representación gráfica:
hold on
% Dibuja todos los subíndices que están por encima de 0 (mientras el proyectil sube
% y cae) de y{r(above,2)} para sus respectivas x{r(above,1)}.
subplot(2,1,1),plot(r(above,1),r(above,2),'r')
	title('Trayectoria del proyectil')
	grid on,xlabel('x(m)'),ylabel('y(m)')
subplot(2,1,2),plot(t(above),r(above,2),'g')
	title('Altura del proyectil en funcion de t')
	grid on,xlabel('x(m)'),ylabel('t(s)')

