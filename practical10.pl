%% Author: Rebecca Lee
%% Date: 19 November 2015

%% CHAPTER 10 PRACTICAL - Learn Prolog Now! (online version)

%% PROGRAMMING

%% 1. Define a predicate nu/2 ("not unifiable") which takes two terms as 
%%    arguments and succeeds if the two terms do not unify. For example,
%%    nu(foo,foo) gives no and nu(foo, blob) gives yes.
%%    You should define this predicate in three different ways: (1) write it 
%%    with the help of = and \+, (2) write it with the help of =, but do not 
%%    use \+, and (3) write it using a cut-fail combination. Do not use = and
%%    do not use \+.

nu1(T1, T2) :-
    \+ T1 = T2.

%% Prolog conditional test (Test -> ThenC; ElseC)
nu2(T1, T2) :-
    (T1 = T2 -> fail; true).

nu3(T1, T1) :-
    !, fail.
nu3(_,_).


%% 2. Define a predicate unifiable(List1, Term, List2) where List2 is the list
%%    of all members of List1 that unify with Term. The elements of List2 
%%    should not be instantiated by the unification. For example, 
%%    unifiable([X,b,t(Y)], t(a), List).
%%    gives List = [X, t(Y)].

unifiable([], _, []).

unifiable([H|T], Term, List) :-
    \+ H = Term, !,
    unifiable(T, Term, List).

unifiable([H|T], Term, [H|List]) :-
    unifiable(T, Term, List).
