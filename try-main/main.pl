/*
 * main.pl
 * compilation : swipl --goal=main --stand_alone=true -o try-main -c main.pl
 */
 
 /* :- initialization main. */

eval :-
        current_prolog_flag(argv, Argv),
        concat_atom(Argv, ' ', SingleArg),
        term_to_atom(Term, SingleArg),
        Val is Term,
        format('~w~n', [Val]).

main :-
        catch(eval, E, (print_message(error, E), fail)),
        halt.
main :-
        halt(1).