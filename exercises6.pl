%% Author: Rebecca Lee
%% Date: 18 November 2015

%% CHAPTER 6 EXERCISES - Learn Prolog Now! (online version)

%% 6.1 Let us call a list doubled if it is made of two consecutive blocks of
%%     elements that are exactly the same. For example, [a,b,c,a,b,c] is doubled
%%     and so is [foo,gubble,foo,gubble]. On the other hand, [foo,gubble,foo] is 
%%     not doubled. Write a predicate doubled(List) which succeeds when List is
%%     a doubled list.

doubled(List) :- append(X, X, List).


%% 6.2 A palindrome is a word or phrase that spells the same forwards and 
%%     backwards. For example, 'rotator', 'eve', and 'nurses run' are all 
%%     palindromes. Write a predicate palindrome(List), which checks whether List
%%     is a palindrome.

accRev([H|T], A, R) :- 
    accRev(T, [H|A], R).
accRev([], A, A).

rev(L, R) :- accRev(L, [], R).
palindrome(List) :- 
    rev(List, List).


%% 6.3 Write a predicate toptail(InList, OutList) which says no if InList is a 
%%     list containing fewer than 2 elements, and which deletes the first and last
%%     elements of InList and returns the result as OutList, when InList is a list
%%     containing at least 2 elements.

toptail(InList, OutList) :-
    append([_|OutList], [_], InList).


%% 6.4 Write a predicate last(List,X) which is true only when List is a list that
%%     contains at least one element and X is the last element of that list. Do 
%%     this in two different ways: (1) Define last/2 using the predicate rev/2
%%     discussed in the text. (2) Define last2/2 using recursion.

accRev([H|T], A, R) :- 
    accRev(T, [H|A], R).
accRev([], A, A).

rev(L, R) :- accRev(L, [], R).

last(List, X) :- 
    rev(List, [X|_]).

last2([X], X).
last2([_|T], X) :-
    last2(T,X).


%% 6.5 Write a predicate swapfl(List1,List2) which checks whether List1 is 
%%     identical to List2, except that the first and last elements are exchanged.
%%     Here is where appdend/3 could come in useful again, but it is also possible
%%     to write a recursive definition without appealing to append/3 (or any other)
%%     predicates. 

swapfl([X|T1], List2) :-
    append(T, [H], T1),
    append([H|T], [X], List2).


%% 6.6 There is a street with three neighboring houses that all have a different
%%     color, namely red, blue, and green. People of different nationalities live
%%     in the different houses and they all have a different pet. Here are some 
%%     facts about them:
%%     The Englishman lives in the red house.
%%     The jaguar is the pet of the Spanish family.
%%     The Japanese lives to the right of the snail keeper.
%%     The snail keeper lives to the left of the blue house.

%%     Who keeps the zebra? Define a predicate zebra/1 that tells you the 
%%     nationality of the owner of the zebra.
%%     (Hint: Think of a representation for the houses and the street. Code the 
%%     four constraints in Prolog. You may find member/2 and sublist/2 useful.)

neighbor(Left, Right, Street) :-
	    Street = [Left| [Right, _]];
	    Street = [_ | [Left, Right]].

ownZebra(Street, Owner) :-
	    member([red, english, _], Street),
	    member([_, spanish, jaguar], Street),
	    member([green, _, _], Street),
	    neighbor([_, _, snail], [_, japanese, _], Street),
	    neighbor([blue, _, _], [_, _, snail], Street),
	    member([_, Owner, zebra], Street).

zebra(X) :- ownZebra([_,_,_], X).	 
