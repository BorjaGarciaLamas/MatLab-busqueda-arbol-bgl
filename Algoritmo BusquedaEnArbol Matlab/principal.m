% Práctica 1: Búsqueda en árboles
% Autor: Borja García Lamas
% Fecha: 31 de octubre de 2020
% Descripción: agrupa a las distintas funciones y genera la búsqueda y la
% solución del árbol
% Llamado por: nadie
% Llama a: inserta.m, vacia.m, testObjetivo.m, borrarPrimero.m,
% insertarTodo.m, solucion.m, expandir.m, hacerCola.m heuristicas.m


%--------------------------------------------------------------------------
%DEFINICIÓN DE VARIABLES
%--------------------------------------------------------------------------
%Primero definimos las variables que vamos a necesitar para el algoritmo

%Lista con la capacidad máxima de cada garrafa
maximos = [12 8 3];

%Variable para controlar el tipo de búsqueda
busqueda = 0;

%Variable donde especificamos el estado a encontrar en el árbol
Objetivo = [12 0 0];

%Tipo de heurística que se quiere hacer
%TIPO 1 ---------> dmc
%TIPO 2 ---------> msdi
heuristica = 2;

%--------------------------------------------------------------------------
%Definimos la estructura que tendrá un nodo cualquiera
%--------------------------------------------------------------------------
%Generamos los campos la estructura que tendrá un nodo cualquiera

%Orden: índice del nodo que nos servirá de referencia en las listas
campo1 = 'Orden';   val1 = [];

%Estado: estado de ese nodo (ej: [0 0 1])
campo2 = 'Estado';  val2 = [];

%NodoPadre: Nodo del que proviene este partir de realizar una acción sobre el padre
campo3 = 'NodoPadre';   val3 = [];

%Accion: accion que se ha realizado sobre el padre para llegar a este nodo
campo4 = 'Accion';  val4 = [];

%Coste: coste que ha llevado llegar a este nodo
campo5 = 'Coste';   val5 = [];

%Profundidad: profundidad del nodo
campo6 = 'Profundidad'; val6 = [];


%--------------------------------------------------------------------------
%Definimos la estructura nodo y el nodo raíz
%--------------------------------------------------------------------------

%definimos la estructura dándole el nombre de nodo
nodo = struct(campo1, val1, campo2, val2, campo3, val3, campo4, val4, campo5, val5, campo6, val6);

 %Generamos un nodo raíz
nodo(1).Orden = 1;
nodo(1).Estado = [0 0 0];
nodo(1).NodoPadre = [];
nodo(1).Accion = '';
nodo(1).Coste = 0;
nodo(1).Profundidad = 0;

