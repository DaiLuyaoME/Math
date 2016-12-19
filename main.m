clear all;
close all;
a=3;b=4;
f=@(t)a*t+b;
x=1:0.01:100;
y=f(x);
plot(x,y);
for i=1:numel(x)
    y(i)=y(i)+normrnd(3,10);
end
plot(x,y);
[signals,pc,v]=pcaEig([x;y]);
figure;
plot(signals(1,:),signals(2,:));
%%
figure;
data=[x;y];
[m,n]=size(data);
%shift to original point
mn=mean(data,2);
data=data-repmat(mn,1,n);
temp=pc(:,1);
result=temp*temp'*data;
plot(result(1,:),result(2,:));