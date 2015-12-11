img=imread('C:\Animesh\images\images\frog.jpg');

img=rgb2gray(img);

imhist(img);
freq=zeros(1,256);
figure;
imshow(img)
[maxx,maxy]=size(img);

for i=1:maxx
    for j=1:maxy
        temp=img(i,j)+1;
        freq(temp)=freq(temp)+1;
    end
end

for i=1:256
    prob(i)=freq(i)/maxx/maxy;
end

ch(1)=freq(1);

for i=2:256
    ch(i)=ch(i-1)+freq(i);
end

for i=1:256
    cdf(i)=ch(i)/maxx/maxy;
end

for i=1:256
    cdf(i)=cdf(i)*256;
    cdf(i)=round(cdf(i));
end

for i=1:maxx
    for j=1:maxy
        temp=img(i,j)+1;
        img(i,j)=cdf(temp);
    end
end

img=uint8(img);
figure;
imhist(img);
figure;
imshow(img);
