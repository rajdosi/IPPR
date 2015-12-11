j=imread('U:\dip\cam3.png');
figure;
imshow(j);

% j=imrotate(j,45);
% figure;
% imshow(j);

% j=imrotate(j,45,'crop');
% figure;
% imshow(j);

for i=1:180
    j=imrotate(j,i,'crop');
    
end
figure;
    imshow(j);
