%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
% Simulating the image using GMM and HMRF
img = randn(512);
imshow(img,[]);

%%
I = zeros(128,128)
J = imnoise(I,'gaussian',0,1)
J = imnoise(I,'gaussian',0.5,1)
J = imnoise(I,'gaussian',1,1)
imshow(J)
%%
J = EMSeg(J, 3)
imshow(J)
%%
clear;clc;close all;

%mex BoundMirrorExpand.cpp;
%mex BoundMirrorShrink.cpp;

I=imread('C:\Users\apanwar4\Documents\MATLAB\HMRF\seg.jpg');
Y=rgb2gray(I);
Z = edge(Y,'canny',0.75);

imwrite(uint8(Z*255),'edge.png');

Y=double(Y);
Y=gaussianBlur(Y,3);
imwrite(uint8(Y),'blurred image.png');

k=3;
EM_iter=10; % max num of iterations
MAP_iter=10; % max num of iterations

tic;
fprintf('Performing k-means segmentation\n');
[X, mu, sigma]= image_kmeans(Y,k);
imwrite(uint8(X*120),'initial labels.png');

[X, mu, sigma]=HMRF_EM(X,Y,Z,mu,sigma,k,EM_iter,MAP_iter);
imwrite(uint8(X*120),'final labels.png');
toc;

%%
mu = [1;0;0.5];
sigma = [1];
p = [0.33,0.33,0.33];
obj = gmdistribution(mu,sigma,p);

Y = random(obj,512*512);
Y = reshape(Y,512, 512);

imshow(Y);
Y = double(I)

% HMRF part
k=3; % k: number of regions
g=3; % g: number of GMM components
beta=1; % beta: unitary vs. pairwise
EM_iter=3; % max num of iterations
MAP_iter=10; % max num of iterations

tic;
fprintf('Performing k-means segmentation\n');
[X, GMM]=image_kmeans(Y,k,g);
imwrite(uint8(X*80),'initial labels.png');

[X, GMM]=HMRF_EM(X,Y,GMM,k,g,EM_iter,MAP_iter,beta);
imwrite(uint8(X*80),'final labels.png');
toc;