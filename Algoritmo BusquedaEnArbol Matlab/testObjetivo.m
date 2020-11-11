% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: compara el estado de un nodo con el estado objetivo y
% devuelve si son iguales
% Llamado por: principal.m
% Llama a: nadie

function [aux] = testObjetivo(sol, objetivo)
    
    %Valor que devolvemos donde indicamos si son iguales o no
    aux = 0;
    
    %Si son iguales la solución propuesta y el objetido, aux toma el valor
    %de 1
    if isequal(sol, objetivo)
       
        aux = 1;
        
    end
    
end

