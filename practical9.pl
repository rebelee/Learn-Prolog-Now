%% Author: Rebecca Lee
%% Date: 19 November 2015

%% CHAPTER 9 PRACTICAL - Learn Prolog Now! (online version)

%% display/1 is a built-in predicate that prints terms onto the screen, and does
%% so by printing the internal representation:

%% ?- display([a,b,c]).
%%    .(a,.(b,.(c,[])))

%% ?- display(3 is 4 + 5 / 3).
%%    is(3,+(4,/(5,3)))

%% ?- display(3 is (4 + 5) / 3).
%%    is(3,/(+(4,5),3))

%% ?- display((a:-b,c,d)).
%%    :-(a,,(b,,(c,d)))

%% ?- display(a:-b,c,d).
%%    error


%% write/1 is a built-in predicate that prints terms onto the screen (user
%% friendly)

%% ?- write([a,b,c]).
%%    [a,b,c]

%% ?- write(X).
%%    _735
%%    X = _735

%% ?- write(a), write(b).
%%    ab

%% ?- write(a), write(' '), write(b).
%%    a b


%% tab/1 is another way of printing spaces 
%% nl makes a line-break


%% Write a predicate pptree/1 that takes a complex term representing a tree as
%% its argument and prints the tree in a more readable form. For example

pptree(Term) :-
	 =..(Term, List),
	 printList(List).

printList([H|T]) :-
	 write(H),
	 printList(T).

%% to finish with time



%% Write operator definitions for not, and, or, and implies, so that Prolog 
%% accepts (and correctly brackets) propositional logic formulas. Use display/1
%% to check your code. For example, ?- display(not(p implies q)). gives
%% not(implies(p,q)).

:- op(400, xfy, implies).
:- op(300, xfy, and).
:- op(200, xfy, or).
:- op(100, fx, not).


