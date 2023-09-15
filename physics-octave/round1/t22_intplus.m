function intplus(nr,op1)
	format short
	function y=f(x)
		y=(sqrt(3)-sqrt(abs(x))).^2;
	end

	disp('> Integracion de f(x) usando "quad" y "Monte Carlo" entre A a B:')
	disp('f(x)=(sqrt(3)-sqrt(abs(x))).^2')
	A=-3, B=3
	% *************************** a) INTEGRACI�N 'QUAD'.
	integral_fx_quad=quad('f',A,B)

	% *************************** b) INTEGRACI�N 'MONTE CARLO'.
	% Generaci�n de n�meros aleatorios. A m�s nr, mayor precisi�n y disminuci�n del error relativo. *(1)
	% A partir de 100000 empieza a percibirse un retraso a la hora de dibujar los puntos en la gr�fica. *(2)
	%nr par�metro % Para este nr el error relativo es normalmente <1%, lo cual es bastante aceptable.
	ymax=f(0); % Donde la funci�n tiene el m�x. para generar puntos aleatorios con esa altura como m�x.
	% Como la funci�n es sim�trica, con lanzar puntos en una s�la mitad ('B') es suficiente; adem�s, as� obtendr�
	% mayor precisi�n con un menor n�mero de operaciones.
	% Con 'ymax' y 'B' determino los l�mites del rect�ngulo donde est� contenida la funci�n y voy a lanzar los puntos.
	% Se generan los lanzamientos de puntos aleatorios en los l�mites exigidos usando 'ymax' y 'B'.
	rny=ymax*rand(nr,1); 
	rnx=B*rand(nr,1);
	% Contabiliza el n� de puntos contenidos entre la curva y la recta [0,B] y lo almacena en 'q'.
	% Cuando la condici�n es verdadera, 'sum' suma 1 a la variable 'q'.
	q=sum(rny<=f(rnx))
	% Fracci�n de los puntos q dentro de la curva en %1.
	fraccion_dentro=q/nr;
	% Ahora se multiplica esta fracci�n en %1 por el �rea donde est� contenida el �rea de la funci�n 
	% y as� obtendr� la parte del �rea se encuentra entre la curva y la recta dada (la integral de la funci�n).
	% (como es sim�trica, el ratio 'q' se conserva y puedo multiplicarlo por el �rea de ambos lados).
	% �rea del rect�ngulo donde est� contenida el �rea de la funci�n (ambos lados).
	area_rectangulo=2*B*ymax; % �rea=lado*lado
	integral_fx_montecarlo=area_rectangulo*fraccion_dentro

	% *************************** c) ERROR RELATIVO
	% Defino la integral con 'quad' como valor real y la de 'monte carlo' como valor de la medici�n.
	error_absoluto=abs(integral_fx_quad-integral_fx_montecarlo); 
	% Expreso el error relativo en %100 para que sea m�s sencillo 'visualizarlo'. *(1)
	error_relativo_entantox100=100*error_absoluto/integral_fx_quad

	% *************************** GR�FICA (opcional).
	% # Activar para representar la funci�n.
	if(op1=1)
		x=linspace(-3,3,10000);
		hold on; grid;
		plot(x,f(x)) % *(2)
			title('f(x)=(sqrt(3)-sqrt(abs(x))).^2')
			xlabel('x'), ylabel('f(x)')
		plot(rnx,rny,'.')
	end
	% # Activar para representar tambi�n los puntos de Monte Carlo en la gr�fica. *

end

