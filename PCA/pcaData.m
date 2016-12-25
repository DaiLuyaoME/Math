function [x,y,z] = pcaData(flag)
switch flag
    case 1
        a=3;b=4;
        f=@(t)a*t+b;
        x=1:0.01:100;
        y=f(x);
    case 2
        r=3;t=linspace(0,2*pi,120);
        x=r*sin(t)+3;
        y=r*cos(t)+4;
    case 3 %ellipse
        a=7;b=24;t=linspace(0,2*pi,120);
        x=a*sin(t)+b;
        y=b*cos(t)+a;
    case 4 %cycloid curve
        a=6;theta=linspace(0,2*pi,120);
        x=a*(theta-sin(theta));
        y=a*(1-cos(theta));
    case 5 %heart curve
        a=6;theta=linspace(0,2*pi,120);
        x=a*(1-cos(theta)).*cos(theta);
        y=a*(1-cos(theta)).*sin(theta);
    case 6
        a=4;theta=linspace(0,6*pi,120);
        x=a*theta.*cos(theta);
        y=a*theta.*sin(theta);
    case 7
        x1=linspace(0,10,1000);
        x2=linspace(0,10,1000);
        x=cos(x1).*cos(pi/4)+sin(x2).*cos(pi/3);
        y=sin(x1).*sin(pi/4)+sin(x2).*sin(pi/6);
%% 3D plot
    case 8
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
        shading interp;
        xlabel('x');
        ylabel('y');
        zlabel('z');
        
        
end
end
