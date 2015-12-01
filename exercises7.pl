%% Author: Rebecca Lee
%% Date: 20 November 2015

%% CHAPTER 7 EXERCISES - Learn Prolog Now! (online version)

%% 7.1 Suppose we are working with the following DCG:

/*
s --> foo, bar, wiggle.
foo --> [choo].
foo --> foo, foo.
bar --> mar,zar.
mar --> me, my.
me --> [i].
my --> [am].
zar --> blar, car.
blar --> [a].
car --> [train].
wiggle --> [toot].
wiggle --> wiggle, wiggle.
*/

%% Write down ordinary Prolog rules that correspond to these DCG rules. What are
%% the first three responses that Prolog gives to the query sent(X,[])?

sent(A,D) :- 
    foo(A,B),
    bar(B,C),
    wiggle(C,D).
foo([choo|W],W).
foo(A,C) :-
    foo(A,B),
    foo(B,C).
bar(A,C) :-
    mar(A,B),
    zar(B,C).
mar(A,C) :-
    me(A,B),
    my(B,C).
me([i|W],W).
my([am|W],W).
zar(A,C) :-
    blar(A,B),
    car(B,C).
blar([a|W],W).
car([train|W],W).
wiggle([toot|W],W).
wiggle(A,C) :-
    wiggle(A,B),
    wiggle(B,C).

%% (1) X = [choo, i, am, a, train, toot].
%% (2) X = [choo, i, am, a, train, toot, toot].
%% (3) X = [choo, i, am, a, train, toot, toot, toot].


%% 7.2 The formal language anbn-{e} consists of all the strings in anbn except
%%     the empty string. Wite a DCG that generates this language.

/*
s --> l,r.
s --> l,s,r.
l --> [a].
r --> [b].
*/


%% 7.3 Let anb2n be the formal language which contains all strings of the 
%%     following form: an unbroken block of as of length n followed by an 
%%     unbroken block of bs of length 2n, and nothing else. For example, abb,
%%     aabbbb, and aaabbbbbb belong to anb2n, and so does the empty string. 
%%     Write a DCG that generates this language.

/*
s --> [].
s --> l,s,r.
l --> [a].
r --> [b,b].
*/
