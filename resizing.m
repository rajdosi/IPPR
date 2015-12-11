i = imread('C:\Animesh\Image Processing\images\images\images.jpg');
i = rgb2gray(i);
imshow(i);
[row, col] = size(i);
i1 = zeros(row, col);
a = 1;
for e = 1:4:row
    b = 1;
    for j = 1:4:col
        i1(a, b) = i(e, j);
        b = b+1;
    end
    a = a+1;
end
figure;
imshow(uint8(i1));
[rows, cols] = size(i1);
i2 = zeros(rows, cols);
for e = 1:row
    for j = 1:col
        i2(2*e, 2*j) = i1(e, j);
        i2(2*e - 1, 2*j) = i1(e, j);
        i2(2*e - 1, 2*j - 1) = i1(e, j);
        i2(2*e, 2*j - 1) = i1(e, j);
    end
end
figure;
imshow(uint8(i2));