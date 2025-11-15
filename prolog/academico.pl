% Base de conocimiento: profesores, estudiantes, materias y notas
dicta(leonardo, ci3661).
dicta(maria, ci3725).
dicta(pedro, ci2691).

cursa(ana, ci3661).
cursa(ana, ci3725).
cursa(juan, ci3661).
cursa(elena, ci2691).
cursa(elena, ci3725).

nota(ana, ci3661, 88).
nota(ana, ci3725, 70).
nota(juan, ci3661, 40). % juan clavó :c
nota(elena, ci2691, 51). % elena no tiene nota en ci3725 (la esta cursando)

% profesor_de(Prof, Est): Prof le da clases a Est en al menos una materia
profesor_de(Prof, Est) :-
    dicta(Prof, Mat),
    cursa(Est, Mat).

% aprobado(Est, Mat): Est aprobó la materia Mat (nota >= 50)
aprobado(Est, Mat) :-
    nota(Est, Mat, Nota),
    Nota >= 50.

% aplazado(Est): Est ha aplazado al menos una materia (nota < 50)
aplazado(Est) :-
    nota(Est, _, Nota), % _ Se usan cuando no nos importa el valor de un argumento
    Nota < 50.

% cursando_sin_nota(Est, Mat): Est cursa Mat pero no tiene nota registrada
cursando_sin_nota(Est, Mat) :-
    cursa(Est, Mat),
    not(nota(Est, Mat, _)). % verifica que no hay una nota registrada para Est en Mat.


% algunos comandos para ejecutar pruebas
% profesor_de(leonardo, ana).
% aprobado(elena, ci3725).
% aplazado(juan).
% cursando_sin_nota(elena, ci3725).