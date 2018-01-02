%% 初始数据及参数
clear 
clc
m = 50;
n = 15;
maxiter = 40;
lamubda = 0.001;
%初始值
x0 = zeros(m,1);
X(:,1) = x0; %实际位置
X_robust(:,1) = x0; %估计
X_standard(:,1) = x0;
P = eye(m); 
% 生成状态转移矩阵A
A = rand(m,m);
% A = triu(A) + triu(A)';
% [V,S] = eig(A);
% s = diag(S);
% [smax,index] = max(abs(s));
% mul = s(index)/0.98;
% s = s/abs(mul);
% Snew = diag(s);
% A = V * Snew * V';
% A = real(A);
% 生成映射矩阵C
%%
temp1 = rand(1,m);
temp2 = rand(m,m);
[Q,R] = qr(temp2);
A = Q * diag(temp1) * Q';
A = randn(m,m);
A = A / vrho(A) * 0.98;
%%
C = rand(n,m);
V = eye(n);
B = normrnd(0,1,m,m);
W = B * B';
%% track target using robust kalman filter
for t = 2:maxiter
    %预测
    wt = mvnrnd(zeros(1,m),W)';
    X(:,t) = A * X(:,t - 1) + 0.001 * wt;
    vt = normrnd(0,1,n,1); % measurement noise
    yt = C * X(:,t) + vt ; 
    z = rand(1,n); 
    index = z <= 0.05;
    yt(index) = vt(index);% sparse noise
    
    xb_pre = A * X_robust(:,t - 1); 
    xs_pre = A * X_standard(:,t - 1);
    %计算协方差矩阵
    P = A * P * A' + W;
    P_INV = inv(P);
    V_INV = inv(V);
    %%
    cvx_begin
        variables x(m,1) v(n,1)
        minimize (quad_form(v,V_INV) + quad_form(x-xs_pre,P_INV))
        subject to 
            yt == C*x + v
    cvx_end
    X_standard(:,t) = x;
    %%
    cvx_begin quiet
        variables x(m,1) v(n,1) z1(n,1)
        minimize (quad_form(v,V_INV) + quad_form(x-xb_pre,P_INV) + lamubda*norm(z1,1))
        subject to 
            yt == C*x + v + z1
    cvx_end
    X_robust(:,t) = x;
%%    
    Sn = C * P * C' + V;
    K = P * C' / Sn;
    P = P - K * C * P;
    
end
%%
figure 
for j = 1:maxiter 
    delta(j) = norm(X(:,j)-X_standard(:,j));
    delta2(j) = norm(X(:,j)-X_robust(:,j));
end
begin = 8;
plot(begin:maxiter,delta(begin:end)./m,'DisplayName','普通卡尔曼滤波','LineWidth',2);
hold on
plot(begin:maxiter,delta2(begin:end)./m,'r','DisplayName','鲁棒卡尔曼滤波','LineWidth',2);
axis tight;
xlabel('n');
ylabel('RMS');
legend show;




