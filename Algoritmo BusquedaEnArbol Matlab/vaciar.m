% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: Acción sobre un nodo en la que se vacía una de las garrafas
% Llamado por: expandir.m
% Llama a: nadie

function[nodo] = vaciar(nodo, posicion)

    %Si vaciamos la primera garrafa
    if posicion == 1
        
        %La garrafa 1 toma el valor 0
        nodo.Estado(1) = 0;
        
        %Como vaciamos 12 litros, el coste del nodo se vuelve 12
        nodo.Coste = 12;

    %La garrafa 2 toma el valor 0
    elseif posicion == 2
    
        %La garrafa 2 toma el valor 0
        nodo.Estado(2) = 0;
        
        %Como vaciamos 8 litros, el coste del nodo se vuelve 8
        nodo.Coste = 8;
    
    else
        
        %La garrafa 3 toma el valor 0
        nodo.Estado(3) = 0;
        
        %Como vaciamos 3 litros, el coste del nodo se vuelve 3
        nodo.Coste = 3;
    
    end
end

