clear;clc;close all;

I=zeros([50 50 50]);
center=[25 25 25];
R=20;

for i=1:50
    for j=1:50
        for k=1:50
            d=norm([i j k]-center);
            if d<R
                I(i,j,k)=100;
            end
        end
    end
end

I=I+rand([50 50 50])*120;
I=round(I);
imshow(I)

