% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: pinta en pantalla la solución
% Llamado por: principal.m
% Llama a: nadie

function [] = solucion(frontera)
        
    %Variable para controlar el coste total
    coste = 0;

    %Variable aux para guardar el nodo solución y pintarlo
    aux = frontera(1);
    
    %Variable para controlar los padres a la hora de recorrer el camino
    %inverso (desde la solución hasta el inicio)
    padre = aux.NodoPadre;

    %Pintamos la solución
    fprintf('\n\t\t\t\tSOLUCION')
    
    fprintf('\n--------------------------------------------------\n')
    
    %Mostramos el nodo solución
    fprintf('Estado ----> %d %d %d\t Acción ----> %s\n', aux.Estado, aux.Accion)    
    
    %Mientras el estado padre no sea el estado padre del nodo inicial 
    %(este [])
    while ~isequal(padre, [])
     
        %Bucle para la búsqueda a lo largo de toda la frontera del nodo
        %padre 
        for i = 1:numel(frontera)
        
            %Si el padre de un nodo es igual al campo padre de la posición
            %de la frontera
            if isequal(frontera(i).Estado, padre)
            
                %Mostramos el estado y la acción con la que se llegó a ese
                %estado
                fprintf('Estado ----> %d %d %d\t Acción ----> %s\n', frontera(i).Estado, frontera(i).Accion)    
                
                %Actualizamos el nuevo padre a buscar
                padre = frontera(i).NodoPadre;
                
                %Actualizamos el coste
                coste = coste + frontera(i).Coste;
                
                %Salimos del bucle for porque ya no hace falta buscar el
                %padre de ese nodo, toca empezar a buscar desde el
                %principio con el padre actualizado
                break;
                
            end
        end
    end
    
    disp('***')
    
    %Mostamos el número de nodos expandidos
    fprintf('Número de nodos expandidos: %d\n', numel(frontera) - 1)
    
    %Mostramos el coste total
    fprintf('Coste total (en litros de agua vaciados): %d\n', coste)
    
end

