%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%  K = J(:);
%  mu=mean(K);
%  sigma=std(K);
%  P=normpdf(K, mu, sigma);
%  Z = norminv(P,mu,sigma);
%  X = mvnrnd(mu,sigma,200);
%  scatter(X(:,1),X(:,1),10,'ko');
%  options = statset('Display','final');
%  gm = fitgmdist(X,1,'Options',options);
%  idx = cluster(gm,X);
%  cluster1 = (idx == 1);
%  cluster2 = (idx == 2);
% figure;
%  scatter(X(cluster1,1),X(cluster1,1),10,'r+');
%  hold on
%   scatter(X(cluster2,1),X(cluster2,1),10,'bo'); 
%  hold off
%  legend('Cluster 1','Cluster 2','Location','NW')