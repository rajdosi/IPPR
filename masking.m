clear all;
img=imread('C:\Animesh\Exercise 7 fft\Exercise 7 fft\Fig0413.tif');  
%img=rgb2gray(img);
img=double(img);
[maxx,maxy]=size(img);


disp(maxx);
disp(maxy);

m=input('Enter the value of mask array');
%m=7;
for a=1:m
    for b=1:m
        ab(a,b) = input('Enter value');
    end
end

for i=m:maxx
    for j=m:maxy
        sum=0;
        ik=1;
        for k=i:-1:i-m+1
            jk=1;
            for l=j:-1:j-m+1
                sum = sum+(img(k,l)*ab(ik,jk));
                jk=jk+1;
            end
            ik=ik+1;
        end
        img2(i-1,j-1)=sum;
    end
end
img=uint8(img);
figure;
imshow(img);
figure;
img2=uint8(img2);
imshow(img2);

[maxx,maxy]=size(img2);
disp(maxx);
disp(maxy);




%figure;
%img3=img2-img;
%figure;
%imshow(img3);