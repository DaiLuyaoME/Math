clear all;
close all;
flag=1;
name={'ֱ��','Բ','��Բ','����','������','�����׵�������','Nonliner'};
[x,y]=pcaData(flag);
% figure
% plot(x1,y1);
x1=x;y1=y;
[pc,score,v,mu]=myPCA([x1',y1'],1);
x2=score(:,1);y2=score(:,2);
% plot(x1,y1,x2,y2);
create2Dfigure(x1,y1,x2,y2,name{flag});
figure;
bar(cumsum(v)./sum(v))
% [pc,signals,v,~,~,mu]=pca([x',y']);
%%
ratio=zeros(6,2);
for i=1:6
    [x,y]=pcaData(i);   
    x1=x;y1=y;
    [pc,score,v,mu]=myPCA([x1',y1'],1);
    ratio(i,:)=v./sum(v);
end

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1,...
    'XTickLabel',{'ֱ��','Բ','��Բ','����','������','�����׵�����'},...
    'XTick',[1 2 3 4 5 6],...
    'FontSize',10,...
    'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');

% ʹ�� bar �ľ������봴������
bar1 = bar(ratio,'Parent',axes1);
set(bar1(1),'DisplayName','��һ���ɷֹ�����');
set(bar1(2),'DisplayName','�ڶ����ɷֹ�����');

% ���� title
title({'�����ɷֹ�����'},'FontSize',16,'FontName','Times New Roman');

% ���� ylabel
ylabel('������','FontSize',16,'FontName','Times New Roman');

% ���� legend
legend(axes1,'show');





%% noise removal of line
close all;
[x,y]=pcaData(1);
for i=1:numel(x)
    y1(i)=y(i)+normrnd(3,10);
end
    x1=x;
    [pc,score,v,mu]=myPCA([x1',y1'],1);
    create2Dfigure(x1,y1,score(:,1),score(:,2),'ֱ�߼Ӱ�����');
result=pcaRecover(score(:,1),pc(:,1),mu);
create2Dfigure(x1,y1,result(:,1),result(:,2),'��ά��ԭ��');
axis equal;
% plot(result(:,1),result(:,2));
% result=pcaRecover(score,pc,mu);
% figure;
% plot(result(:,1),result(:,2));
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
shading interp;
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