%%
%% listKillDups.pl
%% supprime les éléments dupliqués d'une liste
%%

:- module(listKillDups,[
		listKillDups/2		
	]).

:- dynamic inList/1.

ensureNotInList(Element) :-
	\+ inList(Element), asserta(inList(Element)).
	
killDups([], Acc, Acc).
killDups([Head | Tail], Acc, LstOut) :-
	ensureNotInList(Head),
	killDups(Tail, [Head | Acc], LstOut).
killDups([_ | Tail], Acc, LstOut) :-
	killDups(Tail, Acc, LstOut).
	
	
listKillDups(LstIn, LstOut) :-
	retractall(inList(_)),
	killDups(LstIn, [], LstOut). 
	
%%% tests
	