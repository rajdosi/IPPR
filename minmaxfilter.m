a=imread('C:\Users\Saumya\Pictures\IPPR\lena.gif');
i = imnoise(a, 'salt & pepper',0.02);
[rows,cols]=size(i);
out=zeros(rows,cols,'double');
x=input('Enter the size of the minmax filter matrix: ');
l=floor(x/2);
    for c = 1 : cols
        for r = 1 : rows
            min=255;
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    if (i(nx,mx)<min)
                        min=i(nx,mx);
                    end
                end
                out(r,c)=min;
            end
        end
    end
figure,imshow(uint8(i)),title('original');
figure,imshow(uint8(out)),title('Minimum');

    for c = 1 : cols
        for r = 1 : rows
            max=0;
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    if (i(nx,mx)>max)
                        max=i(nx,mx);
                    end
                end
                out(r,c)=max;
            end
        end
    end
figure,imshow(uint8(out)),title('Maximum');