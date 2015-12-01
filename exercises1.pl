%% Author: Rebecca Lee
%% Date: 17 November 2015

%% CHAPTER 1 EXERCISES - Learn Prolog Now! (online version)

%% 1.1 Which of the following sequences of characters are atoms, which are
%%     variables, and which are neither?

%% 1. vINCENT -> atom
%% 2. Footmassage -> variable
%% 3. variable23 -> atom
%% 4. Variable2000 -> variable
%% 5. big_kahuna_burger -> atom
%% 6. 'big kahuna burger' -> atom
%% 7. big kahuna burger -> neither
%% 8. 'Jules' -> atom
%% 9. _Jules -> variable
%% 10. '_Jules' -> atom


%% 1.2 Which of the following sequences of characters are atoms, which are 
%%     variables, which are complex terms, and which are not terms at all?
%%     Give the functor and arity of each complex term.

%% 1. loves(Vincent, mia) -> complex term, loves/2
%% 2. 'loves(Vincent, mia)' -> atom
%% 3. Butch(boxer) -> not a term at all
%% 4. boxer(Butch) -> complex term, boxer/1
%% 5. and(big(burger), kahuna(burger)) -> complex term, and/2
%% 6. and(big(X), kahuna(X)) -> complex term, and/2
%% 7. _and(big(X), kahuna(X)) -> not a term at all
%% 8. (Butch kills Vincent) -> not a term at all
%% 9. kills(Butch Vincent) -> not a term at all
%% 10. kills(Butch, Vincent -> not a term at all


%% 1.3 How many facts, rules, clauses, and predicates are there in the 
%%     following knowledge base? What are the heads of the rules, and what 
%%     are the goals they contain?

woman(vincent).
woman(mia).
man(jules).
person(X):- man(X); woman(X).
loves(X,Y):- father(X,Y).
father(Y,Z):- man(Y), son(Z,Y).
father(Y,Z):- man(Y), daughter(Z,Y).

%% There are 3 facts and 4 rules, making up a total of 7 clauses.
%% The predicates are woman/1, man/1 person/1, loves/2, father/2, son/2,
%% and daughter/2, giving a total of 7 predicates.

%% The head of the first rule is person(X)
%% and the goals are man(X) or woman(X).

%% The head of the second rule is loves(X,Y), the goal is father(X,Y).

%% The head of the third rule is father(Y,Z)
%% and the goals are man(Y) and son(Z,Y).

%% The head of the fourth rule is father(Y,Z)
%% and the goals are man(Y) and daughter(Z,Y).


%% 1.4 Represent the following in Prolog:

%% 1. Butch is a killer.
killer(butch).

%% 2. Mia and Marsellus are married.
married(mia, marsellus).

%% 3. Zed is dead.
dead(zed).

%% 4. Marsellus kills everyone who gives Mia a footmassage.
kills(marsellus, X) :- 
	     gives_foot_massage(X, mia).

%% 5. Mia loves everyone who is a good dancer.
loves(mia, X) :-
	     good_dancer(X).

%% 6. Jules eats anything that is nutritious or tasty.
eats(jules) :- 
	     nutritious(X);
	     tasty(X).


%% 1.5 Suppose we are working with the following knowledge base:

wizard(ron).
hasWand(harry).
quidditchPlayer(harry).
wizard(X):- hasBroom(X), hasWand(X).
hasBroom(X):- quidditchPlayer(X).

%% How does Prolog respond to the following queries?

%% 1. wizard(ron). -> Yes
%% 2. witch(ron). -> Procedure user:witch/1 does not exist
%% 3. wizard(hermione). -> No
%% 4. witch(hermione). -> Procedure user:witch/1 does not exist
%% 5. wizard(harry). -> Yes
%% 6. wizard(Y) -> Y = ron, Y = harry
%% 7. witch(Y) -> Procedure user:witch/1 does not exist
