'e3_octave_lorenz - LUIS FERANDO MARTINEZ ANDREU'
clear all,clf % Limpia las variables y la representación gráfica.
% NOTA: en clase daba un error al realizar la representación gráfica
% pero era general de Octave y no un problema particular de mi programa.

% Defino las variables globales que utilizaré posterioromente.
global a b c
a=-8/3;b=-10;c=28;

% Planteo las ecu. diff. para resolverla con 'lsode'
function r=diff(ini,t)
	% Llamo a las variables globales.
	global a b c
	r(1)=a*ini(1)+ini(2).*ini(3);
	r(2)=b.*(ini(2)-ini(3));
	r(3)=-ini(1).*ini(2)+c*ini(2)-ini(3);
end

% Defino los parámetros inicicales que le enviaré con 'lsode'
x0=y0=z0=1;
ini=[x0,y0,z0];
t=0:0.01:100;

% Resuelvo las ecuaciones diferenciales. Quedará: r=[X Y Z]
r=lsode('diff',ini,t);

% Realizado las dos presentaciones gráficas que se piden:
subplot(2,1,1);plot(t,r(:,2),'r') %t,Y % Y=r(:,2)
	grid on,title('Y frente a t'),xlabel('t(días)'),ylabel('Y')
subplot(2,1,2);plot(r(:,1),r(:,2),'g') %X,Y (Y frente a X) % X=r(:,1)
	grid on,title('Y frente a X (mariposa)'),xlabel('X'),ylabel('Y')