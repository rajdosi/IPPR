i = imread('C:\Animesh\Image Processing\images\images\images.jpg');
i = rgb2gray(i);
[x,y] = size(i);
for k=1:1:x
    for j=1:1:y
        i2(k,j)=(i(k,j)/64)*64;
    end
end
figure;
imshow(i);
figure;
imshow(i2);