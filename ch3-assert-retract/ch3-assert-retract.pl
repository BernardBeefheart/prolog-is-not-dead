%% ======================================================================
%% assert-retract.pl
%% programme de test pour les prédicat assert, retract, dynamic.
%% ======================================================================

%% modules
:- use_module(show_list).
:- use_module(basic_data).
:- use_module(rules).
:- use_module(data_filler).
:- use_module(finders).

%% remplissage de la base
fillBase :-
	writef('---------------------------------------------\n'),
	writef('Remplissage de la base\n'),
	fillFemmes,
	fillHommes,
	fillPeres,
	fillMeres.
	
%% affiche l'ensemble des individus de la base	
showPeople :-
	findAllHommes,
	findAllFemmes.
	
testFindParents([]) :- writef('Fin du test findParents!\n').
testFindParents([Gamin | Tail]) :-
	findParents(Gamin),
	testFindParents(Tail).
	
%% point d'entrée du programme
main :-
	fillBase,
	showPeople,
	%% quelques tests de manipulation de la base
	testFindParents([claire, bernard, jean, myriam]),

	writef('---------------------------------------------\n'),
	writef('recherche de tous les enfants et de leurs parents\n'),
	findAllChilds,
	findAllMeres,
	findAllPeres,
	writef('FIN!!!\n'),
	halt.