img=imread('C:\Animesh\Image Processing\images\images\images.jpg');  
img=rgb2gray(img);
%img2=img;



[maxx,maxy]=size(img);

kx=1;
for i=1:maxx
    ky=1;
    for j=1:maxy
        img2(kx,ky) = img(i,j);
        ky=ky+2;
    end
    kx=kx+2;
end

[maxx,maxy]=size(img2);

for i=1:2:maxx
    for j=2:2:maxy-1
        img2(i,j)=(img2(i,j+1)/2)+(img2(i,j-1)/2);
    end
end

for i=2:2:maxx
    for j=1:2:maxy-1
        img2(i,j)=(img2(i+1,j)/2)+(img2(i-1,j)/2);
    end
end

for i=2:2:maxx
    for j=2:2:maxy
        img2(i,j)=(img2(i+1,j)/4)+(img2(i-1,j)/4)+(img2(i,j+1)/4)+(img2(i,j-1)/4);
    end
end


figure;
imshow(img);
figure;
imshow(img2);

