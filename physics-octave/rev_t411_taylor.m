'###  PROGRAM: rev_t411_taylor - LFMA'
clear all, clf,format long

x=0.9
from_n_to_N=100

r=0;
for n=1:from_n_to_N
	taylor_n=(-1)^(n+1)*x^n/n;
	r=r+taylor_n;
	valuehistory(n)=r;
end

reference_value=log(1+x)
converged_value=valuehistory(from_n_to_N)

disp('Loading graph...');
ref_line=ones(from_n_to_N)*reference_value;
hold on, grid on
plot(valuehistory,'b',ref_line,'r')
	title('Taylor'),xlabel('n'),ylabel('Values')
	legend('Taylor: sum{(-1)^(n+1)*x^n/n} from n=1 to N','Reference: ln(1+x)')
	