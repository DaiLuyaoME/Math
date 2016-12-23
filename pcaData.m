function [x,y,z] = pcaData(flag)
switch flag
    case 1
        a=3;b=4;
        f=@(t)a*t+b;
        x=1:0.1:100;
        y=f(x);
    case 2
        r=3;t=linspace(0,2*pi,120);
        x=r*sin(t);
        y=r*cos(t);
    case 3 %ellipse
        a=8;b=6;t=linspace(0,2*pi,120);
        x=a*sin(t);
        y=b*cos(t);
    case 4 %cycloid curve
        a=6;theta=linspace(0,2*pi,120);
        x=a*(theta-sin(theta));
        y=a*(1-cos(theta));
    case 5
        a=6;theta=linspace(0,2*pi,120);
        x=a*(1-cos(theta)).*cos(theta);
        y=a*(1-cos(theta)).*sin(theta);
        
    case 6
        num=70;
        [x,y]=meshgrid(linspace(-8,8,num));
        r=sqrt((x-3).^2+y.^2)+eps;
        z=sin(r)./r;
        figure;
        surf(x,y,z);
        axis tight;
        x=reshape(x,[],1);
        y=reshape(y,[],1);
        z=reshape(z,[],1);
        
end
end
