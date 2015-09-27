%%
%% data_filler.pl
%%

:- module(data_filler,
		[fillHommes/0, fillFemmes/0, fillPeres/0, fillMeres/0]).

:- use_module(basic_data).

%% fonction d'aide pour les deux suivantes
igetParents([], _).
igetParents([Pere, _ | Tail], X) :- igetParents(Tail, [Pere | X]).
		
%% création de la liste des pères
getPeres(X) :-
	all_pereDe(Y), 
	igetParents(Y, X).
	
%% création de la liste des mères
getMeres(X) :-
	all_mereDe(Y), 
	igetParents(Y, X).
	
fillHommes :- 
	writef('Rempli la base des hommes\n'),
	all_hommes(X),
	setHomme(X),
	getPeres(Y),
	setHomme(Y).
	
fillFemmes :-
        writef('Rempli la base des femmes\n'),
        all_femmes(X),
	setFemme(X),
	getMeres(Y),
	setFemme(Y).	

fillParents(Title, Setter) :-
	writef("%t\n",[Title]),
	call(Setter).
	
fillPeres :-
	all_pereDe(Peres),
	Setter =.. [setPere, Peres],
	fillParents('Rempli la base des pères', Setter).
		
fillMeres :-
	all_mereDe(Meres),
	Setter =.. [setMere, Meres],
	fillParents('Rempli la base des mères', Setter).