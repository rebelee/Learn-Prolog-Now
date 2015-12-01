%% Author: Rebecca Lee
%% Date: 18 November 2015

%% CHAPTER 4 PRACTICAL - Learn Prolog Now! (online version)

%% First, systematically carry out a number of traces on a2b/2 to make sure you
%% fully understand how it works. In particular:

a2b([], []).

a2b([H1|T1], [H2|T2]) :-
    H1 = a,
    H2 = b,
    a2b(T1, T2).

%% 1. Trace some examples, not involving variables, that succeed. For example
%%    trace the query a2b([a,a,a,a],[b,b,b,b]). and relate the output to the
%%    discussion in the text.

%% ?- a2b([a,a,a,a],[b,b,b,b]).
%%    Call: a2b([a,a,a,a],[b,b,b,b])
%%    Call: a2b([a,a,a],[b,b,b])
%%    Call: a2b([a,a],[b,b])
%%    Call: a2b([a],[b])
%%    Call: a2b([],[])
%%    Exit: a2b([],[])
%%    Exit: a2b([a],[b])
%%    Exit: a2b([a,a],[b,b])
%%    Exit: a2b([a,a,a],[b,b,b])
%%    Exit: a2b([a,a,a,a],[b,b,b,b])
%%    yes


%% 2. Trace some simple examples that fail. Try examples involving lists of 
%%    different lengths (such as a2b([a,a,a,a],[b,b,b])) and examples involving
%%    symbols other than a and b (such as a2b([a,c,a,a],[b,b,5,4])).

%% ?- a2b([a,a,a,a],[b,b,b]).
%%    Call: a2b([a,a,a,a],[b,b,b])
%%    Call: a2b([a,a,a],[b,b])
%%    Call: a2b([a,a],[b])
%%    Call: a2b([a],[])
%%    Fail: a2b([a],[])
%%    Fail: a2b([a,a],[b])
%%    Fail: a2b([a,a,a],[b,b])
%%    Fail: a2b([a,a,a,a],[b,b,b])
%%    no

%% ?- a2b([a,c,a,a],[b,b,5,4]).
%%    Call: a2b([a,c,a,a],[b,b,5,4])
%%    Call: a2b([c,a,a],[b,5,4])
%%    Fail: a2b([c,a,a],[b,5,4])
%%    Fail: a2b([a,c,a,a],[b,b,5,4])
%%    no


%% 3. Trace some examples involving variables. For example, try tracing
%%    a2b([a,a,a,a],X) and a2b(X,[b,b,b,b]).

%% ?- a2b([a,a,a,a],X).
%%    Call: a2b([a,a,a,a], _851)
%%    Call: a2b([a,a,a], _2037)
%%    Call: a2b([a,a], _2777)
%%    Call: a2b([a], _3517)
%%    Call: a2b([], _4257)
%%    Exit: a2b([], [])
%%    Exit: a2b([a], [b])
%%    Exit: a2b([a,a], [b,b])
%%    Exit: a2b([a,a,a], [b,b,b])
%%    Exit: a2b([a,a,a,a], [b,b,b,b])
%%    X = [b,b,b,b]

%% ?- a2b(X,[b,b,b,b]).
%% Same as the above query just the other way around. (X = [a,a,a,a]).


%% 4. Make sure you understand what happens when both arguments in the query are
%%    variables. For example, carry out a trace on the query a2b(X,Y).

%% This will first find X = [], Y = [], then redo the call and get X = [a], Y = [a]
%% etc.


%% 5. Carry out a series of similar traces involving member/2. That is, carry out
%%    traces involving simple queries that succeed (such as member(a,[1,2,a,b])),
%%    simple queries that fail (such as member(z,[1,2,a,b])), and queries 
%%    involving variables (such as member(X, [1,2,a,b])). In all cases make sure
%%    you understand why the recursion halts.

%% Similar answers to the above.


%% PROGRAMS

%% 1. Write a 3-place predicate combine1 which takes three lists as arguments
%%    and combines the elements of the first two lists into the third as follows:
%%    ?- combine1([a,b,c],[1,2,3],X). X = [a,1,b,2,c,3]

combine1([], [], []).

combine1([H1|T1], [H2|T2], [H1,H2|T3]) :-
    combine1(T1, T2, T3).


%% 2. Now write a 3-place predicate combine2 which takes three lists as arguments
%%    and combines the elements of the first two lists into the third as follows:
%%    ?- combine2([a,b,c,],[1,2,3],X). X = [[a,1,],[b,2,],[c,3]].

combine2([], [], []).

combine2([H1|T1], [H2|T2], [[H1,H2]|T3]) :-
	 combine2(T1, T2, T3).


%% 3. Finally, write a 3-place predicate combine3 which takes three lists as 
%%    arguments and combines the elements of the first two lists into the third
%%    as follows: ?- combine3([a,b,c],[1,2,3],X). X = [j(a,1),j(b,2),j(c,3)].

combine3([], [], []).

combine3([H1|T1], [H2|T2], [j(H1,H2)|T3]) :-
    combine3(T1, T2, T3).
