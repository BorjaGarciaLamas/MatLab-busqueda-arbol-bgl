% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: crea un nodo nuevo
% Llamado por: expandir.m
% Llama a: nadie

function [nodo] = crearNodo(nodoAux, s, newNodo, accion)
    
    %Guardamos el orden del nuevo nodo
    nodo.Orden = s;

    %Guardamos el estado del nuevo nodo (recién calculado)
    nodo.Estado = newNodo.Estado;

    %Guardamos el estado del nodo padre (estado del nodo expandido)
    nodo.NodoPadre = nodoAux.Estado;

    %Guardamos la acción realizada para llegar aquí
    nodo.Accion = accion;

    %Guardamos el coste del nodo
    nodo.Coste = newNodo.Coste;

    %Guardamos la profundidad del nodo
    nodo.Profundidad = nodoAux.Profundidad + 1;

    %Aumentamos s (con s controlamos el índice del nodo)
    s = s + 1;

end

