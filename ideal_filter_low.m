im=imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\camera.gif');
%im=rgb2gray(im);

figure;
imshow(im);

[rows,cols]=size(im);
for i=1:rows
    for j=1:cols
        im(i,j)=im(i,j)*((-1)^(i+j));
    end
end

im3=fft2(im);


rad=50;
for i=1:rows
    for j=1:cols
        if ((((i-(rows/2)).^2) + (j-(cols/2)).^2)) < rad.^2
            bin(i,j)=1;
        else 
            bin(i,j)=0;
        end
    end
end

for i=1:rows
    for j=1:cols
        im3(i,j)=im3(i,j)*bin(i,j);
    end
end

im4=ifft2(im3);
figure;

for i=1:rows
    for j=1:cols
        im4(i,j)=im4(i,j)*((-1)^(i+j));
    end
end

imshow(im3);
figure;
imshow(uint8(im4));
