rolloff =   0.25;
span    =   6;
sps     =   4;
sT=50;
t=0:1/sps:sT+6;
[a,results]   =   tren_bin(sT,3);
b   =   rcosdesign(rolloff , span , sps);

x   =   upfirdn(a , b , sps);
figure(2);
plot(t,x); grid on;

eyediagram(x,5);