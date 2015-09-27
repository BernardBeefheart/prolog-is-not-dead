%%
%% data_filler.pl
%%

:- module(data_filler,
		[fillHommes/0, fillFemmes/0, fillPeres/0, fillMeres/0]).

:- use_module(basic_data).
		
igetPeres([], _).
igetPeres([Pere, _ | Tail], X) :- igetPeres(Tail, [Pere | X]).
		
getPeres(X) :-
	all_pereDe(Y), 
	igetPeres(Y, X).
	
igetMeres([], _).
igetMeres([Mere, _ | Tail], X) :- igetMeres(Tail, [Mere | X]).
		
getMeres(X) :-
	all_mereDe(Y), 
	igetMeres(Y, X).
	
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