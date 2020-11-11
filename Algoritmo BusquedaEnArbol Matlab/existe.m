% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: devuelve true si un elemento está contenido en una lista
% Llamado por: expandir.m
% Llama a: nadie

function [valor] = existe(estado,lista)
    
    %Valor para indicar si el elemento está en la lista o no
    valor = 0;
    
    %Buscamos a lo largo de toda la lista
    for i = 1:length(lista)
         
        %Si encontramos el elemento, igualamos valor a 1
        if (isequal(estado, cell2mat(lista(i))))
            
            valor = 1;
            
        end
    end
end

