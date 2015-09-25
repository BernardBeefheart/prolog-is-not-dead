%%
%% show_list.pl
%%

:- module(show_list,
	[showList/2]).

ishowList([]).
ishowList([Head | Tail ]) :-
	writef(' -> %t\n', [Head]),
	ishowList(Tail).
	
showList(List, Title) :-
	writef('Liste : %t\n', [Title]),
	ishowList(List),
	writef('Fin de la liste %t\n', [Title]).
	
