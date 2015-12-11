clear all;
clc;
im=imread('C:\Users\Wazza\Documents\MATLAB\CODES\notch.tif');

figure,imshow(im),title('Original image');

im=fftshift(fft2(im));

[rows,cols]=size(im);
c=0.05;
n=2;
%for i=1:rows
 %   for j=1:cols
  %      im(i,j)=c*log(1+im(i,j));       
   % end
%end

figure,imshow(im),title('Transform image original');
u(1)=150;
v(1)=75;
u(2)=125;
v(2)=-55;
cut_off=input('Enter the value for radius:');

centre_x=round(rows/2);
centre_y=round(cols/2);

for i=1:rows
    for j=1:cols
        for k=1:2
            d(k,i,j)=((i-centre_x-u(k))^2+(j-centre_y-v(k))^2)^(1/2);
            dm(k,i,j)=((i-centre_x+u(k))^2+(j-centre_y+v(k))^2)^(1/2);
        end
    end
end 

for i=1:rows
    for j=1:cols
        h(i,j)=1;
    end
end

for i=1:rows
    for j=1:cols
        for k=1:2
            part1=1/(1+((cut_off/d(k,i,j))^(2*n)));
            part2=1/(1+((cut_off/dm(k,i,j))^(2*n)));
            h(i,j)=h(i,j)*part1*part2;
        end
    end
end    

for i=1:rows
    for j=1:cols
        outp(i,j)=h(i,j)*im(i,j);
    end
end
%figure,imshow(outp),title('Filtered transform image');
%outp1=abs(ifft(outp));
%figure,imshow(outp1),title('Final image');

figure,imshow(outp),title('Filtered transform image');
im4=uint8(abs(ifft2(ifftshift(outp))));
figure;
imshow(im4),title('Final image');
