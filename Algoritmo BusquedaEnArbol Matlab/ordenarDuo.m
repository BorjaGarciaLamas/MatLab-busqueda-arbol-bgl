% Práctica: 1 Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 1 de octubre de 2020
% Descripción: ordena un vector en función de los valores de otro vector en
% orden ascendente
% Llamado por: heuristicas.m
% Llama a: nadie

function [cjto1] = ordenarDuo(cjto1, cjto2)

    %Esta función ordena los vectores con el algoritmo de ordenación
    %burbuja

    %Usamos 2 bucles for anidados para comparar cada elemento con el resto
    %de elementos del vector. Movemos un elemento si a la derecha existe otro 
    %más pequeño que el.
    for m = 1:numel(cjto2)

        for n = 1:numel(cjto2)

            %Si el elemento 'pivote' es mayor que otro elemento de la
            %lista, intercambian posiciones
            if cjto2(m) > cjto2(n)

                %Variables auxiliares para guardar los elementos que
                %corresponden al elemento más pequeño
                aux = cjto2(n);              
                nodoAux = cjto1(n);

                %Movemos los componentes más grandes a la posición del más
                %pequeño
                cjto2(n) = cjto2(m);                
                cjto1(n) = cjto1(m);

                %Movemos a la posición del elemento más grande el elemento
                %más pequeño
                cjto2(m) = aux;                
                cjto1(m) = nodoAux;

            end    
        end
    end

end

