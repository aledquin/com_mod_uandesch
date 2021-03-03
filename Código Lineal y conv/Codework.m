function [ Resultado ] = Codework(n,k)
%La función codework recibe los parametros k y n, tal que k < n, de forma
%que lleva todos los posibles vectores de largo k (binario) a vectores
%binarios de largo n, mediante la base obtenida de la función "Base(n,k)".

%base = Base(n,k);   %Base Generadora
base = Matriz_Generadora(n,k)

% Ahora necesitamos generar todos los posibles vectores binarios de largo
% k.
vecK = zeros(2^k,k);
for i = 1:2^k-1
   veck = dec2bin(i,k);
    for j= 1:k
        vecK(i+1,j) = str2double(veck(j));
    end 
end
%display(vecK)
%Ahora que tenemos todas las posibles conbinaciones de entrada, debemos
%pasar cada uno de estos por nuestra base y asi generar todas las salidas
%de nuestra codificación.

Resultado = [];
for i = 1:2^k
    vec = vecK(i,:);                 %Se inicializa el vector input
    suma = zeros(1,n);               %Variable en donde se guardara...
                                     %...la suma de los vectores binarios.
    for j = 1:k
        if vec(j) == 1;              %Se verifica si el bit en "j" es 1.
            suma = suma + base(j,:); %Se suman las filas de la matriz.
        end
    end
    for j = 1:n
        if mod(suma(j),2) == 0       %Se verifica si la suma dio un...
                                     %...numero par o impar.
            suma(j) = 0; %Si es par, la suma de bits es 0.
        else 
            suma(j) = 1; %Si es impar, entonces la suma de bits es 1.
        end
    end       
    Resultado = [Resultado;suma]; %Se guarda el resultado.
end
end