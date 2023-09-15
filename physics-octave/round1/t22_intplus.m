function intplus(nr,op1)
	format short
	function y=f(x)
		y=(sqrt(3)-sqrt(abs(x))).^2;
	end

	disp('> Integracion de f(x) usando "quad" y "Monte Carlo" entre A a B:')
	disp('f(x)=(sqrt(3)-sqrt(abs(x))).^2')
	A=-3, B=3
	% *************************** a) INTEGRACIÓN 'QUAD'.
	integral_fx_quad=quad('f',A,B)

	% *************************** b) INTEGRACIÓN 'MONTE CARLO'.
	% Generación de números aleatorios. A más nr, mayor precisión y disminución del error relativo. *(1)
	% A partir de 100000 empieza a percibirse un retraso a la hora de dibujar los puntos en la gráfica. *(2)
	%nr parámetro % Para este nr el error relativo es normalmente <1%, lo cual es bastante aceptable.
	ymax=f(0); % Donde la función tiene el máx. para generar puntos aleatorios con esa altura como máx.
	% Como la función es simétrica, con lanzar puntos en una sóla mitad ('B') es suficiente; además, así obtendré
	% mayor precisión con un menor número de operaciones.
	% Con 'ymax' y 'B' determino los límites del rectángulo donde está contenida la función y voy a lanzar los puntos.
	% Se generan los lanzamientos de puntos aleatorios en los límites exigidos usando 'ymax' y 'B'.
	rny=ymax*rand(nr,1); 
	rnx=B*rand(nr,1);
	% Contabiliza el nº de puntos contenidos entre la curva y la recta [0,B] y lo almacena en 'q'.
	% Cuando la condición es verdadera, 'sum' suma 1 a la variable 'q'.
	q=sum(rny<=f(rnx))
	% Fracción de los puntos q dentro de la curva en %1.
	fraccion_dentro=q/nr;
	% Ahora se multiplica esta fracción en %1 por el área donde está contenida el área de la función 
	% y así obtendré la parte del área se encuentra entre la curva y la recta dada (la integral de la función).
	% (como es simétrica, el ratio 'q' se conserva y puedo multiplicarlo por el área de ambos lados).
	% Área del rectángulo donde está contenida el área de la función (ambos lados).
	area_rectangulo=2*B*ymax; % área=lado*lado
	integral_fx_montecarlo=area_rectangulo*fraccion_dentro

	% *************************** c) ERROR RELATIVO
	% Defino la integral con 'quad' como valor real y la de 'monte carlo' como valor de la medición.
	error_absoluto=abs(integral_fx_quad-integral_fx_montecarlo); 
	% Expreso el error relativo en %100 para que sea más sencillo 'visualizarlo'. *(1)
	error_relativo_entantox100=100*error_absoluto/integral_fx_quad

	% *************************** GRÁFICA (opcional).
	% # Activar para representar la función.
	if(op1=1)
		x=linspace(-3,3,10000);
		hold on; grid;
		plot(x,f(x)) % *(2)
			title('f(x)=(sqrt(3)-sqrt(abs(x))).^2')
			xlabel('x'), ylabel('f(x)')
		plot(rnx,rny,'.')
	end
	% # Activar para representar también los puntos de Monte Carlo en la gráfica. *

end

