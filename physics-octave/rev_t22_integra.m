% rev_t22_integra

'###  PROGRAM: rev_t22_integra - LFMA  ###'
clear all; clf;

function r=f(x)
	r=(sqrt(3)-sqrt(abs(x))).^2;
end

% Función definida en:
A=-3,B=3

x=linspace(A,B,100000);

% Ilustración de cómo obtener máximos y mínimos de la función para delimitar los disparos.
	% Para obtener x donde f(x)=0:
	xf_0=fsolve('f',1)
	% Para obtener x donde f(x) es mínima:
	% xf_min=fminunc ('f',1)

	% Para obtener el valor más grande de f(x)
	ymax=max(f(x))
	% Para obtener el valor más pequeño de f(x)
	% ymin=min(f(x))
	% 	Con: [x,ix] = max/min(vector); x solución; ix índice de la solución;

	% x=linspace(-3,3,100000);
	% f(x(50000))
	
	area_rectangulo=2*xf_0*ymax
	
% Integración con quad:
	quad_integration=quad('f',A,B)
	
% Integración por Montecarlo:
	shots=500000;
	% Disparo sólo a la mitad dado que la función es simétrica. 
	rnx=rand(1,shots)*xf_0;
	rny=rand(1,shots)*ymax;
	

	
	% ** Opción 1
		% Encuentra los valores de rny que son más pequeños que la función en su pareja rnx.
		% Llena k con un vector donde almacenará por cada rny que cumpla la condición el
		% índice donde se encuentra en rny
		k=find(rny<=f(rnx));
		% Como por cada tiro que cumplía la condición ocupa un lugar, los cuento y tengo el total.
		q=length(k)/shots
		% o directamente: q=length(find(rny<=f(rnx)))/shots
		montecarlo_integration_op1=q*area_rectangulo
		
	% ** Opción 2 (método JBG)
		diff=rny-f(rnx);
		q=sum(diff<0)/shots
		montecarlo_integration_op2=q*area_rectangulo
		
	% ** Opción 3 (como la primera vez que lo hice)
		q=sum(rny<=f(rnx))/shots
		montecarlo_integration_op3=q*area_rectangulo
		
% Error relativo entre ambos métodos.

error_relativo=100*abs(quad_integration-montecarlo_integration_op1)/quad_integration

% Representación gráfica.
	hold on
	% axis([-4,4,-1,4])
	plot(x,f(x),'r')
	plot(rnx,rny,'.')
	grid on

% quad(F,A,B)
% Numerically evaluate the integral of F from A to B using Fortran
% routines from QUADPACK.  F is a function handle, inline function,
% or a string containing the name of the function to evaluate.  The
% function must have the form `y = f (x)' where Y and X are scalars.

% A and B are the lower and upper limits of integration.  Either or
% both may be infinite.

% The optional argument TOL is a vector that specifies the desired
% accuracy of the result.  The first element of the vector is the
% desired absolute tolerance, and the second element is the desired
% relative tolerance.  To choose a relative test only, set the
% absolute tolerance to zero.  To choose an absolute test only, set
% the relative tolerance to zero.  Both tolerances default to
% `sqrt(eps)' or approximately 1.5e^-8.

% The optional argument SING is a vector of values at which the
% integrand is known to be singular.

% The result of the integration is returned in Q.  IER contains an
% integer error code (0 indicates a successful integration).  NFUN
% indicates the number of function evaluations that were made, and
% ERR contains an estimate of the error in the solution.

% The function `quad_options' can set other optional parameters for
% `quad'.

% Note: because `quad' is written in Fortran it cannot be called
% recursively.  This prevents its use in integrating over more than
% one variable by routines `dblquad' and `triplequad'.

% See also: quad_options, quadv, quadl, quadgk, quadcc, trapz,
% dblquad, triplequad



