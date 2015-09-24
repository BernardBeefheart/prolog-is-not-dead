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

ishowList([]).
ishowList([Head | Tail ]) :-
	writef(' -> %t\n', [Head]),
	ishowList(Tail).
	
showList(List, Title) :-
	writef('Liste : %t\n', [Title]),
	ishowList(List),
	writef('Fin de la liste %t\n', [Title]).
	
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

ensureHomme(Pere) :- homme(Pere); setHomme([Pere]).
ensureFemme(Pere) :- femme(Pere); setFemme([Pere]).

setPere([]).
setPere([P]) :-
	writef('Il manque un enfant dans la liste des pères, %t est sans enfants\n', [P]).
setPere([Pere | Tail]) :-
	ensureHomme(Pere),
	car(Tail, Enfant),
	assert(pere(Pere, Enfant)),
	cdr(Tail, Reste),
	setPere(Reste).
	
setMere([]).
setMere([P]) :-
	writef('Il manque un enfant dans la liste des mères, %t est sans enfants\n', [P]).
setMere([Mere | Tail]) :-
	ensureFemme(mere),
	car(Tail, Enfant),
	assert(mere(Mere, Enfant)),
	cdr(Tail, Reste),
	setMere(Reste).

enfantDe(Enfant, Pere, Mere) :- 
	mere(Mere, Enfant), 
	pere(Pere, Enfant).

findParents(People) :-
	writef('findParents homme\n'),
	writef('recherche (homme) de %t\n', [People]),
	homme(People),
	writef('%t est un garçon\n', [People]),
	enfantDe(People, Pere, Mere),
	writef('%t est fils de %t et %t\n', [People, Pere, Mere]).
findParents(People) :-
	writef('findParents femme\n'),
	writef('recherche (femme) de %t\n', [People]),
	femme(People),
	writef('%t est une fille\n', [People]),
	enfantDe(People, Pere, Mere),
	writef('%t est fille de %t et %t\n', [People, Pere, Mere]).
	
findAllChilds :-
	findall(Person, enfantDe(Person, _, _), Bag),
	showList(Bag, 'les enfants').
	
main :-
	writef('---------------------------------------------\n'),
	writef('Rempli la base des hommes\n'),
	setHomme([jeanluc, claude, jeanpierre]),
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