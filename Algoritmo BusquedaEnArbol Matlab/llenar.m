% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: acción sobre un nodo en la que se llena una de las garrafas
% Llamado por: expandir.m
% Llama a: nadie

function [nodo] = llenar(nodo,posicion)
    
    %LLenamos la primera garrafa
    if posicion == 1
    
        nodo.Estado(1) = 12;
    
    end
    
    %Llenamos la segunda garrafa
    if posicion == 2
        
        nodo.Estado(2) = 8;
    
    end
    
    %Llenamos la tercera garrafa
    if posicion == 3
        
        nodo.Estado(3) = 3;
    
    end
    
end