%--------------------------------------------------------------------------
%COMIENZO DEL TRONCO DEL PROGRAMA
%--------------------------------------------------------------------------
%Mientras el usuario no tome la decisión de salir del programa
while (busqueda ~= 4)

    %Menú donde indicamos las opciones existentes
    fprintf('\n---------------------------------------------------------------------\n')
    disp('INICIO DEL PROGRAMA DE BÚSQUEDA')
    disp('---------------------------------------------------------------------')
    fprintf('\n')
    disp('*********************************************************************')
    disp('Seleccione el tipo de búsqueda que desea realizar')
    disp('*********************************************************************')
    fprintf('1.\t Búsqueda en anchura')
    fprintf('\n')
    fprintf('2.\t Búsqueda en profundidad')
    fprintf('\n')
    fprintf('3.\t Búsqueda Primero el mejor')
    fprintf('\n')
    fprintf('4.\t Salir')
    fprintf('\n')
    disp('---------------------------------------------------------------------')
    fprintf('\n')

    %Solicitamos al usuario que introduzca la opción y la guardamos en busqueda
    prompt = 'Introduzca un número en función de la búsqueda que desea: ';
    busqueda = input(prompt);
 
    %Switch para gestionar cada búsqueda posible
    switch busqueda
        
        %Caso 1: búsqueda en anchura
        case 1
            
            %flg_salida: flag que usamos para indicar cuando acabar el programa
            flg_salida = 0;          

            %Inicializamos una variable a la que llamamos estado_inicial con el estado
            %del nodo raíz
            estado_inicial = nodo(1).Estado;

            %abierta: lista para controlar los estados que ya han sido recorridos, logrando evitar bucles
            abierta = hacerCola();
            
            %frontera: lista que contendrá los nodos a expandir
            frontera = hacerCola();

            %Llenamos la frontera con el único nodo que tenemos(el nodo raíz)
            frontera = inserta(nodo(1), frontera, busqueda);
            
            %Metemos en abierta el estado del nodo inicial 
            abierta = inserta(mat2cell(estado_inicial, 1, 3), abierta, busqueda);
                
            while flg_salida ~= 1

                %Comprobamos si la cola está vacía(fallo)
                if vacia(frontera) 

                    disp('Error, no se pudo encontrar la solución en el árbol')

                    return;
                else

                    %Guardamos en nodoAux el primero de la frontera, borrándolo de esa lista   
                    [nodoAux, frontera] = borrarPrimero(frontera);
                    
                    %Variable para comparar el estado
                    estatus = nodoAux.Estado;

                    %Comparamos su estado con el objetivo
                    if testObjetivo(estatus, Objetivo)

                        %Volvemos a añadir el nodo que es la solución a la
                        %frontera
                        frontera = inserta(nodoAux, frontera, 2);
                        
                        %Llamamos a la función solución para mostrar el
                        %camino recorrido hasta el objetivo en el árbol
                        solucion(frontera)
                        
                        %Establecemos el flag de salida a 1 (ya hemos acabado la búsqueda)
                        flg_salida = 1;

                    %Si no es el objetivo
                    else
                        
                        %Guardamos en frontera los nuevos sucesores, resultados de expandir
                        %nodoAux
                        [conjunto, abierta] = expandir(nodoAux, maximos, abierta, busqueda);
                        
                        frontera = insertarTodo(conjunto, frontera, busqueda);
                        
                    end
                end
            end
       
        case 2
            
            %flg_salida: flag que usamos para indicar cuando acabar el programa
            flg_salida = 0;
           
            %Inicializamos una variable a la que llamamos estado_inicial con el estado
            %del nodo raíz
            estado_inicial = nodo(1).Estado;

            %abierta: lista para controlar los estados que ya han sido recorridos, logrando evitar bucles
            abierta = hacerCola();
            
            %frontera: lista que contendrá los nodos a expandir
            frontera = hacerCola();

            %Llenamos la frontera con el único nodo que tenemos(el nodo raíz)
            frontera = inserta(nodo(1), frontera, busqueda);
            
            %Metemos en abierta el estado del nodo inicial 
            abierta = inserta(mat2cell(estado_inicial, 1, 3), abierta, busqueda);
                
            while flg_salida ~= 1

                %Comprobamos si la cola está vacía(fallo)
                if vacia(frontera) 

                    disp('Error, no se pudo encontrar la solución en el árbol')

                    return;
                else

                    %Guardamos en nodoAux el primero de la frontera, borrándolo de esa lista   
                    [nodoAux, frontera] = borrarPrimero(frontera);
                                        
                    %Variable para comparar el estado
                    estatus = nodoAux.Estado;

                    %Comparamos su estado con el objetivo
                    if testObjetivo(estatus, Objetivo)

                        %Volvemos a añadir el nodo que es la solución a la
                        %frontera
                        frontera = inserta(nodoAux, frontera, 2);
                        
                        %Llamamos a la función solución para mostrar el
                        %camino recorrido hasta el objetivo en el árbol
                        solucion(frontera)
                        
                        %Establecemos el flag de salida a 1 (ya hemos acabado la búsqueda)
                        flg_salida = 1;

                    %Si no es el objetivo
                    else
                        
                        %Guardamos en frontera los nuevos sucesores, resultados de expandir
                        %nodoAux
                        [conjunto, abierta] = expandir(nodoAux, maximos, abierta, busqueda);
                        
                        frontera = insertarTodo(conjunto, frontera, busqueda);
                        
                    end
                end
            end
            
        case 3
            
            %flg_salida: flag que usamos para indicar cuando acabar el programa
            flg_salida = 0;

            %Inicializamos una variable a la que llamamos estado_inicial con el estado
            %del nodo raíz
            estado_inicial = nodo(1).Estado;

            %abierta: lista para controlar los estados que ya han sido recorridos, logrando evitar bucles
            abierta = hacerCola();
            
            %frontera: lista que contendrá los nodos a expandir
            frontera = hacerCola();

            %Llenamos la frontera con el único nodo que tenemos(el nodo raíz)
            frontera = inserta(nodo(1), frontera, busqueda);
            
            %Metemos en abierta el estado del nodo inicial 
            abierta = inserta(mat2cell(estado_inicial, 1, 3), abierta, busqueda);
                
            while flg_salida ~= 1

                %Comprobamos si la cola está vacía(fallo)
                if vacia(frontera) 

                    disp('Error, no se pudo encontrar la solución en el árbol')

                    return;
                else

                    %Guardamos en nodoAux el primero de la frontera, borrándolo de esa lista   
                    [nodoAux, frontera] = borrarPrimero(frontera);
                    
                    %Variable para comparar el estado
                    estatus = nodoAux.Estado;

                    %Comparamos su estado con el objetivo
                    if testObjetivo(estatus, Objetivo)

                        %Volvemos a añadir el nodo que es la solución a la
                        %frontera
                        frontera = inserta(nodoAux, frontera, 2);
                        
                        %Llamamos a la función solución para mostrar el
                        %camino recorrido hasta el objetivo en el árbol
                        solucion(frontera)
                        
                        %Establecemos el flag de salida a 1 (ya hemos acabado la búsqueda)
                        flg_salida = 1;

                    %Si no es el objetivo
                    else
                        
                        %Guardamos en frontera los nuevos sucesores, resultados de expandir
                        %nodoAux
                        [conjunto, abierta] = expandir(nodoAux, maximos, abierta, busqueda);
                        
                        conjunto = heuristicas(conjunto, Objetivo, heuristica);
                        
                        frontera = insertarTodo(conjunto, frontera, busqueda);
                        
                    end
                end
            end
            
        case 4
            
            %Salir el programa
            disp('Ha optado por salir del programa')
            
            break;
        
        %El usuario inserta un valor que no está entre las opciones [1 a 4]
        otherwise 
            
            disp('Opción no válida, instroduzca un valor entre el 1 y el 4')
            
    end
end

%--------------------------------------------------------------------------
%FIN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
