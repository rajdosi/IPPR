clear;
img=imread('C:\Animesh\Image Processing\images\images\images.jpg');
imshow(img);
img=rgb2gray(img);

[maxx,maxy]=size(img);

for i=1:maxx
	for j=1:maxy
		img2(2*i,2*j)=img(i,j);
        img2(2*i-1,2*j)=img(i,j);
        img2(2*i,2*j-1)=img(i,j);
        img2(2*i-1,2*j-1)=img(i,j);
	end
end
[sizex,sizey]=size(img2);

figure;
imshow(img2);
