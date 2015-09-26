%% ======================================================================
%% assert-retract.pl
%% programme de test pour les prédicat assert, retract, dynamic.
%% ======================================================================

%% modules
:- use_module(show_list).
:- use_module(rules).
:- use_module(basic_data).


findParents(People) :-
	homme(People),
	enfantDe(People, Pere, Mere),
	writef('%t est fils de %t et %t\n', [People, Pere, Mere]).
findParents(People) :-
	femme(People),
	enfantDe(People, Pere, Mere),
	writef('%t est fille de %t et %t\n', [People, Pere, Mere]).
	
	
findAllChilds :-
	findall(Person, enfantDe(Person, _, _), Bag),
	showList(Bag, 'les enfants').
	
main :-
	writef('---------------------------------------------\n'),
	writef('Rempli la base des hommes\n'),
	setHomme([jeanluc, jeanpierre]),
	writef('Rempli la base des femmes\n'),
	setFemme([myriam, claire, maryse, fabienne]),
	writef('Rempli la base des pères\n'),
	setPere([jean, jeanluc, 
		claude, myriam, 
		claude, fabienne, 
		alain, claire,
		marcel, monique]),
	writef('Rempli la base des mères\n'),
	setMere([maryse, myriam, 
		maryse, fabienne, 
		myriam, claire,
		alice, monique]),

	writef('---------------------------------------------\n'),
	writef('recherche des parents de Claire\n'),
	findParents(claire),
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