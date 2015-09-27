%% ======================================================================
%% assert-retract.pl
%% programme de test pour les prédicat assert, retract, dynamic.
%% ======================================================================

%% modules
:- use_module(show_list).
:- use_module(rules).
:- use_module(basic_data).
:- use_module(data_filler).

%% remplissage de la base
fillBase :-
	writef('---------------------------------------------\n'),
	writef('Remplissage de la base\n'),
	fillFemmes, fillHommes,
	fillPeres, fillMeres.
	
%% affiche l'ensemble des individus de la base	
showPeople :-
	findAllHommes,
	findAllFemmes.
	
%% point d'entrée du programme
main :-
	fillBase,
	
	showPeople,
	
	%% quelques tests de manipulation de la base
	findParents(claire),

	findParents(bernard),
	
	findParents(myriam),

	writef('---------------------------------------------\n'),
	writef('recherche de tous les enfants et de leurs parents\n'),
	findAllChilds,
	writef('FIN!!!\n'),
	halt.