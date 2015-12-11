close all;
clear all;

I = imread('C:\Users\Wazza\Documents\MATLAB\CODES\prac7.tif');                    % original image
[rows,cols] = size(I);

J = zeros(rows,cols);       % frequency domain of I
H = zeros(rows,cols);       % degradation function
G = zeros(rows,cols);   
G1 = zeros(rows,cols);       % output

H = double(H);
G = double(G);
G1 = double(G1);

J = fft2(I);               % fourier transform

%k = 0.00025;
T = 1;
a = 0.1;
b = 0.1;

for u = 1:rows
    for v = 1:cols
        
          t1 = double(T/(pi*((u*a)+(v*b))));
          t2 = double(sin(pi*((u*a)+(v*b))));
          t3 = double(exp((-i*pi*((u*a)+(v*b)))));
          
          H(u,v) = t1*t2*t3;    
     
          G(u,v) = J(u,v)*H(u,v);
    end
end

G1 = ifft2(G);             % inverse fft

figure;
imshow(uint8(I));   title('Input'); 

figure;
imshow(uint8(G1));   title('Blurred-Output'); 


%P = fft2(G1);

P = G;
P = double(P);
Q = zeros(rows,cols);

for u = 1:rows
    for v = 1:cols
        
           t1 = double(T/(pi*((u*a)+(v*b))));
           t2 = double(sin(pi*((u*a)+(v*b))));
           t3 = double(exp((-i*pi*((u*a)+(v*b)))));
           
           H(u,v) = t1*t2*t3;    
      
          Q(u,v) = P(u,v)/H(u,v);
    end
end

S = ifft2(Q);

figure;
imshow(uint8((S)));   title('De-Blurred-Output'); 