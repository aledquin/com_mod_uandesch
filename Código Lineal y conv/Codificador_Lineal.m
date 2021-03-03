function [ tren_bits_out ] = Codificador_Lineal( n,k)
%Codificador lineal requiere el largo de el espacio de los bits de salida 
% "n", el largo de lo bits de entrada "k", y el tren de bits
% de largo "k".

[tren_bits,~]=tren_bin(100,k-1,1);

largo_in = length(tren_bits);

%Se revisa que sean los mismos largos.
if k ~= largo_in
    error('invalido, el largo del tren de bits no es igual al de los bits de entrada');
end

%se obtiene los trenes de bits de salida de todas las combinaciones.
sout = Codework(n,k);

%Ahora como la codificacion por bloques, la lineal, nos entrega siempre el
%tren de bit de entrada en los ultimos "k" bits de nuestro tren de salida,
%podemos encontrar cual sería la salida de nuestro codificar teniendo el
%tren de bits de entrada.

Codificacion_Encontrada = 0;
for i = 1:2^k
    tren_bit_inp = sout(i,n-k+1:n);
    if isequal(tren_bits,tren_bit_inp)
        tren_bits_out = sout(i,:);
        Codificacion_Encontrada = 1;
        break
    end
end
if Codificacion_Encontrada == 0
    error('No se encontro codificación');
end
display(tren_bits)
figure(2)
plot(tren_bits_out)
end