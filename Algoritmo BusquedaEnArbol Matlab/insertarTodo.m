% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: Inserta un conjunto de nodos en una cola
% Llamado por: principal.m
% Llama a: inserta.m

function[cola] = insertarTodo(conjunto, cola , tipo)
    
    %Para cada elemento del conjunto de entrada
    for i = 1:numel(conjunto)
        
        %Insertamos en la cola el elemento i del conjunto
        cola = inserta(conjunto(i), cola , tipo);
        
    end
end