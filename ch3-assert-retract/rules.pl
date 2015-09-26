%%
%% rules.pl
%%

:- module(rules,
		[setHomme/1, ensureHomme/1,
		 setFemme/1, ensureFemme/1,
		 setPere/1, setMere/1,
		 enfantDe/3]).
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
	writef('Il manque un enfant dans la liste des pères, %t est sans enfants\n', [Personne]).
setPere([Pere, Enfant | Tail]) :-
	ensureHomme(Pere),
	assert(pere(Pere, Enfant)),
	setPere(Tail).
	
setMere([]).
setMere([Personne]) :-
	writef('Il manque un enfant dans la liste des mères, %t est sans enfants\n', [Personne]).
setMere([Mere, Enfant | Tail]) :-
	ensureFemme(mere),
	assert(mere(Mere, Enfant)),
	setMere(Tail).

enfantDe(Enfant, Pere, Mere) :- 
	mere(Mere, Enfant), 
	pere(Pere, Enfant).

