clear all;
close all;
a=3;b=4;
f=@(t)a*t+b;
x=1:0.01:100;
y=f(x);
% figure
% plot(x,y);
for i=1:numel(x)
    y(i)=y(i)+normrnd(3,10);
end
figure
plot(x,y);
[signals,pc,v,mu]=pcaSVD([x',y']);
figure;
plot(signals(:,1),signals(:,2));
%%
result=pcaRecover(signals(:,1),pc(:,1),mu);
figure;
plot(result(:,1),result(:,2));

%%
dataGenerator;
%% analysis the eigen value distribution
close all;
num=40;
    Y=zeros(num,diagMatNum);
    zone=linspace(lowerBound,upperBound,num);
    for i=1:diagMatNum
        [nelements,centers]=hist(singularValue{i},zone);
        x=centers;
        Y(:,i)=nelements;
    end

bar3(x,Y);
% bar3(centers1,nelements1,centers2,nelements2);
% 创建 xlabel
xlabel('序号','FontWeight','bold','FontSize',14);

% 创建 ylabel
ylabel('奇异值分布区间','FontWeight','bold','FontSize',14);

% 创建 zlabel
zlabel('奇异值数量','FontWeight','bold','FontSize',14);

%%
