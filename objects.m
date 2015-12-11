img=imread('E:\NIRAV\DIP\segmentation\seg1.jpg');

img=im2bw(img);

imshow(img);

B= bwboundaries(img);
display(B);
%imshow(B);
B=length(B) ;

display(B);