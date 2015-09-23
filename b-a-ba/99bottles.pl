/*
 * 99bottles.pl
 * compilation : swipl --goal=main --stand_alone=true -o 99bottles -c 99bottles.pl
 */


inner_bottles(0):-
    writef('C\'est FINI! \n'),
    !.
inner_bottles(X):-
    writef('%t bottles of beer on the wall \n',[X]),
    writef('%t bottles of beer\n',[X]),
    write('Take one down, pass it around\n'),
    succ(XN,X),
    writef('%t bottles of beer on the wall \n\n',[XN]),
    inner_bottles(XN).
 
 bottles(X):-
    writef('we start with %t bottles of beer on the wall \n',[X]),
    inner_bottles(X).

/*
 * TODO: get args from command line
 */
 
main:- bottles(4),
	halt.
