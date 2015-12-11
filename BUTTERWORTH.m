clear all;
im = imread('C:\Animesh\Image Processing\Exercise 7 fft\Exercise 7 fft\matching1.jpg');
figure;
im=rgb2gray(im);
subplot(2,2,1); imshow(im);
[m,n]=size(im);
display(m); 
display(n);
imf = fftshift(fft2(double(im)));
subplot(2,2,2); imshow(imf);
cx = round(m/2);
cy = round (n/2);
H=zeros(m,n);
radius = 20 ;
for i = 1 : m
for j = 1 : n
if (i-cx).^2 + (j-cy).^2 <= radius .^2
H(i,j)=1;
end;
end;
end;
outf=imf.*H;
out_put=uint8(abs(ifft2(outf)));
subplot(2,2,3); imshow(outf);
subplot(2,2,4); imshow(out_put);
%comparison of segmentation techniques for marine oil pollution detection    