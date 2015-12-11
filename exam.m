clear all;

im=imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\lena.gif');
imshow(im),title('Original Image');

for i=1:size(im,1)
    for (j=1:size(im,2))
        for k=1:size(im,3)
            if (im(i,j,k)>50)
                im4(i,j,k)=im(i,j,k);
                im4(i,j,k)=(im4(i,j,k)/64)*64;
            end
        end
    end
end

figure,imshow(im4),title('Painted Image');

 
            