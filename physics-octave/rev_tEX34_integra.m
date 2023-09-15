'###  PROGRAM: rev_tEX41_diff - LFMA'
clear all,clf,format bank

function r=y(x)
	r=sin(x).*x.^3;
end

a=1; b=pi;
x=linspace(a,b,100);

shots=100000
ymax=max(y(x));
rnx = rand(1,shots)*(pi-a)+a;
rny = rand(1,shots)*ymax;

q=sum(rny<=y(rnx))/shots;

rectangle_area=(b-a)*ymax;
montecarlo_integration=q*rectangle_area
quad_integration=quad('y',a,b)
relative_error=100*abs(montecarlo_integration-quad_integration)/quad_integration

hold on
axis([0.5,3.5,-0.5,10])
plot(x,y(x),'r',rnx,rny,'.');

% other methods to calculate q
% q2=length(find(rny<=y(rnx)))/shots
% diff=y(rnx)-rny;
% q3=sum(diff>=0)/shots


	
