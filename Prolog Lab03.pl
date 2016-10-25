/* ITESM CAMPUS QUERETARO
 * LABORATORIO #3 DE PROLOG
 * JOEL ALEXIS BUSTAMANTE CALVARIO
*/



%Problema 1
/*De una lista determina si hay numero positivo
Ejemplos de entrada:
?-algun_positivo([-1,-2,3,-4]).
true.

?-algun_positivo([-1,-2,-3,-4]).
false.

?-algun_positivo([1,2,3,4]).
true.*/
algun_positivo([H|T]) :- (H >= 0 ->true;algun_positivo(T)).


/*Problema 2
De una lista substituye todas las ocurrencias de un elemento por otro

Ejemplo:
substituye(2,0,[1,2,2,2,3,2],Lista).
Lista = [1, 0, 0, 0, 3, 0].

*/

%Caso base, la lista esta vacia
substituye(Old,New,[],[]).

%Predicado a ejecutar cuando un elemento de la lista es distinto al
%elemento que se desa cambiar (Old)
substituye(Old,New,[H|T],[H|Res]):- H\=Old,
	                         substituye(Old,New,T,Res).

%Predicado a ejecutar cuando se encuentra una ocurrencia
substituye(Old,New,[H|T],[New|Res]) :- substituye(Old,New,T,Res).


/*Problema 3
Elimina los elementos duplicados de una lista

Ejemplo:
sin_duplicados([a,a,a,a,b,c,c,a,a,d,e,e,e,e],Lista).
Lista = [a, b, c, d, e].

*/
%Verificar si un elemento esta en la lista
miembro(X,[H|T]) :- (X=H -> true;miembro(X,T)).

% Elimina es auxiliar para este caso, permite eliminar todos los
% elementos de una lista que son iguales al elemento dado
elimina(X,[],[]).
elimina(X,[H|T],[H|Res]):- H\=X,
	                   elimina(X,T,Res).

%Se encontro X
elimina(X,[H|T],Res) :- elimina(X,T,Res).


sin_duplicados([],[]).
% Se añade el elemento a la lista nueva y se eliminan las repeticiones
% que tenga en el resto de la lista original
sin_duplicados([H|T],[H|Res]):- elimina(H,T,Temp),
				sin_duplicados(Temp,Res).

/*Problema 4
Interseccion de dos conjuntos
Se asume que las dos listas a recibir cumplen las propiedades de
conjuntos

Ejemplo:
interseccion([a,b,c,d],[b,d,e,f],Lista).
Lista = [b, d].

*/

%Caso base
interseccion([],L2,[]).

%Se encontro un elemento que intersecta
interseccion([H|T],L2,[H|Res]) :- miembro(H,L2),
	                          interseccion(T,L2,Res).

%El elemento actual no intersecta
interseccion([H|T],L2,Res) :- interseccion(T,L2,Res).


/*Problema 5
Determinar si una lista recibida es palindroma
Ejemplo:
palindroma([a,b,c,b,a]).
true.

palindroma([a,b,c,cc,b,a]).
false.

*/

% Invertir una lista, esta funcion es auxiliar, para verificar si es
% palindroma o no habrá que comparar si la lista original es igual
% que la lista original invertida

invierte([],L,L).
invierte([H|T],L,Res) :- invierte(T,[H|L],Res).

son_iguales([],[]).
son_iguales([H1|T1],[H2|T2]):- (H1=H2->son_iguales(T1,T2);false).


palindroma(Lista) :- invierte(Lista,[],Res),
		     son_iguales(Lista,Res).


/*Problema 6
Devuelve de una lista todos los elementos menores o iguales a un
numero dado

Ejemplo:

menor_igual(5,[1,6,5,2,7],Res).
Res = [1, 5, 2].

menor_igual(3,[1,6,5,2,7],Res).
Res = [1,2].

menor_igual(-8,[1,6,5,2,7],Res).
Res = [].

menor_igual(8,[1,6,5,2,7],Res).
Res = [1,6,5,2,7].

*/

%caso base
menor_igual(N,[],[]).

%
menor_igual(N,[H|T],[H|Res]) :- H=<N,
				menor_igual(N,T,Res).

menor_igual(N,[H|T],Res) :- menor_igual(N,T,Res).


/*Problema 7
Devuelve de una lista cuyo resultado es aplicarle modulo de la segunda
Se asume que las listas son del mismo tamaño

Ejemplo:
mod_listas([12,13,51],[3,7,13],Res).
Res = [0, 6, 12].

?- mod_listas([2,3,5],[3,7,3],Res).
Res = [2, 3, 2].
*/

%Caso base
mod_listas([],[],[]).

mod_listas([H1|T1],[H2|T2],[Temp|Res]) :- Temp is mod(H1,H2),
					  mod_listas(T1,T2,Res).




















