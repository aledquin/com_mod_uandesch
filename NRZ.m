
x=tren_bin(1e3);
T=length(x);
n=100;
N=n*T;
dt=T/N;
t=0:dt:T;
y=zeros(1,length(t));
for i=0:T-1;
    if x(i+1)==1
        y(i*n+1 : (i+1)*n)=5;
    else
        y(i*n+1 : (i+1)*n)=-5;
    end;
end;
plot(t,y);
axis([0 t(end) -6 6]);
grid on;
title('NRZ-L');