%%
%% assert-retract.pl
%% programme de test pour les prédicat assert, retract, dynamic.

:- dynamic homme/1.
:- dynamic femme/1.
:- dynamic pere/2.
:- dynamic mere/2.

car([], _) :- fail.
car([Head | _], Head).

cdr([], _) :- fail.
cdr([_ | Tail], Tail).

homme(bernard).
homme(jean).
femme(monique).

pere(jean, bernard).
mere(monique, bernard).

setHomme([]).
setHomme([Head | Tail]) :-
	assert(homme(Head)),
	setHomme(Tail).
	
setFemme([]).
setFemme([Head | Tail]) :-
	assert(femme(Head)),
	setFemme(Tail).

setPere([]).
setPere([P]) :-
	writef('Il manque un enfant dans la liste des pères, %t est sans enfants\n', [P]).
setPere([Pere | Tail]) :-
	car(Tail, Enfant),
	assert(pere(Pere, Enfant)),
	cdr(Tail, Reste),
	setPere(Reste).
	
setMere([]).
setMere([P]) :-
	writef('Il manque un enfant dans la liste des mères, %t est sans enfants\n', [P]).
setMere([Mere | Tail]) :-
	car(Tail, Enfant),
	assert(mere(Mere, Enfant)),
	cdr(Tail, Reste),
	setMere(Reste).

enfantDe(Enfant, Pere, Mere) :- 
	mere(Mere, Enfant), 
	pere(Pere, Enfant).

findParents(People) :-
	writef('findParents homme\n'),
	writef('recherch (homme) de %t\n', [People]),
	homme(People),
	writef('%t est un garçon\n', [People]),
	enfantDe(People, Pere, Mere),
	writef('%t est fils de %t et %t\n', [People, Pere, Mere]).
findParents(People) :-
	writef('findParents femme\n'),
	writef('recherch (femme) de %t\n', [People]),
	femme(People),
	writef('%t est une fille\n', [People]),
	enfantDe(People, Pere, Mere),
	writef('%t est fille de %t et %t\n', [People, Pere, Mere]).
	
	
main :-
	writef('Rempli la base des hommes\n'),
	setHomme([jeanluc, claude, jeanpierre]),
	writef('Rempli la base des femmes\n'),
	setFemme([myriam, claire, maryse, fabienne]),
	writef('Rempli la base des pères\n'),
	setPere([jean, jeanluc, claude, myriam, claude, fabienne]),
	writef('Rempli la base des mères\n'),
	setMere([maryse, myriam, maryse, fabienne, myriam, claire]),

	writef('recherche des parents de Bernard\n'),
	findParents(bernard),
	writef('recherche des parents de Myriam\n'),
	findParents(myriam),
	writef('FIN!!!\n'),
	halt.