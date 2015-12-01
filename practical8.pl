%% Author: Rebecca Lee
%% Date: 20 November 2015

%% CHAPTER 8 PRACTICAL - Learn Prolog Now! (online version)

%% 1. First, bring together all the things we have learned about DCGs for 
%%    English into one DCG. In particular, in the text we saw how to use extra
%%    arguments to deal with the subject/object distinction, and in the 
%%    exercises you were asked to use additional arguments to deal with the
%%    singular/plural distinction. Write a DCG which handles both. Moreover, 
%%    write the DCG in such a way that it will produce parse trees, and makes
%%    use of a separate lexicon.

%% grammar

s(s(NP, VP), X, subject) --> np(NP, X, subject), vp(VP, X).

np(np(D, N), X, _) --> det(D, X), n(N, X).
np(np(P), Y, X) --> pro(P, Y, X).

vp(vp(V, NP), X) --> v(V, X), np(NP, _, object).
vp(vp(V), X) --> v(V, X).

det(det(Word), X) --> [Word], {lex(Word, X, det)}.
n(n(Word), X) --> [Word], {lex(Word, X, n)}.
v(v(Word), X) --> [Word], {lex(Word, X, v)}.
pro(pro(Word), Y, X) --> [Word], {lex(Word, Y, X, pro)}.


%% lexicon

lex(the, _, det).
lex(a, singular, det).

lex(woman, singular, n).
lex(women, plural, n).
lex(man, singular, n).
lex(men, plural, n).
lex(apple, singular, n).
lex(apples, plural, n).
lex(pear, singular, n).
lex(pears, plural, n).

lex(shoots, singular, v).
lex(shoot, plural, v).
lex(eats, singular, v).
lex(eat, plural, v).

lex(he, subject, singular, pro).
lex(him, object, singular, pro).
lex(she, subject, singular, pro).
lex(her, object, singular, pro).
lex(they, subject, plural, pro).
lex(them, object, plural, pro).


%% 2. Once you have done this, extend the DCG so that the noun phrases can be
%%    modified by adjectives and simple prepropositional phrases (that is, it
%%    should be able to handle noun phrases such as "the small frightened
%%    woman on the table" or "the big fat cow under the shower"). Then, further
%%    extend it so the distinction between first, second, and third person 
%%    pronouns is correctly handled (both in subject and object form).

%% grammar

s(s(NP, VP), X, SUB) --> np(NP, X, SUB), vp(VP, X).

np(np(D, N), X, _) --> det(D, X), n(N, X).
np(np(P), Y, X, N) --> pro(P, Y, X, N).
np(np(D, ADJ, N), X, _) --> det(D, X), adj(ADJ), n(N, X).

pp(pp(PREP, NP)) --> pre(PREP), np(NP, _, _, object).

vp(vp(V, NP), X, N) --> v(V, X, N), np(NP, _, _, object).
vp(vp(V), X, N) --> v(V, X, N).

det(det(Word), X) --> [Word], {lex(Word, X, det)}.
n(n(Word), X) --> [Word], {lex(Word, X, n)}.
v(v(Word), X, N) --> [Word], {lex(Word, X, N, v)}.
pro(pro(Word), Y, X, N) --> [Word], {lex(Word, Y, X, N, pro)}.
prep(prep(Word)) --> [Word], {lex(Word, prep)}.
adj(adj(Word)) --> [Word], {lex(Word, adj)}.


%% lexicon

lex(the, _, det).
lex(a, singular, det).

lex(woman, singular, n).
lex(women, plural, n).
lex(man, singular, n).
lex(men, plural, n).
lex(apple, singular, n).
lex(apples, plural, n).
lex(pear, singular, n).
lex(pears, plural, n).
lex(table, singular, n).
lex(tables, plural, n).
lex(cow, singular, n).
lex(cows, plural, n).
lex(shower, singular, n).
lex(showers, plural, n).

lex(shoot, singular, 1, v).
lex(shoot, singular, 2, v).
lex(shoots, singular, 3, v).
lex(shoot, plural, _, v).

lex(eat, singular, 1, v).
lex(eat, singular, 2, v).
lex(eats, singular, 3, v).
lex(eat, plural, _, v).

lex(i, subject, singular, 1, pro).
lex(you, subject, singular, 2, pro).
lex(he, subject, singular, 3, pro).
lex(she, subject, singular, 3, pro).
lex(it, subject, singular, 3, pro).
lex(we, subject, plural, 1, pro).
lex(you, subject, plural, 2, pro).
lex(they, subject, plural, pro).

lex(me, object, singular, 1, pro).
lex(you, object, singular, 2, pro).
lex(him, object, singular, 3, pro).
lex(her, object, singular, 3, pro).
lex(it, object, singular, 3, pro).
lex(us, object, plural, 1, pro).
lex(you, object, plural, 2, pro).
lex(them, object, plural, 3, pro).

lex(on, prep).
lex(under, prep).

lex(small, adj).
lex(frightened, adj).
lex(big, adj).
lex(fat, adj).
