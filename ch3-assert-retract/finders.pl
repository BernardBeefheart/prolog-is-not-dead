%%
%% finders.pl
%%

:- module(finders, 
		[findParents/1, findAllChilds/0,
		 findAllHommes/0, findAllFemmes/0]).
		
findParents(People) :-
	writef('---------------------------------------------\n'),
	writef('recherche des parents (fils) de %t\n', [People]),
	homme(People),
	!,
	enfantDe(People, Pere, Mere),
	writef('%t est fils de %t et %t\n', [People, Pere, Mere]).
findParents(People) :-
	writef('---------------------------------------------\n'),
	writef('recherche des parents (fille) de %t\n', [People]),
	femme(People),
	!,
	enfantDe(People, Pere, Mere),
	writef('%t est fille de %t et %t\n', [People, Pere, Mere]).
findParents(People) :-
!,
	writef('%t n'est l'enfant de personne!\n', [People]).
	
	
findAllHommes :-
	findall(Person, homme(Person), Bag),
	showList(Bag, 'Les hommes').
		
findAllFemmes :-
	findall(Person, femme(Person), Bag),
	showList(Bag, 'Les femmes').
		
findAllChilds :-
	findall(Person, enfantDe(Person, _, _), Bag),
	showList(Bag, 'les enfants').
	
