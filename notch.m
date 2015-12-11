    f=imread('C:\Users\Wazza\Documents\MATLAB\CODES\notch.tif');
    [M,N]=size(f); 
    F=fft2(double(f)); 
    u=0:(M-1); 
    v=0:(N-1); 
    idx=find(u>M/2); 
    u(idx)=u(idx)-M; 
    idy=find(v>N/2); 
    v(idy)=v(idy)-N; 
    [V,U]=meshgrid(v,u); 
    % shifting the FFT of the image so that the origin is at the center of the image 
    F=fftshift(F);
    D=sqrt(U.^2+V.^2); 
    NF = ones(size(F,1),size(F,2)); 
    NF(21:27,45:63) = 0; 
    NF(256-27:256-21,256-63:257-45) = 0;
    NF(47:53,63:81) = 0; 
    NF(256-53:256-47,256-81:257-63) = 0;
    NF(73:79,81:99) = 0; 
    NF(256-79:256-73,256-99:257-81) = 0;
    NF(99:105,99:117) = 0; 
    NF(256-105:256-99,256-117:256-99) = 0;
    G = F.*NF; % Apply the notch filters to the Fourier spectrum of the image
    G=ifftshift(G);
    figure;imshow(uint8(log(1+abs(G))),[]);
    g=real(ifft2(double(G)));
    figure;imshow(f),figure,imshow(g,[ ]);