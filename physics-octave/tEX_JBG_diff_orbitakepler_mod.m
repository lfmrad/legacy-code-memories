% Resolver numéricamente la ecuación vectorial para el movimiento de los planetas alrededor del sol para dibujar
% la órbita de la Tierra(o el planeta deseado):
"Calculo de la orbita de la Tierra"
function r=orbitakepler(x,t)
	G=6.673*10^(-8);
	M=1.989*10^33;	
	R=sqrt(x(1)^2+x(2)^2);
	r(1)=x(3);
	r(2)=x(4);
	r(3)=-G*M*x(1)/R^3;
	r(4)=-G*M*x(2)/R^3;
end

x0=1.5*10^13;
y0=0;
vx0=0;
vy0=2*pi*x0/(365*24*60*60);
t=linspace(0,32536000,365);
orbita=lsode('orbitakepler',[x0,y0,vx0,vy0],t);

%Representacion gráfica de x frente a y.
axis([-1.8e+013,1.8e+013,-1.8e+013,1.8e+013])
hold on, grid on
plot(orbita(:,1),orbita(:,2))
title('Representacion de la orbita terrestre alrededor del Sol')
xlabel('x')
ylabel('y')
legend('orbita de la Tierra')