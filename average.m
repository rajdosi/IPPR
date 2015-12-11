a=imread('C:\Users\Wazza\Documents\MATLAB\CODES\images\camera.gif');
%i = imnoise(a, 'salt & pepper',0.02);

[rows,cols]=size(i);
out=zeros(rows,cols,'double');
x=input('Enter the size of the average filter matrix');
l=floor(x/2);

%average
    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=i(r,c);
                continue; 
            end
            for mx = c-l : c+l
                for nx = r-l : r+l
                    out(r,c) = out(r,c) + a(nx,mx)/(x*x);
                end
            end
        end
    end
figure,imshow(uint8(a)),title('original');
figure,imshow(uint8(out)),title('average');

%weighted average
x = 3;
l = floor(x/2);
wt=zeros(3,3);
wt(1,1)=1;
wt(1,2)=2;
wt(1,3)=1;
wt(2,1)=2;
wt(2,2)=4;
wt(2,3)=2;
wt(3,1)=1;
wt(3,2)=2;
wt(3,3)=1;

    for c = 1 : cols
        for r = 1 : rows
            if(c<=l || c >=cols-l || r<=l || r>=rows-l)
                out(r,c)=a(r,c);
                continue; 
            end
           j=1;
            for mx = c-l : c+l
                k=1;
                for nx = r-l : r+l
                    out(r,c) = out(r,c) + (wt(k,j)*a(nx,mx))/9;
                    k=k+1;
                end
                j=j+1;
            end
        end
    end
figure,imshow(uint8(out)),title('weighted average');


