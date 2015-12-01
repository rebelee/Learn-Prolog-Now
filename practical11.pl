%% Author: Rebecca Lee
%% Date: 1 December 2015

%% CHAPTER 11 PRACTICAL - Learn Prolog Now! (online version)

%% 1. Sets can be thought of as lists that do not contain any repeated elements.
%%    For example, [a,4,6] is a set, but [a,4,6,a] is not (as it contains two
%%    occurrences of a). Write a Prolog program subset/2 that is satisfied
%%    when the first argument is a subset of the second argument (that is, when
%%    every element of the first argument is a member of the second argument).
%%    For example: subset([a,b],[a,b,c]) gives yes, subset([c,b],[a,b,c]) gives
%%    yes and subset([],[a,b,c]) also gives yes. Your program should be 
%%    capable of generating all subsets of an input set by backtracking. For
%%    example, if you give as an input subset(X,[a,bc]) it should 
%%    successively generate all eight subsets of [a,b,c].

subset([],[]).

subset([H|T1], [H|T2]) :-
    subset(T1, T2).

subset(Sub, [_|T]) :-
    subset(Sub, T).


%% 2. Using the subset predicate you have just written, and findall/3, write a 
%%    predicate powerset/2 that takes a set as its first argument, and returns
%%    the powerset of this set as the second argument. (The powerset of a set is
%%    the set of all its subsets). For example, powerset([a,b,c],P) gives
%%    P = [[],[a],[b],[c],[a,b],[a,c],[b,c],[a,b,c]]. It does not matter if the 
%%    sets are returned in some other order.

powerset([],[]).

powerset(Set, Power) :-
    findall(SubList, Set^subset(SubList, Set), Power).
