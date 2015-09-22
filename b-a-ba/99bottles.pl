/*
 * 99bottles.pl
 * compilation : swipl --goal=main --stand_alone=true -o 99bottles -c 99bottles.pl
 */

ibottles(0):-
    writef('C\'est FINI! \n'),
    !.
ibottles(X):-
    writef('%t bottles of beer on the wall \n',[X]),
    writef('%t bottles of beer\n',[X]),
    write('Take one down, pass it around\n'),
    succ(XN,X),
    writef('%t bottles of beer on the wall \n\n',[XN]),
    ibottles(XN).
 
 bottles(X):-
    writef('we start with %t bottles of beer on the wall \n',[X]),
    ibottles(X).

main:- bottles(4),
	halt.
