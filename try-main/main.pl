/*
 * main.pl
 * compilation : swipl --goal=main --stand_alone=true -o try-main -c main.pl
 */
 
showArgs :-
        current_prolog_flag(argv, Argv),
        concat_atom(Argv, ' ', SingleArg),
        writef('-> %t\n', [SingleArg]).

main :-
        showArgs,
        halt.