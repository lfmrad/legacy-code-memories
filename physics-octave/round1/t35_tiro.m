'Tarea INF3 - EJ5.Proyectil - LUIS FERANDO MARTINEZ ANDREU'

clear all
function r=xaxis(ini,t)
	k=1.05; m=0.7;
	r(1)=ini(2);
	r(2)=-k*ini(2)/m;
end

function r=yaxis(ini,t)
	k=1.05; m=0.7;g=9.8;
	r(1)=ini(2);
	r(2)=-g-k*ini(2)/m;
end

V_ini=10; %m/s
angle=45; %degrees
Vx0=V_ini*cosd(angle);
Vy0=V_ini*sind(angle);
pos0=0; 
t=linspace(0,2,100);
rx=lsode('xaxis',[pos0,Vx0],t);
ry=lsode('yaxis',[pos0,Vy0],t);

hold on
grid
axis([0,4,0,2])
plot(rx(:,1),ry(:,1))
	xlabel('x (m)');
	ylabel('y (m)');
	title('Gráfica (x,y)');


