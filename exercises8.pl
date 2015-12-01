%% Author: Rebecca Lee
%% Date: 20 November 2015

%% CHAPTER 8 EXERCISES - Learn Prolog Now! (online version)

%% 8.1 Adding to the basic DCG given:
%% Suppose we add the noun "men" (which is plural) and the verb "know". Then we 
%% would want a DCG which says that "The men eat" is ok, "The man eats" is ok,
%% "THe men eats" is not ok, and "The man eat" is not ok. Change the DCG so that
%% it correctly handles these sentences. Use an extra argument to cope with the
%% singular/plural distinction.

sent(_) --> [].
sent(X) --> np(X),vp(X).

np(X) --> det,n(X).

vp(X) --> v(X),np(X).
vp(X) --> v(X).

det --> [the].
det --> [a].

n(singular) --> [woman].
n(singular) --> [man].
n(plural) --> [men].
n(singular) --> [apple].
n(singular) --> [pear].

v(singular) --> [eats].
v(plural) --> [eat].


%% 8.2 In the text, we gave examples of DCG rules with one extra argument, but
%%     in fact you can add as many arguments as you like. Here is the DCG rule
%%     with three extra arguments:
%%     kanga(V,R,Q) --> roo(V,R),jumps(Q,Q),{marsupial(V,R,Q)}.
%%     Translate it into the form Prolog uses.

kanga(V,R,Q,A,B) :-
    roo(V,R,A,C),
    jumps(Q,Q,C,B),
    marsupial(V,R,Q).
    
