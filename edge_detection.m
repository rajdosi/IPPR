clear all;
clc;
im2=imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\camera.gif');
%im2=rgb2gray(im2);
[rows,cols]=size(im2);

im3=zeros(rows+2,cols+2);

for i=1:rows
    for j=1:cols
        im3(i,j)=im2(i,j);
    end
end

inp=3;
mat1=zeros(3,3);
mat2=zeros(3,3);

mat1=[-1,0,1;-2,0,2;-1,0,1];
mat2=[-1,-2,-1;0,0,0;1,2,1];

for i=1:rows
    for j=1:cols
        sum1=0;
        sum2=0;
        for k=0:inp-1
            for l=0:inp-1
                sum1=sum1+im3(i+k,j+l)*mat1(k+1,l+1);
                sum2=sum2+im3(i+k,j+l)*mat2(k+1,l+1);
            end
        end
        im4(i,j)=sum1;
        im5(i,j)=sum2;
        im6(i,j)=sqrt((im4(i,j)*im4(i,j))+(im5(i,j)*im5(i,j)));
    end
end


imshow(im2);
figure;
imshow(uint8(im4));
figure;
imshow(uint8(im5));
figure;
imshow(uint8(im6));