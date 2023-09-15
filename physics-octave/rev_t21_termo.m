% rev_t23_termo
%3. Las siguientes funciones representan, respectivamente, las variaciones de entalp�a y entrop�a de la reacci�n qu�mica...
% y1(T)= -98900 - 3.9 (T-298)
% y2(T)= -94 -3.9 ln(T/298) 
% Escribe un programa que:
% a) represente gr�ficamente las funciones y1, y2 en el intervalo 250 � 1250K ;
% b) encuentre la ra�z de la funci�n y1(T)-T*y2(T), que es la temperatura a partir de la cual la reacci�n deja de ser espont�nea. 

'###  PROGRAM: rev_t21_termo - LFMA  ###'
clear all,clf

% Pese a que podr�a dejar las funciones fuera y definirlas con el vector t para
% poder representarlas gr�ficamente; voy a elegir introducirlas dentro de funciones
% porque dado que luego usar� fsolve y una combinaci�n de ellas deber�n serlo.

% Variaci�n de entalp�a.
function r=deltaH(t)
	r=-98900-3.9*(t-298);
end

% Variaci�n de entrop�a.
function r=deltaS(t)
	r=-94-3.9*log(t/298);
end

% Delta_GIBBS=Delta_H-T*Delta_S
function r=deltaG(t)
	r=deltaH(t)-t.*deltaS(t);
end

format bank
disp('Temperatura(K) a la cual la reaccion dejara de ser espontanea: ')
fsolve('deltaG',250)
% Para obtener toda la informaci�n de fsolve: [s,info,msg]=fsolve('f',X0)

t=linspace(250,1250,3000);
hold on
subplot(3,1,1),plot(t,deltaH(t),'r')
	grid on
	legend('Variacion de entalpia')
	xlabel('T(K)')
	ylabel('Delta H')
subplot(3,1,2),plot(t,deltaS(t),'g')
	grid on
	legend('Variacion de entropia')
	xlabel('T(K)')
	ylabel('Delta S')
subplot(3,1,3),plot(t,deltaG(t),'b')
	grid on
	legend('Variacion de energia libre de Gibbs')
	xlabel('T(K)')
	ylabel('Delta G')

disp('Las representaciones graficas deberian haberse abierto...')

%help fsolve
%fsolve is a built-in function
%
% -- Loadable Function: [X, INFO, MSG] = fsolve (FCN, X0)
%     Given FCN, the name of a function of the form `f (X)' and an
%     initial starting point X0, `fsolve' solves the set of equations
%     such that `f(X) == 0'.

%Dibuja las funciones para ver d�nde est�n las soluciones
%As� entender�s por qu� la soluci�n puede ser diferente seg�n el punto de partida: X0=0 y si X0=2
%x=linspace(-2*pi,2*pi,100);
%plot(x,sin(x),'r',x,-cos(2*x),'g')

