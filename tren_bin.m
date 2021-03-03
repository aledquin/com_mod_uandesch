function [x,results] = tren_bin(n,f,PWR)
% 1 kHz sample freq for 1 s
rand_bin = rand(1,f+1);
rand_bin = round(rand_bin);

x=rand_bin;
T=length(x);
%n=100;
N=n*T;
dt=T/N;
t=0:dt:T;
y=zeros(1,length(t));
%y22 = wgn(length(t),1,-6);
y22=0;
for i=0:T-1;
    if x(i+1)==1
        y(i*n+1 : (i+1)*n)=PWR;
    else
        y(i*n+1 : (i+1)*n)=0;
    end;
end;

results = y+y22';
figure(1)
plot(t,results);
axis([0 t(end) -6 6]);
grid on;
title('NRZ-L');

end
