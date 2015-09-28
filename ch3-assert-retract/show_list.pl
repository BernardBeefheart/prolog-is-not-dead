%%
%% show_list.pl
%%
%% l'utilisation du couple assert/retract est vraiment peu utile ici
%% mais donne une idée de ce  qui peut être fait avec
%%

:- module(show_list,
	[showList/2]).

:- dynamic theTitle/1.


ishowList([]) :- 
	theTitle(Title),
	writef('Fin de la liste %t\n', [Title]),
	retract(theTitle(Title)).
ishowList([Head | Tail ]) :-
	writef(' -> %t\n', [Head]),
	ishowList(Tail).
	
showList(List, Title) :-
	writef('Liste : %t\n', [Title]),
	assert(theTitle(Title)),
	ishowList(List).
	
%% ......................................................................
%% test
testShowList :-
	showList([bernard, jean, charles, eric], 'Liste bidon'),
	showList([poire, pomme, raisin, figue], 'Courses').
	
%% show_list:testShowList.