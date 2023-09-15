% 'TAREA INF4 - EJ9_Conversor coordenadas - Luis F. Martinez Andreu.'
% Conversor coordenadas horarias (H,delta,phi)º -> coordenadas horizontales (a,A)º

% t49coord(256.59,7.4,38) (propuesto) resultados: A=104.15º | a=-5.85º
% Para comprobar el funcionamiento para otras H,delta,phi a partir de ejemplos 
% que he buscado en internet:
% t49coord(83.83,34.23,1.15) resultados: A=304º18' | a=5º45'
% t49coord(311.3,-7.8,9.55) resultados: A=109º10.5- | a=38º2.5'

function r=t41_coord(H,delta,phi)
	disp("** Conversor de coordenadas horarias a coordenadas horizontales **")
	disp("Angulo horario, declinacion y latitud local introducidos (grados):"),H,delta,phi
	B=[sind(phi),0,-cosd(phi);0,1,0;cosd(phi),0,sind(phi)];
	C=[cosd(delta)*cosd(H);cosd(delta)*sind(H);sind(delta)];
	C=B*C;
	
	disp("Elevacion y azimut (grados):")
	
	% Obtiene directamente de la última ecuación 'a':
	r(1)=asind(C(3));	
	
	% Pero determinar 0<A<180 requiere algunas correcciones:
	% Obtiene el valor de A sin corregir. Divide ecu(2) entre ecu(1) para obtener la tan(A):
	val=atand( C(2)/C(1) );
	
	% Observa el signo del seno y el coseno para determinar el cuadrante de la tg.
	aux=cosd(r(1));
	quadrant_cos=( C(1)/aux <0);
	quadrant_sin=( C(2)/aux <0);
	
	% Realiza las correcciones pertinentes:
	if(quadrant_cos&&quadrant_sin) % 3C (cos<0,sin<0)
	r(2)=180-val;
	elseif(quadrant_cos) % 2C (cos<0,sin>0)
	r(2)=360+val;
	elseif(quadrant_sin) % 4C (cos>0,sin<0)
	r(2)=180+val;	
	else
	r(2)=val;
	end
end


