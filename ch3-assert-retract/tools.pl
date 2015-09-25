%%
%% tools.pl
%% des fonctions utilitaires 

:- module(tools,
	[car/2, cdr/2]).

car([], _) :- fail.
car([Head | _], Head).

cdr([], _) :- fail.
cdr([_ | Tail], Tail).
