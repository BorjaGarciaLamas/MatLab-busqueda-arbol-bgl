% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: expande un nodo
% Llamado por: principal.m
% Llama a: existe.m, llenar.m, vaciar.m, trasvasar.m, inserta.m,
% crearNodo.m, 

function [sucesores, abierta] = expandir(nodoAux,maximos, abierta, tipo)
    
    %Lista con las 3 acciones que se vana  realizar sobre un nodo en la
    %expansión del mismo
    acciones = ["llenar", "vaciar", "trasvasar"];
        
    %Última posición de la lista abierta
    s = numel(abierta) + 1;
    
    %Variable donde guardamos el nombre de la función
    fcn_name = '';
    
    %Lista de sucesores que vamos a obtener en las expansiones
    sucesores = [];
    
    %Bucle para recorrer las 3 acciones a realizar en la expansión de un
    %nodo de la frontera
    for i = 1:numel(acciones)
        
        %Limpiamos la variable fcn_name, que usaremos para llamar a la
        %función que se llame igual que la cadena que guarde
        clear(fcn_name)
        
        %Asignamos una a una las acciones a realizar(llenar, vaciar, trasvasar)
        fcn_name = acciones(i);
        
        %Si el valor de fcn_name es trasvasar
        if strcmp(fcn_name, "trasvasar")
            
                %Guarda en newNodo el resultado de ejecutar la función
                %trasvasar. Esto lo logramos con la función feval, que llama a
                %la función que se llame igual que el string que le damos de
                %entrada
                
            %Ejecutamos trasvasar 6 veces
            for m = 1:3

                for n = 1:3

                    %Calculamos el nuevo nodo y lo guardamos en nodoAux
                    newNodo = feval(fcn_name, nodoAux, maximos, m, n);
                    
                    %En esta línea miramos si el estado del nodo calculado está
                    %en abierta con la función existe
                    x = existe(newNodo.Estado, abierta);

                    %Si el estado está en la lista, devolverá 0, en cuyo caso
                    %no hay que hacerle caso
                    if x == 0

                       %Creamos el nuevo nodo
                       nodo = crearNodo(nodoAux, s, newNodo, acciones(i));
                       
                       %Guardamos el nodo en la lista sucesores
                       sucesores = inserta(nodo, sucesores, tipo);

                       %Guardamos el estado del nodo en la lista
                       %abierta
                       abierta = inserta(mat2cell(nodo.Estado, 1, 3), abierta, 1);

                    end
                end                           
            end
            
            %Insertamos el nodo expandido en sucesores después de trasvasar
            %(trasvasar es la última acción a realizar)
            sucesores = inserta(nodoAux, sucesores, tipo);
            
        %Si no es la función trasvasar (separamos trasvasar de las demás 
        %porque tiene unos parámetros de entrada distintos de vaciar y llenar)
        else
            
            %Realizamos cada acción de vaciar y llenar 3 veces sobre un
            %mismo nodo(una por cada garrafa)
            for j = 1:3
                
               %Si la acción a realizar es vaciar
                if strcmp(fcn_name, "vaciar")          
                        
                    %Ejecutamos la acción correspondiente y guardamos
                    %el nodo que devuelve en newNodo
                    newNodo = feval(fcn_name, nodoAux, j); 
                    
                    %En esta línea miramos si el estado del nodo calculado está
                    %en abierta con la función existe
                    x = existe(newNodo.Estado, abierta);

                    %Si el estado está en la lista, devolverá 0, en cuyo caso
                    %no hay que hacerle caso
                    if x == 0

                       %Creamos el nuevo nodo
                       nodo = crearNodo(nodoAux, s, newNodo, acciones(i));
                       
                       %Guardamos el nodo en la lista sucesores
                       sucesores = inserta(nodo, sucesores, tipo);

                       %Guardamos el estado del nodo en la lista
                       %abierta
                       abierta = inserta(mat2cell(nodo.Estado, 1, 3), abierta, 1);

                    end
                  
                else
                    
                    %Si llegamos aquí, la acción a realizar es llenar.
                    %Realizar eso siempre tiene sentido 
                    
                    %Evaluamos la función
                    newNodo = feval(fcn_name, nodoAux, j);  
                    
                    %En esta línea miramos si el estado del nodo calculado está
                    %en abierta con la función existe
                    x = existe(newNodo.Estado, abierta);
                    
                    %Si el estado está en la lista, devolverá 0, en cuyo caso
                    %no hay que hacerle caso
                    if x == 0
                        
                        %Creamos el nuevo nodo
                        nodo = crearNodo(nodoAux, s, newNodo, acciones(i));
                       
                        %Guardamos el nodo en la lista sucesores
                        sucesores = inserta(nodo, sucesores, tipo);
                        
                        %Guardamos el estado del nodo en la lista
                        %abierta
                        abierta = inserta(mat2cell(nodo.Estado, 1, 3), abierta, 1);
                        
                   end
                end
            end
        end
    end
end

