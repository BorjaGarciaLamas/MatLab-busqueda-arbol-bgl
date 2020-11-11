% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: acción sobre un nodo en la que trasvasa el contenido de una
% garrafa a otra
% Llamado por: expandir.m
% Llama a: nadie

function[nodo] = trasvasar(nodo, maximos, posA, posB)
    
    %Si destino y origen son distintos en el trasvaso del agua
    if posA == posB

    %No hacemos nada porque no se puede trasvasar siendo el origen y
    %destino la misma garrafa

    else
        
        %Si la cantidad que pasas más lo que hay en el destino sobrepasan
        %la capacidad de la garrafa destino (la desborda)
        if (nodo.Estado(posA) + nodo.Estado(posB)) > maximos(posB)

            nodo.Estado(posA) = nodo.Estado(posA) - (maximos(posB) - nodo.Estado(posB));

            nodo.Estado(posB) = maximos(posB);

        %Si la cantidad que pasas más lo que hay en el destino llena por
        %completo la garrafa destino
        elseif (nodo.Estado(posA) + nodo.Estado(posB)) == maximos(posB)

            nodo.Estado(posA) = 0;
            
            nodo.Estado(posB) = maximos(posB);

        %La garrafa destino ni se desborda ni se llena durante el trasvaso
        %de agua
        else

            nodo.Estado(posB) = nodo.Estado(posA) + nodo.Estado(posB);
            
            nodo.Estado(posA) = 0;

        end

    end
end


