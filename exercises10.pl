%% Author: Rebecca Lee
%% Date: 19 November 2015

%% CHAPTER 10 EXERCISES - Learn Prolog Now! (online version)

%% 10.1 Suppose we have the following database:

p(1).
p(2) :- !.
p(3).

%% Write all of Prologs answers to the following queries:
%% ?- p(X).
%%    X = 1, X = 2.
%% ?- p(X), p(Y).
%%    X = 1, Y = 1; X = 1, Y = 2;  X = 2, Y = 1; X = 2, Y = 2.
%% ?- p(X), !, p(Y).
%%    X = 1, Y = 1; X = 1, Y = 2.


%% 10.2 First, explain what the following program does:

/*
class(Number, positive) :- Number > 0.
class(0, zero).
class(Number, negative) :- Number < 0.
*/

%% The program classified numbers to be positive, zero, or negative.

%% Second, improve it by adding green cuts.

class(Number, positive) :- Number > 0, !.
class(0, zero) :- !.
class(Number, negative) :- Number < 0.


%% 10.3 Without using cut, write a predicate split3 that splits a list of 
%%      integers into two lists: one containing positive ones (and zero), the
%%      other containing the negative ones. For example, 
%%      split([3, 4, -5, -1, 0, 4, -9], P, N) gives 
%%      P = [3,4,0,4], N = [-5,-1,-9].
%%      Then improve this program, without changing its meaning, with the help
%%      of the cut.

split([], [], []).

split([H1|T1], [H1|T2], N) :-
    H1 >= 0,!,
    split(T1, T2, N).

split([H1|T1], P, [H1|T2]) :-
    H1 < 0,
    split(T1, P, T2).


%% 10.4 Recall that in Exercise 3.3 we gave the following knowledge base:
   
directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

%% We asked you to write a recursive predicate travelFromTo/2 that told us when
%% we could travel by train between two towns. Now it is plausible to assume
%% that whenever it is possible to take a direct train from A to B, it is also
%% possible to take a direct train from B to A. Add this information to the 
%% database. Then write a predicate route/3 which gives you a list of towns
%% that are visited by taking the train from one town to another. For instance:
%% route(forbach, metz, Route). gives
%% Route=[forbach,freyming,stAvold,fahlquemont,metz]

direct(T1, T2) :-
    directTrain(T1,T2).
direct(T1, T2) :-
    directTrain(T2, T1).

route(T1, T2, [T1,T2], _) :-
    direct(T1, T2), !.

route(T1, T2, [T1|R], A) :-
    direct(T1, T3),
    \+member(T3, A),
    route(T3, T2, R, [T1|A]).

route(T1, T2, R) :-
    route(T1, T2, R, []).


%% 10.5 Recall the definition of jealousy given in Chapter 1.

%% jealous(X,Y) :- loves(X, Z), loves(Y,Z).

%% In a world where both Vincent and Marsellus love Mia, Vincent will be
%% jealous of Marsellus, and Marsellus of Vincent. But Marsellus will also be
%% jealous of himself, and so will Vincent. Revise the Prolog definition of 
%% jealousy in such a way that people cannot be jealous of themselves.

jealous(X, Y) :-
    loves(X, Z),
    loves(Y, Z),
    X \= Y.
