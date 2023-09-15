'###  PROGRAM: rev_tEX_diff_orbitakepler - LFMA'
clear all, clf

% ecu.diff. mr=-G Mmr/r^3
% descomposición en componentes:
% X: x = Vx
%	Vx = -GMx/r^3
% Y: y = Vy
%   Vy = -GMy/r^3

global G M
G=6.673E-8; M=1.989E33; 

% r=[x vx y vy]
function r=orbit(ini,t)
	global G M
	R=sqrt(ini(1)^2+ini(3)^2); 
	r(1)=ini(2);
	r(2)=-G*M*ini(1)/R^3;
	r(3)=ini(4);
	r(4)=-G*M*ini(3)/R^3;
end

% condiciones iniciales:
	x0 = 1.5E13;
	y0 = 0;
	vx0 = 0;
	vy0 = 2*pi*x0/(365*24*60*60);
	t=linspace(0,32536000,1000);
	
orbita_kepler=lsode('orbit',[x0,vx0,y0,vy0],t);

hold on
axis([-1.8e+013,1.8e+013,-1.8e+013,1.8e+013])
plot(orbita_kepler(:,1),orbita_kepler(:,3),'r',0,0,'.')
	title('Orbita de la Tierra alrededor del Sol:')
	grid on,xlabel('x'),ylabel('y')
	legend('Orbita Tierra','Sol')