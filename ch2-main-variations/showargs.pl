/*
 * showargs.pl
 */
 
%% avec cette directive, seules les prédicats exportés sont accessibles
%% depuis l'extérieur
%% ici, showEachArgs est inaccessible par main
:- module(showargs,
	[showArgs/0]).
	
%%	[showArgs/0, showEachArgs/1]).


/**
 * affiche les arguments un par un
 */
% gestion de l'argument --help
showEachArgs(['--help'|Tail]) :-
	writef('-> you need some help!\n'),
	showEachArgs(Tail).
% gestion d'un argument simple
showEachArgs([Head|Tail]) :-
	writef('-> %t\n', [Head]),
	showEachArgs(Tail).
% fin de la liste
showEachArgs([]) :- writef('end of arguments\n').

/**
 * gère l'affichage des arguments
 */
showArgs :-
	% récupère TOUS les arguments dont le nom du programme
	% comme en C
        current_prolog_flag(argv, Argv),
        % concatène les arguments, séparé par un espace
        concat_atom(Argv, ' ', SingleArg),
        % envoie le résultat à la console
        writef('all args %t\n', [SingleArg]),
        showEachArgs(Argv).

 