a = imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\camera.gif');
a = imnoise(a,'Gaussian');
figure, imshow(a);
a = double(a);
sigma = 1.76;
sz = 4;
[x,y] = meshgrid(-sz:sz,-sz:sz);
M = size(x,1)-1;
N = size(y,1)-1;
exp_comp = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel = exp(exp_comp)/(2*pi*sigma*sigma);
o = zeros(size(a));
i = padarray(a, [sz, sz]);
for i = 1:size(a, 1)- M
    for j = 1:size(a, 2)- N
        temp = a(i:i+M, j:j+M).*Kernel;
        o(i, j) = sum(temp(:));
    end
end
o = uint8(o);
figure, imshow(o);
   
   