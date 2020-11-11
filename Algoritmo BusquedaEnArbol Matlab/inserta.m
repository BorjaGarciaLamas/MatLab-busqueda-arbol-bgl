% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: inserta un nodo en una cola con un formato concreto en
% función del tipo de búsqueda
% Llamado por: principal.m, expandir.m, insertarTodo.m
% Llama a: nadie

function[cola] = inserta(elto, cola, tipo)
    

    %Si la búsqueda es por anchura 
    if tipo == 1
        
        %Se inserta por el final (cola)
        cola = [cola elto];
        
    end
    
    %Si la búsqueda es por profundidad
    if tipo == 2
        
        %Se inserta por arriba(pila)
        cola = [elto cola];
        
    end
   
    %Si la búsqueda es por Primero el mejor
    if tipo == 3
        
        %primero el mejor
        cola = [elto cola];
        
    end
    
end