%% ======================================================================
%% assert-retract.pl
%% programme de test pour les prédicat assert, retract, dynamic.
%% ======================================================================

%% modules
:- use_module(show_list).
:- use_module(rules).
:- use_module(basic_data).
:- use_module(data_filler).


main :-
	writef('---------------------------------------------\n'),
	fillFemmes, fillHommes,
	fillPeres, fillMeres,
	
	findAllHommes,
	findAllFemmes,
	%% halt(1957),
	
	findParents(claire),
	%% halt,
	writef('---------------------------------------------\n'),
	writef('recherche des parents de Bernard\n'),
	findParents(bernard),
	writef('---------------------------------------------\n'),
	writef('recherche des parents de Myriam\n'),
	findParents(myriam),
	writef('---------------------------------------------\n'),
	writef('recherche de tous les enfants et de leurs parents\n'),
	findAllChilds,
	writef('FIN!!!\n'),
	halt.