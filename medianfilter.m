a = imread('C:\Users\Saumya\Pictures\IPPR\lena.gif');
imshow(a);
j = imnoise(a, 'salt & pepper',0.02);
figure, imshow(j);
k = filter2(fspecial('average', 3),j)/255;
figure, imshow(k);
l = medfilt2(j, [3 3]);
figure,imshow(l);