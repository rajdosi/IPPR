img=imread('C:\Animesh\images\images\lps.png');

%img=rgb2gray(img);
img=uint8(img);
imhist(img);
freq=zeros(1,256);
figure;
imshow(img)
[maxx,maxy]=size(img);

d=input('Enter number of parts');
hi=maxx/d;
hj=maxy/d;

for mi=1:1:d
    for mj=1:1:d
        freq=zeros(1,256);
            for i=((mi-1)*(hi))+1:1:hi*mi-1
                for j=((mj-1)*hj)+1:1:hj*mj-1
                    i=floor(i);
                    j=floor(j);
                    temp=img(i,j)+1;
                    freq(temp)=freq(temp)+1;
                end
            end

            for i=1:256
                prob(i)=freq(i)/(hi*hj);
            end
            ch(1)=freq(1);
            for i=2:256
                ch(i)=ch(i-1)+freq(i);
            end

            for i=1:256
                cdf(i)=ch(i)/(hi*hj);
            end

            for i=1:256
                cdf(i)=cdf(i)*256;
                cdf(i)=floor(cdf(i));
            end

            for i=((mi-1)*(hi))+1:1:hi*mi-1
                for j=((mj-1)*hj)+1:1:hj*mj-1
                    i=floor(i);
                    j=floor(j);
                    temp=img(i,j)+1;
                    img(i,j)=cdf(temp);
                end
            end
            
    end
end
img=uint8(img);
figure;
imhist(img);
figure;
imshow(img);
