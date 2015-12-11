img=imread('C:\Animesh\Image Processing\images\images\cat.jpg'); 
imshow(img);
img=rgb2gray(img);

[maxx,maxy]=size(img);

for i=2:2:maxx
    for j=2:2:maxy
        img2(i/2,j/2)=(img(i-1,j-1)/4)+(img(i-1,j)/4)+(img(i,j)/4)+(img(i,j-1)/4);
    end
end

figure;
imshow(img);
figure;
imshow(img2);