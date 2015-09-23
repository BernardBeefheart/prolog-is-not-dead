/*
 * main.pl
 * compilation : swipl --goal=main --stand_alone=true -o try-main -c main.pl
 */

/**
 * affiche les arguments un par un
 */

showEachArgs(['--help'|Tail]) :-
	writef('-> you need some help!\n', [Head]),
	showEachArgs(Tail).
showEachArgs([Head|Tail]) :-
	writef('-> %t\n', [Head]),
	showEachArgs(Tail).
showEachArgs([]) :- writef('end of arguments').

/**
 * gère l affichage des arguments
 */
showArgs :-
	/* récupère TOUS les arguments dont le nom du programme
	   comme en C */
        current_prolog_flag(argv, Argv),
        /* concatène les arguments, séparé par un espace */
        concat_atom(Argv, ' ', SingleArg),
        /* envoie le résultat à la console */
        writef('all args %t\n', [SingleArg]),
        showEachArgs(Argv).

/**
 * point d'entrée du programme
 */
main :-
        showArgs,
        halt.