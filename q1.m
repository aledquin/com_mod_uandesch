clear all;
close all;
clc;

a = arduino('COM11','uno');
av = readVoltage(a,5);
while(1)
    writeDigitalPin(a,3,1);
    pause(1)
    writeDigitalPin(a,3,0);
    pause(1)
end