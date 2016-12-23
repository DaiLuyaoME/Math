clear all;
close all;
flag=3;
[x,y]=pcaData(flag);
% figure
% plot(x1,y1);
x1=x;y1=y;
[pc,score,v,mu]=pcaEig([x1',y1']);
figure
x2=score(:,1);y2=score(:,2);
plot(x1,y1,x2,y2);
% [pc,signals,v,~,~,mu]=pca([x',y']);
for i=1:numel(x)
    y(i)=y(i)+normrnd(0,1);
end
figure
plot(x,y);
[pc,score,v,mu]=pcaEig([x',y']);
figure;
plot(score(:,1),score(:,2));
bar(cumsum(v)./sum(v))
%%
result=pcaRecover(score(:,1),pc(:,1),mu);
figure;
plot(result(:,1),result(:,2));
result=pcaRecover(score,pc,mu);
figure;
plot(result(:,1),result(:,2));
%%
clear all;
close all;
flag=6;
covx=0;
[x,y,z]=pcaData(flag);

[pc,score,v,mu]=pcaEig([x,y,z]);
x1=score(:,1);
y1=score(:,2);
z1=score(:,3);
% x1=reshape(score(:,1),10,10);
% y1=reshape(score(:,2),10,10);
% z1=reshape(score(:,3),10,10);
xlin=linspace(min(x1),max(x1),70);
ylin=linspace(min(y1),max(y1),70);
[X,Y]=meshgrid(xlin,ylin);
f=scatteredInterpolant(x1,y1,z1);
Z=f(X,Y);
figure;
surf(X,Y,-Z);
axis tight;
figure
% surf(x1,y1,z1);
bar(cumsum(v)./sum(v))
%%
result=pcaRecover(score(:,1:2),pc(:,1:2),mu);
x1=result(:,1);
y1=result(:,2);
z1=result(:,3);
% x1=reshape(score(:,1),10,10);
% y1=reshape(score(:,2),10,10);
% z1=reshape(score(:,3),10,10);
xlin=linspace(min(x1),max(x1),70);
ylin=linspace(min(y1),max(y1),70);
[X,Y]=meshgrid(xlin,ylin);
f=scatteredInterpolant(x1,y1,z1);
Z=f(X,Y);
figure;
surf(X,Y,-Z);
axis tight;

%%
close all;
figure;
surf(X,Y,Z);
x=reshape(X,[],1);
y=reshape(Y,[],1);
z=reshape(Z,[],1);

[pc,score,v,mu]=pcaEig([x,y,z]);
x1=score(:,1);
y1=score(:,2);
z1=score(:,3);
% x1=reshape(score(:,1),10,10);
% y1=reshape(score(:,2),10,10);
% z1=reshape(score(:,3),10,10);
xlin=linspace(min(x1),max(x1),70);
ylin=linspace(min(y1),max(y1),70);
[X,Y]=meshgrid(xlin,ylin);
f=scatteredInterpolant(x1,y1,z1);
Z=f(X,Y);
figure;
surf(X,Y,-Z);
axis tight;
figure
% surf(x1,y1,z1);
bar(cumsum(v)./sum(v))
%%
result=pcaRecover(score(:,1:2),pc(:,1:2),mu);
x1=result(:,1);
y1=result(:,2);
z1=result(:,3);
% x1=reshape(score(:,1),10,10);
% y1=reshape(score(:,2),10,10);
% z1=reshape(score(:,3),10,10);
xlin=linspace(min(x1),max(x1),70);
ylin=linspace(min(y1),max(y1),70);
[X,Y]=meshgrid(xlin,ylin);
f=scatteredInterpolant(x1,y1,z1);
Z=f(X,Y);
figure;
surf(X,Y,Z);
axis tight;