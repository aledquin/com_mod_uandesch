function [ base ] = Matriz_Generadora( n,k )
%Esta función generara una base tal que lleve un vector de dimensión "k" a
%un vector de dimensión "n".

%Primero calculamos la dimension minima tal que nuestras base sea la
%optima.
dmin = round( n*2^(k-1)/(2^k-1));

%Necesitamos generar todas las posibles bases.
PosiblesBase = zeros(2^n,n);
for i = 0:2^n-1
    vecbase = dec2bin(i,n);
    for j= 1:n
        PosiblesBase(i+1,j) = str2double(vecbase(j)); %Se agrega un vector de la base.
    end;
end;

% Ahora filtramos las bases que no cumplen con nuestra distancia minima.
BaseMin = [];
for i = 1:2^n
    d = sum(PosiblesBase(i,:));
    if d == dmin
        BaseMin = [BaseMin;PosiblesBase(i,:)];
    end
end
[m,~]=size(BaseMin);
verificadorDeBase = zeros(1,k);
base = [];
for i = 1:m
    vector = BaseMin(i,n-k+1:n);
    suma = sum(vector);
    if suma == 1
        posicion = find(vector,1); %Entrega la posicion del bit 1.
        if verificadorDeBase(posicion) == 0
            base = [base;BaseMin(i,:)];            
            verificadorDeBase(posicion) = 1;
        end
    end
end
[m,~] = size(base);
%Ahora damos vuelta nuestra base para que nos quede la identidad del lado
%derecho de nuestra matriz.
baseAux = base*0;
for i = 1:m
   baseAux(m-i+1,:) = base(i,:);
end
base = baseAux;
end

