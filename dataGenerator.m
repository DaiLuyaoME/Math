%% generate white noise
noisePower = 0.12;
N = 256;
u1 = sqrt(noisePower) * randn(1,N);
u2 = sqrt(noisePower) *randn(1,N);


%% generate filter
B1 = [ 1 , 1.98 , 0.98];
B2 = [ 1 , -1.98 , 0.98]; 
B3 = [ 1 , -1.8418, 0.98];
B4 = [ 1 , -1.5, 0.98];
B5 = [1, -1.2727, 0.98];
B = conv(conv(conv(conv(B1,B2),B3),B4),B5);
%%
v1 = filter(B,1,u1);
v2 = filter(B,1,u2);
v = v1 + 1i * v2;
%%
a1 = 12;
a2 = 12;
a3 = 6;
f1 = 0.22;
f2 = 0.21;
f3 = 0.12;
t = 0 : (N-1);
x1 = a1 * sin( 2 * pi * f1 * t);
x2 = a2 * sin( 2 * pi * f2 * t);
x3 = a3 * sin( 2 * pi * f3 * t);
x = v + x1 + x2 + x3;
%%
figure;plot(abs(x));
figure;plot(rad2deg(angle(x)));
%%
y = fft(x);
figure;
plot(abs(y));

