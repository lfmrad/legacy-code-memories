% ###  PROGRAM: rev_t38_ajuste - LFMA  ###'
% Ajuste cuadrático a fuerza bruta con representación gráfica
% Modelo ym = a x^2 + b x + c
% Busca el triplete (a,b,c) que consiga ajustar mejor ym a los datos (x,y)
%rastreando N valores de "a" entre "ai" y "af", N valores de "b" y de "c" 
%
% input: vectores con datos: (x,y)
%        número de pasos: N
%        rango para "a": desde ai hasta af
%        rango para "b": desde bi hasta bf
%        rango para "c": desde ci hasta cf
% output: vector r con los coeficientes r(1)=a, r(2)=b, r(3)=c

% xr=[0 1 2 3 7 8 9 13 19 20]
% yr=[-26.48919,-6.78717,-27.69582,-35.13520,33.29996,71.63183,98.64249,280.55528,642.45646,719.73993]

% Ejemplos con datos ajdib_gendata:
% t38_JBG_ajbruto2(xr,yr,30,-0.5,0,1,1.5,-0.05,0)
% t38_JBG_ajbruto2(xr,yr,50,-0.4,-0.3,1.15,1.25,-0.03,-0.01)

function r = t38_JBG_ajbruto2(x,y,N,ai,af,bi,bf,ci,cf)

 A=linspace(ai,af,N);
 B=linspace(bi,bf,N);
 C=linspace(ci,cf,N);
 Qmin=amin=bmin=cmin=999999;

 for i=1:N
    a=A(i);
    for j=1:N
        b=B(j);
        for k=1:N
            c=C(k);
            ym=a*x.^2+b.*x+c;
            Q=sumsq(y-ym);
            if (Q<Qmin) 
               Qmin=Q; amin=a; bmin=b; cmin=c;
            end
        end
    end
 end 

 Qmin  %mínimo de la suma de cuadrados de residuos
 dof=length(x)-3 %grados de libertad del ajuste
 Qdof=Q/dof  %bondad del ajuste (figure of merit)
 r=[amin bmin cmin]; %guardamos los resultados en r

 plot(x,y,'*')
 hold on
 
 % ** Todo esto es para sumarle un cachito igual de grande que el espacio entre
 % los puntos y que la gráfica quede bonita... a mí para lo mismo se me ocurre:
 % d=xmax*(1.2-1)
 % xp=linspace(xmin-d,xmax*1.2,100);
 xmin=min(x)
 xmax=max(x)
 d = (xmax-xmin)/10;
 xp=linspace(xmin-d,xmax+d,100);
 % ******

 yp=r(1)*xp.^2+r(2)*xp+r(3);
 plot(xp,yp)
 hold off
end


