%% Author: Rebecca Lee
%% Date: 19 November 2015

%% CHAPTER 9 EXERCISES - Learn Prolog Now! (online version)

%% 9.1 Which of the following queries succeed, and which fail?

%% ?- 12 is 2*6 -> Yes
%% ?- 14 =\= 2*6 -> Yes
%% ?- 14 = 2*7 -> No
%% ?- 14 == 2*7 -> No
%% ?- 14 \== 2*7 -> Yes
%% ?- 14 =:= 2*7 -> Yes
%% ?- [1,2,3|[d,e]] == [1,2,3,d,e] -> Yes
%% ?- 2+3 == 3+2 -> No
%% ?- 2+3 =:= 3+2 -> Yes
%% ?- 7-2 =\= 9-2 -> Yes
%% ?- p == 'p' -> Yes
%% ?- p =\= 'p' -> Error
%% ?- vincent == VAR -> No
%% ?- vincent = VAR, VAR == vincent -> VAR = vincent


%% 9.2 How does Prolog respond to the following queries?

%% ?- .(a,.(b,.(c,[]))) = [a,b,c] -> Yes
%% ?- .(a,.(b,.(c,[]))) = [a,b|[c]] -> Yes
%% ?- .(.(a,[]),.(.(b,[]),.(.(c,[]),[]))) = X -> X = [[a],[b],[c]]
%% ?- .(a,.(b,.(.(c,[]),[]))) = [a,b|[c]] -> No


%% 9.3 Write a two-place predicate termtype(Term,Type) that takes a term and
%%     gives back the type(s) of that term (atom, number, constant, variable,
%%     and so on). The types should be given back in the order of their
%%     generality. The predicate should behave in the following way.
%%     ?- termtype(Vincent, variable). yes
%%     ?- termtype(mia, X). X = atom, X = constant, X = simple_term, X = term
%%     ?- termtype(dead(zed),X). X = complex_term, X = term


termtype(Term, Type) :-
    (atom(Term),
     Type = atom);
    (number(Term),
     Type = number);
    (atomic(Term),
     (Type = constant;
      Type = simple_term));
    (var(Term),
     (Type = variable;
      Type = simple_term));
    (Type = variable,
     Type = simple_term);
    (integer(Term),
     Type = integer);
    (float(Term),
     Type = floating_point);
    (complex(Term),
     Type = complex_term);
     Type = term.

complex(Term) :-
    functor(Term, _, N),
    N > 0.


%% 9.4 Write a Prolog program that defines the predicate groundterm(Term) which
%%     tests whether or not Term is a ground term. Ground terms are terms that 
%%     do not contain variables. For example, groundterm(X) gives no,
%%     groundterm(french(big_mac,le_big,mac)) gives yes.


groundterm(X) :-
    nonvar(X),
    =..(X, List),
    check(List).

check([H|T]) :-
    nonvar(H),
    check(T).

check([]).
 

%% 9.5 Assume that we have the following operator definitions.

%% :- op(300, xfx, [are, is_a]).
%% :- op(300, fx, likes).
%% :- op(200, xfy, and).
%% :- op(100, fy, famous).

%% Which of the following are well-formed terms? What are the main operators?
%% Give the bracketings.

%% X is_a witch -> Yes, is_a main operator
%%                 is_a(X, witch)
%% harry and ron and hermione are friends -> yes, are main opp
%%                 are(and(harry, and(ron,hermione),friends)
%% harry is_a wizard and likes quidditch -> No, (operator priorities clash)
%% dumbledore is_a famous wizard -> yes, is_a main operator
%%                 is_a(dumbledore, famous(wizard))
