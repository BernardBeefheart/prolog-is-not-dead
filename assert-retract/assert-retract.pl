%%
%% assert-retract.pl
%% programme de test pour les prédicat assert, retract, dynamic.

:- use_module(tools).
:- use_module(show_list).

%% les prédicats suivants sont déjà en partie existant
:- dynamic homme/1.
:- dynamic femme/1.
:- dynamic pere/2.
:- dynamic mere/2.

%% les données
homme(bernard).
homme(jean).
femme(monique).

pere(jean, bernard).
mere(monique, bernard).

%% les règles
setHomme([]).
setHomme([Head | Tail]) :-
	assert(homme(Head)),
	setHomme(Tail).
	
setFemme([]).
setFemme([Head | Tail]) :-
	assert(femme(Head)),
	setFemme(Tail).

ensureHomme(Pere) :- homme(Pere); setHomme([Pere]).
ensureFemme(Pere) :- femme(Pere); setFemme([Pere]).

setPere([]).
setPere([Personne]) :-
	writef('Il manque un enfant dans la liste des pères, %t est sans enfants\n', [P]).
setPere([Pere, Enfant | Tail]) :-
	ensureHomme(Pere),
	assert(pere(Pere, Enfant)),
	setPere(Tail).
	
setMere([]).
setMere([Personne]) :-
	writef('Il manque un enfant dans la liste des mères, %t est sans enfants\n', [P]).
setMere([Mere, Enfant | Tail]) :-
	ensureFemme(mere),
	assert(mere(Mere, Enfant)),
	setMere(Tail).

enfantDe(Enfant, Pere, Mere) :- 
	mere(Mere, Enfant), 
	pere(Pere, Enfant).

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