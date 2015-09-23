/*
 * main.pl
 * compilation : swipl --goal=main --stand_alone=true -o try-main -c showargs.pl main.pl
 */

%% le use_module ne semble pas être nécessaire
:- use_module(showargs).

/**
 * point d'entrée du programme
 */
main :-
        showArgs,
        showEachArgs(['coucou', 'ca', 'va']),
        halt.