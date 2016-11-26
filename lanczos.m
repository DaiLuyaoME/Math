function [x,relres,toltalIter,resvec]=lanczos(A,b,tol,maxIter)
% function x=lanczos(A,b,tol,maxIter)
x0=0;r0=b;

% circular lanczos, circle size is 10
iter=30;Q=zeros(size(A,1),iter);T=zeros(iter+1,iter+1);
maxCount=ceil(maxIter/iter);
count=0;
toltalIter=0;

while(norm(r0)>tol && count<maxCount)
    Q(:,1)=r0/norm(r0);
    temp=A*Q(:,1);
    T(1,1)=transpose(Q(:,1))*temp;
    temp=temp-T(1,1)*Q(:,1);
    T(2,1)=norm(temp);
    T(1,2)=T(2,1);
    Q(:,2)=temp/T(2,1);
    yi=norm(r0)/T(1,1);
    rii=abs(T(2,1)*yi);
    resvec(count*iter+1)=rii;
    toltalIter=toltalIter+1;
    
    for i=2:iter
        toltalIter=toltalIter+1;
        temp=A*Q(:,i);
        %T(i-1,i)=transpose(Q(:,i-1))*temp;
        temp=temp-T(i-1,i)*Q(:,i-1);
        T(i,i)=transpose(Q(:,i))*temp;
        temp=temp-T(i,i)*Q(:,i);
        T(i+1,i)=norm(temp);
        T(i,i+1)=T(i+1,i);
        Q(:,i+1)=temp/T(i+1,i);
        
        Ti=T(1:i,1:i);
        opts.UHESS=true;
        e1=zeros(i,1);
        e1(1)=1;
        yi=linsolve(Ti,norm(r0)*e1,opts);
        %         zi=Q(:,1:i)*yi;
        %         ri=r0-A*zi;
        rii=abs(T(i+1,i)*yi(i));
        %         if (abs(rii-norm(ri))<1e-8)
        %             fprintf('rii equals ri');
        %         else
        %             fprintf('rii does not equal ri');
        %         end
        resvec(count*iter+i)=rii;
        if(rii/norm(b)<tol || toltalIter>maxIter)
            zi=Q(:,1:i)*yi;
            x=zi+x0;
            relres=rii/norm(b);
            return;
        end
    end
    count=count+1;
    zi=Q(:,1:i)*yi; x0=zi+x0;  r0=b-A*x0;
    %     residual=norm(r0);
end
x=x0;
relres=norm(b-A*x)/norm(b);
fprintf('lanczos reached maxIter\n');
end







