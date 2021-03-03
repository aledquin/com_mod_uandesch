clear all;
close all;
clc;
l=45;
y=zeros(1,l);

contador_muestras =1;
a=arduino('com11','uno');

figure()
xlabel('#muestras'); ylabel('Voltaje');
grid on;
% hold on;

while contador_muestras <= 1000
    y(1:l-1)=y(2:l);
    y(l) = writeAnalogPin(a,'A0');
    mues =[contador_muestras-l contador_muestras+5];
    ylim([4 4.6]);
    %xlim(mues);
    plot(y);
    drawnow
    contador_muestras=contador_muestras+1;
end
