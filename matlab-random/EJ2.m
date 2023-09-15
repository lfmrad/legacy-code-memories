image = input('Introduce la imagen con su extensión: ','s');
M1 = imread(image);
M2 = rgb2gray(M1);
M2size = size(M2);
resX = M2size(2);
resY = M2size(1);
k = round(resX*resY/(resX+resY+1));

n = 0;
while (n < 1 || n > k)
    n = input(['Nivel resolución deseado entre 1 y el valor umbral ' num2str(k) ': ']);
end

N = double(M2);
[U,S,V]=svd(N);
Mn = U(:,1:n)*S(1:n,1:n)*V(:,1:n)';
figure, imagesc(Mn), colormap(gray);

Mspecular = zeros(resY,resX);
for row=1:resY
    for column=1:resX
        Mspecular(row,column)=Mn(row,resX+1-column);
    end
end

figure, imagesc(Mspecular), colormap(gray);
