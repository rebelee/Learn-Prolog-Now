%% Author: Rebecca Lee
%% Date: 1 December 2015

%% CHAPTER 11 EXERCISES - Learn Prolog Now! (online version)

%% 11.1 Suppose we start with an empty database. We then give the command:
%%      assert(q(a,b)), assertz(q(1,2)), asserta(q(foo,blug)).
%%      What does the database now contain?

%% q(foo,blug).
%% q(a,b).
%% q(1,2).

%%      We then giv e the command:
%%      retract(q(1,2)), assertz( (p(X) :- h(X)) ).
%%      What does the database now contain?

%% q(foo,blug).
%% q(a,b).
%% p(X) :- h(X).

%%      We then give the command:
%%      retractall(q(_,_)).
%%      What does the database now contain?

%% p(X) :- h(X).


%% 11.2 Suppose we have the following database:

q(blob,blug).
q(blob,blag).
q(blob,blig).
q(blaf,blag).
q(dang,dong).
q(dang,blug).
q(flab,blob).

%%     What is Prologs reponse to the queries:

%% findall(X,q(blob,X),List).
%% List = [blug, blag, blig].

%% findall(X,q(X,blug),List).
%% List = [blob, dang].

%% findall(X,q(X,Y),List).
%% List = [blob, blob, blob, blaf, dang, dang, flab].

%% bagof(X,q(X,Y),List).
%% Y = blug,
%% List = [blob, dang].
%% Y = blag,
%% List = [blob, blaf].
%% Y = blig,
%% List = [blob].
%% Y = dong,
%% List = [dang].
%% Y = blob,
%% List = [flab].

%% setof(X,Y^q(X,Y),List).
%% X = 
%% List = [blaf, blob, dang, flab].


%% 11.3 Write a predicate sigma/2 that takes an integer n > 0 and calculates
%%      the sum of all integers from 1 to n. For example sigma(3,X). gives 
%%      X = 6 and sigma(5,X). gives X = 15.
%%      Write the predicate so that results are stored in the database (there
%%      should never be more than one entry in the database for each value) and 
%%      are reused whenever possible. For example, suppose we make the following
%%      query: sigma(2,X). X = 3 gives listing. sigmares(2,3).
%%      Prolog should not calculate everything new, but should get the result
%%      for sigma(2,3) from the database and only add 3 to that. It should then
%%      answer: X = 6. listing sigmares(2,3). sigmares(3,6).

:- dynamic sigmares/2.

sigmares(1,1).

sigma(X, Sum) :-
    sigmares(X, Sum), !.

sigma(X, Sum) :-
    NewX is X - 1,
    sigma(NewX, NewSum),
    Sum is NewSum + X,
    assert(sigmares(X, Sum)).
