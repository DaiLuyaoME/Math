 delta = 0.5;
 F_n = [1 delta; 0 1];
 sigma_x = 0.1;
 Q_n = sigma_x^2 * [delta^3/3, delta^2/2;delta^2/2,delta];
 H_n = eye(2);
 sigma_y = 0.1;
 R_n = sigma_y^2 * eye(2);
 
%  x(1:2,1) = ones(2,1);
 x(1:2,1) = [0;1.5];
 m(1:2,1) = [0.1;1];
 y(1:2,1) = [0;1.1];
 xn_n1 = [0;1.1];
 P = eye(2);
 
 %%
 rng default
 iterNum = 100;
 for n = 2:iterNum

     v_n = mvnrnd([0,0],Q_n);
     v_n = v_n';
     x(:,n) = F_n * x(:,n-1) + v_n;
     
     w_n = sigma_y * randn(2,1);
     y_n = H_n * x(:,n) + w_n;
     y(:,n) = y_n;
     [m(:,n),P,xn_n1(:,n)] = kalman_filter(m(:,n-1),P,y_n,F_n,Q_n,H_n,R_n);
 end
 %%
 comparePlot(x(1,:),x(2,:),m(1,:),m(2,:));
 axis tight;
 %%
 plotAllData(x(1,:),x(2,:),m(1,:),m(2,:),y(1,:),y(2,:),xn_n1(1,:),xn_n1(2,:));
 axis tight;
 %%
 figure;
 errorRe1 = (x(1,:)- m(1,:))./x(1,:);
 errorRe2 = (x(1,:)- y(1,:))./x(1,:);
 errorRe3 = (x(1,:)- xn_n1(1,:))./x(1,:);
 compareThree([errorRe1',errorRe2',errorRe3'],'相对位移误差');
  %%
 figure;
 errorRe1 = (x(2,:)- m(2,:))./x(2,:);
 errorRe2 = (x(2,:)- y(2,:))./x(2,:);
 errorRe3 = (x(2,:)- xn_n1(2,:))./x(2,:);
 compareThree([errorRe1',errorRe2',errorRe3'],'相对速度误差');
%% plot error of position
error = x(1,:)- m(1,:);
plotData(error,'$n$','$x_{n}^{\left( 1 \right)}-x_{n|n}^{(1)}$','位移误差');
errorRel = (x(1,:)- m(1,:))./x(1,:);
plotData(errorRel,'$n$','$\frac{x_{n}^{\left( 1 \right)}-x_{n|n}^{\left( 1 \right)}}{x_{n}^{\left( 1 \right)}}$','相对位移误差');
%% plot error of position
error = x(2,:)- m(2,:);
plotData(error,'$n$','$x_{n}^{\left( 2 \right)}-x_{n|n}^{(2)}$','速度误差');
errorRel = (x(2,:)- m(2,:))./x(2,:);
plotData(errorRel,'$n$','$\frac{x_{n}^{\left( 2 \right)}-x_{n|n}^{\left( 2 \right)}}{x_{n}^{\left( 2 \right)}}$','相对速度误差');
%% plot error velocity
figure;
plot(x(1,:))