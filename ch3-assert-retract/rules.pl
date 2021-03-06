%%
%% rules.pl
%%

:- module(rules,
		[setHomme/1, ensureHomme/1,
		 setFemme/1, ensureFemme/1,
		 setPere/1, setMere/1,
		 enfantDe/3]).

%% les règles
%% pour ne pas utiliser "ou" (;), on utilise \+ (not)
%% ce qui implique que si Pere est déjà dans la base, on retourne False,
%% d'où la seconde ligne :
%% ensureHomme(_Pere).
ensureHomme(Pere) :- \+homme(Pere), asserta(homme(Pere)).
ensureHomme(_Pere).

ensureFemme(Mere) :- \+femme(Mere), asserta(femme(Mere)).
ensureFemme(_Mere).

setHomme([]).
setHomme([Homme | Tail]) :-
	ensureHomme(Homme),
	setHomme(Tail).
	
setFemme([]).
setFemme([Femme | Tail]) :-
	ensureFemme(Femme),
	setFemme(Tail).


setPere([]).
setPere([Personne]) :-
	writef('Il manque un enfant dans la liste des pères, %t est sans enfants\n', [Personne]).
setPere([Pere, Enfant | Tail]) :-
	ensureHomme(Pere),
	assertz(pere(Pere, Enfant)),
	setPere(Tail).
	
setMere([]).
setMere([Personne]) :-
	writef('Il manque un enfant dans la liste des mères, %t est sans enfants\n', [Personne]).
setMere([Mere, Enfant | Tail]) :-
	ensureFemme(Mere),
	assertz(mere(Mere, Enfant)),
	setMere(Tail).

enfantDe(Enfant, Pere, Mere) :- 
	mere(Mere, Enfant), 
	pere(Pere, Enfant).

