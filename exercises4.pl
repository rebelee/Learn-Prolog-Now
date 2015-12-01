%% Author: Rebecca Lee
%% Date: 18 November 2015

%% CHAPTER 4 EXERCISES - Learn Prolog Now! (online version)

%% 4.1 How does Prolog respond to the following queries?

%% 1. [a,b,c,d] = [a,[b,c,d]]. -> No
%% 2. [a,b,c,d] = [a|[b,c,d]]. -> Yes
%% 3. [a,b,c,d] = [a,b,[c,d]]. -> No
%% 4. [a,b,c,d] = [a,b|[c,d]]. -> Yes
%% 5. [a,b,c,d] = [a,b,c,[d]]. -> No
%% 6. [a,b,c,d] = [a,b,c|[d]]. -> Yes
%% 7. [a,b,c,d] = [a,b,c,d,[]]. -> No
%% 8. [a,b,c,d] = [a,b,c,d|[]]. -> Yes
%% 9. [] = _. -> Yes
%% 10. [] = [_]. -> No
%% 11. [] = [_|[]]. -> No


%% 4.2 Which of the following are syntactically correct lists? If the 
%%     representation is correct, how many elements does the list have?

%% 1. [1|[2,3,4]] -> Yes, 4
%% 2. [1,2,3|[]] -> Yes, 3
%% 3. [1|2,3,4] -> No
%% 4. [1|[2|[3|[4]]]] -> Yes, 4
%% 5. [1,2,3,4|[]] -> Yes, 4
%% 6. [[]|[]] -> Yes, 1
%% 7. [[1,2]|4] -> No
%% 8. [[1,2],[3,4]|[5,6,7]] -> Yes, 5


%% 4.3 Write a predicate second(X,List) which checks whether X is the second
%%     element of List.

second(X, List) :-
    List = [_, X|_].


%% 4.4 Write a predicate swap12(List1,List2) which checks whether List1 is 
%%     identical to List2, except that the first two elements are exchanged.

swap12(List1, List2) :-
    List1 = [X, Y|Tail],
    List2 = [Y, X|Tail].

%% 4.5 Suppose we are given a knowledge base with the following facts:

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

%% Write a predicate listtran(G,E) which translates a list of German number words
%% to the corresponding list of English number words. For example,
%% listtran([eins,neun,zwei],X). should give X = [one,nine,two].
%% Your program should also work in the other direction. For example,
%% listtran(X,[one,seven,six,two]). should give X = [eins,sieben,sechs,zwei].

listtran([], []).

listtran([H1|T1], [H2|T2]) :-
    tran(H1, H2),
    listtran(T1, T2).


%% 4.6 Write a predicate twice(In,Out) whose left argument is a list, and whose
%%     right argument is a list consisting of every element in the left list 
%%     written twice. For example, twice([a,4,buggle],X). should return
%%     X = [a,a,4,4,buggle,buggle].

twice([], []).

twice([H1|T1], [H1,H1|T2]) :-
    twice(T1, T2).


%% 4.7 Draw the search trees for the following three queries:

%% ?- member(a,[c,b,a,y]).
%%    Call: member(a, [c,b,a,y])
%%    Call: member(a, [b,a,y])
%%    Call: member(a, [a,y])
%%    Exit: member(a, [a,y])

%% ?- member(x,[a,b,c]).
%%    Call: member(x, [a,b,c])
%%    Call: member(x, [b,c])
%%    Call: member(x, [c])
%%    Call: member(x, [])
%%    Fail: member(x, [])

%% ?- member(X,[a,b,c]).
%%    Call: member(_735, [a,b,c])
%%    Exit: member(a, [a,b,c])
%%    X = a
%%    Redo: member(a, [a,b,c])
%%    Exit: member(b, [a,b,c])
%%    X = b
%%    Redo: member(b, [a,b,c])
%%    Exit: member(c, [a,b,c])
%%    X = c

