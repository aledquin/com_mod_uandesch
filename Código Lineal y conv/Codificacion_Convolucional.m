function [ tren_bits_salida ] = Codificacion_Convolucional( k, P_C )

[tren_bits,~]=tren_bin(100,k-1,1);
tren_bits=[1 0 1]
display(tren_bits);
%Se recibe como entrada el tren de bits de un largo "k", y el
%Polinomio caracteristico con el cual se extendera la dimensión de la
%codificacion. Si nuestro polinomio caracteristico es de dimensión m, 
%entonces el tren de bits de salida es de largo m.
%Se debe cumplir que el grado de cada polinomio es k...
% ...
%La forma que se ingresa el polinomio caracteristico es la siguiente:
% P_C = [1,1,1 ; 0,1,0] representa el polinomio de grado 2  de grado 2
% x^2+x+1 , 0*x^2+x+0 respectivamente, por ejemplo.

% Convolucionamos cada uno de los pilonomios caracteristicos por el tren de
% bits para cada polinomio caracteristico.
[m,~] = size(P_C);
bits_conv = [];
for i = 1:m
    bit_conv = conv(tren_bits, P_C(i,:));
    for j = 1:length(bit_conv)
        if mod(bit_conv(j),2) == 0   %Se verifica si la suma dio un...
                                     %...numero par o impar.
            bit_conv(j) = 0; %Si es par, la suma de bits es 0.
        else 
            bit_conv(j) = 1; %Si es impar, entonces la suma de bits es 1.
        end
    end
    display(bit_conv)
    bits_conv = [bits_conv;bit_conv];
end
tren_bits_salida = bits_conv';
end