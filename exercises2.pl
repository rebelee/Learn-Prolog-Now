%% Author: Rebecca Lee
%% Date: 17 November 2015

%% CHAPTER 2 EXERCISES - Learn Prolog Now! (online version)

%% 2.1 Which of the following pairs of terms unify? Where relevant, give the 
%%     variable instantiations that lead to successful unification.

%% 1. bread = bread -> Yes
%% 2. 'Bread' = bread -> No
%% 3. 'bread' = bread -> Yes
%% 4. Bread = bread -> Yes, Bread = bread
%% 5. bread = sausage -> No
%% 6. food(bread) = bread -> No
%% 7. food(bread) = X -> Yes, X = food(bread)
%% 8. food(X) = food(bread) -> Yes, X = bread
%% 9. food(bread,X) = food(Y,sausage) -> Yes, X = sausage, Y = bread
%% 10. food(bread,X,beer) = food(Y,sausage,X) -> No
%% 11. food(bread,X,beer) = food(Y,kahuna_burger) -> No
%% 12. food(X) = X -> Yes, X = food(X)
%% 13. meal(food(bread),drink(beer)) = meal(X,Y) -> Yes, X = food(bread),
%%                                                  Y = drink(beer)
%% 14. meal(food(bread),X) = meal(X,drink(beer)) -> No


%% 2.2 We are working with the following knowledge base:

house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):- house_elf(X).
magic(X):- wizard(X).
magic(X):- witch(X).

%% Which of the following queries are satisfied? Where relevant, give all the 
%% variable instantiations that lead to success.

%% 1. ?- magic(house_elf). -> No, Procedure user:wizard/1 does not exist
%% 2. ?- wizard(harry). -> No, Procedure user:wizard/1 does not exist
%% 3. ?- magic(wizard). -> No, Procedure user:wizard/1 does not exist
%% 4. ?- magic('McGonagall'). -> No, Procedure user:wizard/1 does not exist
%% 5. ?- magic(Hermione). -> Yes, Hermione = dobby,
%%                           then a Procedure user:wizard/1 does not exist error

%% Draw the search tree for the query magic(Hermione).

%% ?- magic(Hermione).
%%    1 Call: magic(_763) ?
%%    2 Call: house_elf(_763) ?
%%    2 Exit: house_elf(dobby) ?
%%    1 Exit: magic(dobby) ?
%%    Hermione = dobby ? ;
%%    1 Redo: magic(dobby) ?
%%    2 Call: wizard(_763) ?
%%    Procedure user:wizard/1 does not exist


%% 2.3 Here is a tiny lexicon (that is, information about individual words) and a 
%%     mini grammar consisting of one syntactic rule (which defines a sentence
%%     to be an entity consisting of five words in the following order: a 
%%     determiner, a noun, a verb, a determiner, a noun).

word(determiner,a). 
word(determiner,every). 
word(noun,criminal). 
word(noun,'big  kahuna  burger'). 
word(verb,eats). 
word(verb,likes). 
    
sentence(Word1,Word2,Word3,Word4,Word5):- 
    word(determiner,Word1), 
    word(noun,Word2), 
    word(verb,Word3), 
    word(determiner,Word4), 
    word(noun,Word5).

%% What query do you have to pose in order to find out which sentences the grammar
%% can generate? List all sentences that this grammar can generate in the order
%% that Prolog will generate them in.

%% ?- sentence(D1, N1, V, D2, N2).
%% a criminal eats a criminal
%% a criminal eats a 'big kahuna burger'
%% a criminal eats every criminal
%% a criminal eats every 'big kahuna burger'
%% a criminal likes a criminal
%% a criminal likes a 'big kahuna burger'
%% a criminal likes every criminal
%% a criminal likes every 'big kahuna burger'
%% a 'big kahuna burger' eats a criminal
%% a 'big kahuna burger' eats a 'big kahuna burger'
%% a 'big kahuna burger' eats every criminal
%% a 'big kahuna burger' eats every 'big kahuna burger'
%% a 'big kahuna burger' likes a criminal
%% a 'big kahuna burger' likes a 'big kahuna burger'
%% a 'big kahuna burger' likes every criminal
%% a 'big kahuna burger' likes every 'big kahuna burger'
%% every criminal eats a criminal
%% every criminal eats a 'big kahuna burger'
%% every criminal eats every criminal
%% every criminal eats every 'big kahuna burger'
%% every criminal likes a criminal
%% every criminal likes a 'big kahuna burger'
%% every criminal likes every criminal
%% every criminal likes every 'big kahuna burger'
%% every 'big kahuna burger' eats a criminal
%% every 'big kahuna burger' eats a 'big kahuna burger'
%% every 'big kahuna burger' eats every criminal
%% every 'big kahuna burger' eats every 'big kahuna burger'
%% every 'big kahuna burger' likes a criminal
%% every 'big kahuna burger' likes a 'big kahuna burger'
%% every 'big kahuna burger' likes every criminal
%% every 'big kahuna burger' likes every 'big kahuna burger'


%% 2.4 Here are six Italian words:
%%     astante, astoria, baratto, cobalto, pistola, statale.
%%     They are to be arranged, crowssword puzzle fashion, in the following grid:

%%     V1    V2    V3
%%     -     -     -
%% H1 -----------------
%%     -     -     -
%% H2 -----------------
%%     -     -     -
%% H3 -----------------
%%     -     -     -

%% The following knowledge base represents a lexicon containing these words:

word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).

%% Write a predicate crossword/6 that tells us how to fill in the grid. The first
%% three arguments should be the vertical words from left to right, and the last
%% three arguments the horizontal words from top to bottom.

crossword(V1, V2, V3, H1, H2, H3) :-
    word(H1, _, H1V1, _, H1V2, _, H1V3, _),
    word(H2, _, H2V1, _, H2V2, _, H2V3, _),
    word(H3, _, H3V1, _, H3V2, _, H3V3, _),
    word(V1, _, H1V1, _, H2V1, _, H3V1, _),
    word(V2, _, H1V2, _, H2V2, _, H3V2, _),
    word(V3, _, H1V3, _, H2V3, _, H3V3, _).









