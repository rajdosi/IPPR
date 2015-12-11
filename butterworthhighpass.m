clear all;
im=imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\camera.gif');
%im=rgb2gray(im);

figure;
imshow(im);

[rows,cols]=size(im);

im3=fftshift(fft2(double(im)));

rad=50;
n=5;
for i=1:rows
    for j=1:cols
        bin(i,j) = 1/(1+((rad.^2)/(((i-(rows/2)).^2) + (j-(cols/2)).^2)))^.2*n;
    end
end
for i=1:rows
    for j=1:cols
        im3(i,j)=im3(i,j)*bin(i,j);
    end
end
im4=uint8(abs(ifft2(ifftshift(im3))));
figure();
imshow(im3);
figure();
imshow(uint8(im4));