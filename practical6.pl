%% Author: Rebecca Lee
%% Date: 18 November 2015

%% CHAPTER 6 PRACTICAL - Learn Prolog Now! (online version)

%% The following traces will help you get to grips with the predicates 
%% discussed in the text:

%% 1. Carry out traces of append/3 with the first two arguments instantiated, and
%%    the third argument uninstantiated. For example,
%%    append([a,b,c],[[],[2,3],b],X).

%% use myAppend to make it clearer

myAppend([], L, L).
myAppend([H|T], L2, [H|L3]) :-
    myAppend(T, L2, L3).

%% ?- myAppend([a,b,c], [[],[2,3],b], X).
%%    Call: myAppend([a,b,c], [[],[2,3],b], _969)
%%    Call: myAppend([b,c], [[],[2,3],b], _5713)
%%    Call: myAppend([c], [[],[2,3],b], _6455)
%%    Call: myAppend([], [[],[2,3],b], _7197)
%%    Exit: myAppend([], [[],[2,3],b], [[],[2,3],b])
%%    Exit: myAppend([c], [[],[2,3],b], [c,[],[2,3],b])
%%    Exit: myAppend([b,c], [[],[2,3],b], [b,c,[],[2,3],b])
%%    Exit: myAppend([a,b,c], [[],[2,3],b], [a,b,c,[],[2,3],b])
%%    X = [a,b,c,[],[2,3],b]


%% 2. Next, carry out traces of append/3 as used to split up a list, that is with
%%    the first two arguments given as variables, and the last argument 
%%    uninstantiated. For example, append(L,R,[foo,wee,blup]).
%% Again use myAppend to make it clearer

%% ?- myAppend(L, R, [foo,wee,blup]).
%%    Call: myAppend(_735, _775, [foo,wee,blup])
%%    Exit: myAppend([], [foo,wee,blup], [foo,wee,blup])
%%    L = [], Y = [foo,wee,blup]
%%    Redo: myAppend([], [foo,wee,blup], [foo,wee,blup])
%%    Call: myAppend(_2093, _775, [wee,blup])
%%    Exit: myAppend([], [wee,blup], [wee,blup])
%%    Exit: myAppend([foo], [wee,blup], [foo,wee,blup])
%%    L = [foo], Y = [wee,blup]
%%    Redo: myAppend([foo], [wee,blup], [foo,wee,blup])
%%    Redo: myAppend([], [wee,blup], [wee,blup])
%%    Call: myAppend(_2835, _775, [blup])
%%    Exit: myAppend([], [blup], [blup])
%%    Exit: myAppend([wee], [blup], [wee,blup])
%%    Exit: myAppend([foo,wee], [blup], [foo,wee,blup])
%%    L = [foo,wee], Y = [blup]
%%    Redo: myAppend([foo,wee], [blup], [foo,wee,blup])
%%    Redo: myAppend([wee], [blup], [wee,blup])
%%    Redo: myAppend([], [blup], [blup])
%%    Call: myAppend(_3577, _775, [])
%%    Exit: myAppend([], [], [])
%%    Exit: myAppend([blup], [], [blup])
%%    Exit: myAppend([wee,blup], [], [wee,blup])
%%    Exit: myAppend([foo,wee,blup], [], [foo,wee,blup])
%%    L = [foo,wee,blup], Y = []
%%    Redo: myAppend([foo,wee,blup], [], [foo,wee,blup])
%%    Redo: myAppend([wee,blup], [], [wee,blup])
%%    Redo: myAppend([blup], [], [blup])
%%    Redo: myAppend([], [], [])
%%    Fail: myAppend(_3577, _775, [])
%%    Fail: myAppend(_2835, _775, [blup])
%%    Fail: myAppend(_2093, _775, [wee,blup])
%%    Fail: myAppend(_735, _775, [foo,wee,blup])


%% 3. Carry out some traces on prefix/2 and suffix/2. Why does prefix/2 find 
%%    shorter lists first, and suffix/2 longer lists first?

prefix2(P, L) :- myAppend(P, _, L).
suffix2(S, L) :- myAppend(_, S, L).

%% The base case for myAppend is myAppend([], L, L), which means that the prefix
%% will find the shorter lists first (empty list) and that the suffix will find
%% the longer lists first (whole list).


%% 4. Carry out some traces on sublist/2. As we said in the text, via back-
%%    tracking this predicate generates all possible sublists, but as you will
%%    see, it generates several sublists more than once. Do you understand why?

sublist2(SubL, L) :-
    suffix2(S, L),
    prefix2(SubL, S).

%% It will generate all possible answers for each sublist, making the [] prefix
%% appear more than once.


%% 5. Carry out traces on both naiverev/2 and rev/2, and compare their behavior.

%% The naiverev is less efficient because of the time taken to carry out the
%% appends (calling it recursively). The accumulator is more efficient because it
%% temporarily stores the current reversed list and at the end is the whole list
%% reversed.


%% PROGRAMS

%% 1. It is possible to write a one line definition of the member predicate by 
%%    making use of append/3. Do so. How does this new version of member compare
%%    in efficiency with the standard one?

member1(X, List) :-
    append(_, [X|_], List).

%% Member will be more efficient since it will only need to run through each 
%% member of the list. However, member1 requires the use of append which means that
%% it is slower since it has to find a list that concatenated with X gives List.


%% 2. Write a predicate set(InList, OutList) which takes as input an arbitrary
%%    list, and returns a list in which each element of the input list appears only
%%    once. For example, the query set([2,2,foo,1,foo,[],[]],X) should yield
%%    X = [2,foo,1,[]].
%%    (Hint: use the member predicate to test for repetitions of items you have 
%%    already found).

accRev2([H|T], A, R) :- 
    accRev2(T, [H|A], R).
accRev2([], A, A).
rev2(L, R) :-
    accRev2(L, [], R).

not(A) :- \+ call(A).

set([], Acc, Acc).

set([H|T], Acc, OutList) :-
    (member(H,Acc),
     set(T, Acc, OutList));
    (not(member(H,Acc)),
    set(T, [H|Acc], OutList)).

set([H|T], OutList) :-
    set(T, [H], TempOutList),
    rev2(TempOutList, OutList).

%% rev2 used otherwise answer output is not in the right order as stated in the q.


%% 3. We flatten a list by removing all the square brackets around any lists it
%%    contains as elements, and around any lists that its elements contain as 
%%    elements, and so on, for all nested lists. For example, when we flatten
%%    the list [a,b,[c,d],[[1,2]],foo] we get [a,b,c,d,1,2,foo].
%%    Write a predicate flatten(List, Flat) that holds when the first argument
%%    List flattens to the second argument Flat. This should be done without making
%%    use of append/3.

flatten([], Acc, Acc).

flatten(H, Acc, [H|Acc]) :-
    H \= [],
    H \= [_|_].

flatten([H|T], Acc, Res) :-
    flatten(T, Acc, NewAcc),
    flatten(H, NewAcc, Res).

flatten(List, Flat) :-
    flatten(List, [], Flat).



