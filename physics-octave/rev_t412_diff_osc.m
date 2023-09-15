% Arreglo de la ecu. diff.
% ma + v + kx = F0cos(wt)
% mv' + nv + kx = F0cos(wt)
% x' = v
% v' = ( F0cos(wt)-kx-nv )/m

'###  PROGRAM: rev_t412_diff_osc - LFMA'
clear all, clf

global m n k w
m=0.1; k=0.4; n=0; w=sqrt(k/m);

% r=[A v]
function r=osc_l(ini,t)
	global m k n w
	F0 = 0;
	r(1) = ini(2);
	r(2) = ( F0*cos(w*t)-k*ini(1)-n*ini(2) )/m;
end

function r=osc_f(ini,t)
	global m k n w
	F0 = 0.5;
	r(1) = ini(2);
	r(2) = ( F0*cos(w*t)-k*ini(1)-n*ini(2) )/m;
end

% Condiciones iniciales:
	x0_1 = 4;
	x0_2 = 1;
	x0_3 = -2;
	v0 = 0;
	t = linspace(1,7,100);

olx_1 = lsode('osc_l',[x0_1,v0],t);
olx_2 = lsode('osc_l',[x0_2,v0],t);
olx_3 = lsode('osc_l',[x0_3,v0],t);

ofx_1 = lsode('osc_f',[x0_1,v0],t);
ofx_2 = lsode('osc_f',[x0_2,v0],t);
ofx_3 = lsode('osc_f',[x0_3,v0],t);

hold on
subplot(2,1,1),plot(t,olx_1(:,1),'r',t,olx_2(:,1),'g',t,olx_3(:,1),'b')
	title('Oscilador libre (F = 0)'),grid on
	legend('x0=4','x0=1','x0=-2'),ylabel('Amplitud'),xlabel('t')
subplot(2,1,2),plot(t,ofx_1(:,1),'r',t,ofx_2(:,1),'g',t,ofx_3(:,1),'b')
	title('Oscilador forzado (F = 0.5)'),grid on
	legend('x0=4','x0=1','x0=-2'),ylabel('Amplitud'),xlabel('t')
	
	disp('Las representaciones graficas se deben haber abierto.')

