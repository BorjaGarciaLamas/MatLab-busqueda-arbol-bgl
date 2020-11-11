% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: ejecuta una heurística concreta de Primero el Mejor en el
% algoritmo y devuelve el conjunto ordenador para su inserción en la
% frontera
% Llamado por: principal.m
% Llama a: inserta.m, ordenarDuo.m

function[conjunto] = heuristicas(conjunto, objetivo, tipo)

    %Vector donde guardamos los resultados de las operaciones matemáticas
    %realizadas para calcular la distancia entre el objetivo y el estado
    %del nodo 
    resultado = [];
    
    %Si la heurística que se va a usar es dmc(Distancia Más Corta)
    if tipo == 1
        
        %Bucle for para ejecutar la operación matemática de dmc con cada
        %nodo del conjunto de sucesores obtenidos tras la expansión
        for i = 1:numel(conjunto)
            
            %Variable auxiliar para guardar el nodo actual
            nodo = conjunto(i);
            
            %Variable auxiliar para guardar el vector estado del nodo auxiliar
            vector = nodo.Estado;
            
            %Insertamos en el vector resultado el resultado obtenido de la
            %operación matemática dmc
            resultado = inserta((abs(vector(1) - objetivo(1)) + abs(vector(2) - objetivo(2)) + abs(vector(3) - objetivo(3))), resultado, 1);            

        end
        
        %Llamamos a la función ordenarDuo para ordenar el vector de nodos
        %sucesores de forma ascendiente en función del resultado obtenido
        %con cada uno de ellos en la operación dmc
        conjunto = ordenarDuo(conjunto, resultado);
    
    end
    
    %Si la heurística que se va a usar es msd(Menor Suma Diferencia)
    if tipo == 2
        
        %Bucle for para ejecutar la operación matemática de dmc con cada
        %nodo del conjunto de sucesores obtenidos tras la expansión
        for i = 1:numel(conjunto)
            
            %Variable auxiliar para guardar el nodo actual
            nodo = conjunto(i);
            
            %Variable auxiliar para guardar el vector estado del nodo auxiliar 
            vector = nodo.Estado;
            
            %Insertamos en el vector resultado el resultado obtenido de la
            %operación matemática msd
            resultado = inserta((abs(vector(1) + vector(2) + vector(3)) - abs(objetivo(1) + objetivo(2) + objetivo(3))), resultado, 1);            

        end
        
        %Llamamos a la función ordenarDuo para ordenar el vector de nodos
        %sucesores de forma ascendiente en función del resultado obtenido
        %con cada uno de ellos en la operación msd
        conjunto = ordenarDuo(conjunto, resultado);

    end
end
