% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: devuelve el primer elemento de la cola, y la cola sin dicho
% elemento
% Llamado por: principal.m
% Llama a: vacia.m

function[primerElto, cola] = borrarPrimero(cola)     
     
     %Si la cola no está vacía, cogemos el primero elemento
     empty = vacia(cola);
     
     if empty == 0
         
        %Cogemos el primero elemento de la cola y lo guardamos
         primerElto = cola(1);
     
     end
     
     %Actualizamos la cola(cada elemento 'sube una posición en la cola')
     if numel(cola) > 1
             
        %La nueva cola contendrá los elementos que hay desde la
        %posición 2 de la antigua cola hasta el último (usamos length para saber la longitud de la cola)
        cola = cola(2:length(cola));
             
     else
         
        %Si tan solo tiene un elemento
        cola = [];
     end
end