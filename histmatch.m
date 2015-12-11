img2=imread('C:\Animesh\images\images\camera.gif');
img=imread('C:\Animesh\images\images\camera.gif');
%img=histeq(img);
% img=rgb2gray(img);
img=uint8(img);
img2=uint8(img2);

[maxx,maxy]=size(img);
  
freq1=zeros(1,256);
for i=1:maxx
    for j=1:maxy
        temp=img(i,j)+1;
        freq1(temp)=freq1(temp)+1;
    end
end
%int(255)=0;

for i=1:256
   prob1(i)=freq1(i)/maxx/maxy;
end

ch(1)=freq1(1);
for i=2:256
   ch(i)=ch(i-1)+freq1(i);
   cdp1(i)=ch(i)/maxx/maxy;
   %disp(cdp(i));
   cdf1(i)=cdp1(i)*256;
   cdf1(i)=round(cdf1(i));
end

[maxx,maxy]=size(img2);
  
freq2=zeros(1,256);
for i=1:maxx
    for j=1:maxy
        temp2=img2(i,j)+1;
        freq2(temp2)=freq2(temp2)+1;
    end
end
%int(255)=0;

for i=1:256
   prob2(i)=freq2(i)/maxx/maxy;
end

ch2(1)=freq2(1);
for i=2:256
   ch2(i)=ch2(i-1)+freq2(i);
   cdp2(i)=ch2(i)/maxx/maxy;
   
   cdf2(i)=cdp2(i)*256;
   cdf2(i)=round(cdf2(i));
   %disp(cdf2(i));
end

m=zeros(1,256);

for i=1:256
    for j=1:256
        if(cdf1(i)==cdf2(j))
            m(i)=img(j);
        else
            m(i)=cdf(i);
        end
    end
end

for i=1:maxx
    for j=1:maxy
        img4(i,j)=m(img(i,j)+1);
    end
end

img4=uint8(img4);

figure;
imshow(img);
figure;
imshow(img2);
figure;
imshow(img4);
figure;
imhist(img4);