% prela(Materia, Prelacion)
% Base de conocimiento: prelaciones directas
prela(ci2691, ci3661). % ci2691 prela a ci3661
prela(ci2525, ci2691).
prela(ci2691, ci3641).
prela(ci3641, ci3725).
prela(ci3725, ci3825). % ci3725 prela a ci3825
prela(ma1111, ci2525).

% prelacion_directa(A, B): A es una prelación directa de B
prelacion_directa(A, B) :- prela(A, B).

% prelacion_total(A, B): A es una prelación de B (directa o indirecta)
prelacion_total(A, B) :- prelacion_directa(A, B).
prelacion_total(A, B) :-
    prelacion_directa(A, C),
    prelacion_total(C, B).

% algunos comandos para ejecutar pruebas
% prelacion_directa(ci2691, ci3661).   
% prelacion_total(ma1111, ci3825).    
