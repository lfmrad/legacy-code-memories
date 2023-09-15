'###  PROGRAM: rev_tEX41_diff - LFMA'
clear all, clf

% 4*v'' + 33*v = 37*y
% r(1)=y=v0
% r(2)=v=a0
% r(3)=a=v'' = (37*y0 - 33*v0 )/ 4

% r=[y v a]
function r=diff(ini,x)
	r(1)=ini(2);
	r(2)=ini(3);
	r(3)=(37*ini(1)-33*ini(2))/4;
end

	y0 = 0;
	v0 = -1;
	a0 = 3;
	x=linspace(-5,5,100);
	
r = lsode('diff',[y0,v0,a0],x)

sol_analitica=(8/45)*e.^x-( (8/45)*cos(3*x)+(19/45)*sin(3*x) ).*e.^(-x./2);
hold on
subplot(2,1,1),plot(x,sol_analitica,'r')
	grid on
subplot(2,1,2),plot(x,r(:,2),'b')
	grid on
	
	% 