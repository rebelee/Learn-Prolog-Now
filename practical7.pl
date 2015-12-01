%% Author: Rebecca Lee
%% Date: 20 November 2015

%% CHAPTER 7 PRACTICAL - Learn Prolog Now! (online version)

%% 1. The formal language Even is very simple: it consists of all strings
%%    containing an even number of as and nothing else. Note that the empty
%%    string [] belongs to Even. Write a DCG that generates Even.

/*
s --> [].
s --> l.
s --> l,s,l.

l --> [a,a].
*/


%% 2. The formal language anb2mc2mdn consists of all strings of the following
%%    form: an unbroken block of as followed by an unbroken block of bs 
%%    followed by an unbroken block of cs followed by an unbroken block of ds, 
%%    such that the a and d blocks are exactly the same length, and the b and
%%    c blocks are also exactly the same length and furthermore consist of an 
%%    even number of bs and cs respectively. For example, [], abbccd, and
%%    aabbbbccccdd all belong. Write a DCG that generates this language.

/*
s --> t.
s --> a, s, d.

t --> [].
t --> b, t, c.

a --> [a].
b --> [b,b].
c --> [c,c].
d --> [d].
*/


%% 3. The language that logicians call "propositional logic over the 
%%    propositional symbols p,q, and r" can be defined by the following context
%%    free grammar:

/*
prop -> p
prop -> q
prop -> r
prop -> not prop
prop -> (prop ^ prop)
prop -> (prop v prop)
prop -> (prop --> prop)
*/

%% Write a DC that generates this language. Actually, because we do not know 
%% about Prolog operators yet, you will have to make a few rather clumsy 
%% looking compromises. For example, instead of getting it to recognize
%% not(p --> q) you will have to get it to recognize things like
%% [not, '(',p, implies, q. ')'] instead. We will learn later how to deal with
%% propositional logic somewhat more naturally; in the meantime, write a DCG
%% that accepts a clumsy looking version of this language. Use or for v, and
%% and for ^.

/*
prop --> [p].
prop --> [q].
prop --> [r].

prop --> [not], prop.
prop --> ['('], prop, conj, prop, [')'].

conj --> [and].
conj --> [or].
conj --> [implies].
*/
