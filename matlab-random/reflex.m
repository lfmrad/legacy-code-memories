function reflex(A,a,b,c)
k=size(A,2);
B=[A;ones(1,k)];
v=[0;c/b;1];
N=[1 0;0 1;0 0];
M=[N,v];
Ao=M*B;
Ao(3,:)=[];
alpha = atan(-a/b);
H=[cos(2*alpha) sin(2*alpha);sin(2*alpha) -cos(2*alpha)];
S=H*Ao;
U=[S;ones(1,k)];
w=[0;-c/b;1];
Ma=[N,w];
AR=Ma*U;
AR(3,:)=[];
P=[A,A(:,1)];
Q=[AR,AR(:,1)];
x=(-500:0.1:500); y=(-a/b)*x + (-c/b);
% he puesto '-800' asumiendo que los '-400' indicados en el EJ eran 
% un error dado que en ese caso se cortaría la parte inf. de la simetría
figure (2), scatter(P(1,:),P(2,:),'b.'), axis([-1200,1200,-800,800])
axis equal, hold on, plot(x,y,'r'), scatter(Q(1,:),Q(2,:),'g.'),
hold off   
end
