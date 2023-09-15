% rev_t49_coords(256.59,7.4,38) (propuesto) resultados: A=104.15º | a=-5.85º
% Para comprobar el funcionamiento para otras H,delta,phi a partir de ejemplos 
% que he buscado en internet:
% rev_t49_coords(83.83,34.23,1.15) resultados: A=304º18' | a=5º45'
% rev_t49_coords(311.3,-7.8,9.55) resultados: A=109º10.5- | a=38º2.5'

function r = rev_t49_coords(H,DEC,phi) %all in degrees
format bank

% H=ángulo horario, DEC=declinación, phi=latitud local 
	m2=[sind(phi),0,-cosd(phi);0,1,0;cosd(phi),0,sind(phi)];
	m3=[cosd(DEC)*cosd(H);cosd(DEC)*sind(H);sind(DEC)];
	m1=m2*m3;

	a=asind(m1(3));
	A1=acosd(m1(1)/cosd(a));
	A2=asind(m1(2)/cosd(a));
	r=[a,A1,A2];
end

