in=imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\house.tif');
%in=rgb2gray(in1);
imshow(in);

[rows,cols]=size(in);

flag=0;


for i=1:rows
 for j=1:cols
     if in(i,j)>210
       in(i,j)=255;
     if flag==0
       x=i;y=j;flag=1;
     end
     else
        in(i,j)=0;
     end
end
end

figure,imshow(uint8(in));

disp('Starting pixel');
disp(x);
disp(y);


imgx=zeros(2000);
imgy=zeros(2000);
ccode=zeros(2000);
i=2;
imgx(1)=x;
imgy(1)=y;
i=i+1;
cnt=1;
while cnt<2000
    cnt = cnt+1;
    if  in(imgx(i-1),imgy(i-1)+1) > 210 && ccode(i-1)~=4
        ccode(i)=0;
        imgx(i)=imgx(i-1);
        imgy(i)=imgy(i-1)+1;
    elseif (in(imgx(i-1)+1,imgy(i-1)+1))>210 && ccode(i-1)~=3
        ccode(i)=7;
        imgx(i)=imgx(i-1)+1;
        imgy(i)=imgy(i-1)+1;
    elseif (in(imgx(i-1)+1,imgy(i-1)))>210 && ccode(i-1)~=2
        ccode(i)=6;
        imgx(i)=imgx(i-1)+1;
        imgy(i)=imgy(i-1);
    elseif (in(imgx(i-1)+1,imgy(i-1)-1))>210 && ccode(i-1)~=1
        ccode(i)=5;
        imgx(i)=imgx(i-1)+1;
        imgy(i)=imgy(i-1)-1;
    elseif (in(imgx(i-1),imgy(i-1)-1))>210 && ccode(i-1)~=0
        ccode(i)=4;
        imgx(i)=imgx(i-1);
        imgy(i)=imgy(i-1)-1;
    elseif (in(imgx(i-1)-1,imgy(i-1)-1))>210 && ccode(i-1)~=7
        ccode(i)=3;
        imgx(i)=imgx(i-1)-1;
        imgy(i)=imgy(i-1)-1;
    elseif (in(imgx(i-1)-1,imgy(i-1)))>210 && ccode(i-1)~=6
        ccode(i)=2;
        imgx(i)=imgx(i-1)-1;
        imgy(i)=imgy(i-1);
    elseif (in(imgx(i-1)-1,imgy(i-1)+1))>210 && ccode(i-1)~=5
        ccode(i)=1;
        imgx(i)=imgx(i-1)-1;
        imgy(i)=imgy(i-1)+1;
    end
    if imgx(i)==x && imgy(j)==y
        break;
    end
    disp(ccode(i));
    
i=i+1;
end  
