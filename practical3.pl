%% Author: Rebecca Lee
%% Date: 18 November 2015

%% CHAPTER 3 PRACTICAL - Learn Prolog Now! (online version)

%% 1. Load descend1.pl, turn on trace, and pose the query descend(anne,emily).
%%    Count how many steps it takes Prolog to work out the answer (how many times
%%    do you have to press the return key). Now turn trace off and pose the query
%%    descend(X,Y). How many answers are there?

/*
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y) :- child(X,Y).

descend(X,Y) :- child(X,Z),
                    descend(Z,Y).
*/

%% It takes 22 return key presses to work out this answer. There are 10 answers
%% to descend(X,Y).


%% 2. Load descend2.pl. This is the variant of descend1.pl with the rule order
%%    reversed. Repeat the traces carried out for descend1.pl and compare the
%%    results.

/*
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y) :- child(X,Z),
                    descend(Z,Y).

descend(X,Y) :- child(X,Y).
*/

%% It takes 25 return key presses to work out this answer. (A few more steps 
%% required than it did for descend1.pl).


%% 3. Load descend3.pl. This is the variant of descend2.pl in which the goal 
%%    order within the recursive rule is switched, resulting in a left recursive
%%    rule. Because of this, even for such simple queries as 
%%    descend(anne,bridget) Prolog will not terminate. Step through an example
%%    using trace, to confirm this.

/*
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y) :- descend(Z,Y).
                   child(X,Z).        

descend(X,Y) :- child(X,Y).
*/

%% If a trace is run for this query descend(anne,bridget), Prolog will step through
%% an infinite amount of calls using descend(_, bridget) (different anonymous
%% each time). Prolog does not terminate.


%% 4. Load descend4.pl. This is the variant of descend3.pl obtained by switching 
%%    the rule order. So descend4.pl also contains a left recursive rule, and
%%    does not terminate on all input. But it does terminate on some input where
%%    descend3.pl does not. Which extra solutions does it find?

/* 
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y) :- child(X,Y).

descend(X,Y) :- descend(Z,Y).
                   child(X,Z).  
*/      

%% It will find 4 extra solutions, where descend(X,Y) :- child(X,Y) are true.

%% 5. Create a file containing numeral2.pl, load it, and investigate what happens
%%    if we pose queries about specific numerals. Do numeral1.pl and numeral2.pl
%%    behave in the same way on each input?

%% numeral1.pl

/*
numeral(0).
numeral(succ(X)) :- numeral(X).
*/

%% numeral2.pl

/*
numeral(succ(X)) :- numeral(X).
numeral(0).
*/

%% Running traces for both programs shows that the behavior is the same.

%% Second, look what happens if we try to generate numerals, that is, suppose we
%% pose the query numeral(X). Do the programs display identical behavior?

%% Running this query for numeral1.pl gives the answer X = 0 (2 steps in trace).
%% Running this query for numeral2.pl does not terminate as it will keep running
%% the recursive definition and try to unify X.


%% PRACTICE PROGRAMS

%% 1. Imagine the following knowledge base describes a maze. The facts determine
%%    which points are connected, that is, from which points you can get to which
%%    other points in one step. Futhermore, imagine that all paths are one-way
%%    streets, so that you can only walk them in one direction. So, you can get
%%    from point 1 to point 2, but not the other way around.

connected(1,2). 
connected(3,4). 
connected(5,6). 
connected(7,8). 
connected(9,10). 
connected(12,13). 
connected(13,14). 
connected(15,16). 
connected(17,18). 
connected(19,20). 
connected(4,1). 
connected(6,3). 
connected(4,7). 
connected(6,11). 
connected(14,9). 
connected(11,15). 
connected(16,12). 
connected(14,17). 
connected(16,19).

%% Write a predicate path/2 that tells you from which points in the maze you can
%% get to which other points when chaining together connections given in the above
%% knowledge base. Can you get from point 5 to point 10? Which other point can 
%% you get to when starting at point 1? And which points can be reached from point
%% 13?

path(P1, P2) :-
    connected(P1, P2).

path(P1, P2) :-
    connected(P1, P3),
    path(P3, P2).

%% Yes you can get from point 5 to point 10
%% You can get to point 2 from point 1
%% You can get to points 14, 9, 17, 10, and 18 from point 13.


%% 2. We are given the following knowledge base of travel information:

byCar(auckland,hamilton). 
byCar(hamilton,raglan). 
byCar(valmont,saarbruecken). 
byCar(valmont,metz). 
    
byTrain(metz,frankfurt). 
byTrain(saarbruecken,frankfurt). 
byTrain(metz,paris). 
byTrain(saarbruecken,paris). 
    
byPlane(frankfurt,bangkok). 
byPlane(frankfurt,singapore). 
byPlane(paris,losAngeles). 
byPlane(bangkok,auckland). 
byPlane(singapore,auckland). 
byPlane(losAngeles,auckland).

%% Write a predicate travel/2 which determines whether it is possible to travel
%% from one place to another by chaining together car, train, and plane journeys.
%% For example, your program should answer yes to the query travel(valmont,raglan).

travel(P1, P2) :-
    byCar(P1, P2);
    byTrain(P1, P2);
    byPlane(P1, P2).

travel(P1, P2) :-
    travel(P1, P3),
    travel(P3, P2).


%% 3. So, by using travel/2 to query the above database, you can find out that it
%%    is possible to go from Valmont to Raglan. If you are planning such a voyage,
%%    that is already something useful to know, but you would probably prefer to
%%    have the precise route from Valmont to Raglan. Write a predicate travel/3
%%    which tells you which route to take when travelling from one place to
%%    another. 


travel(P1, P2, go(P1, P2)) :-
    byCar(P1, P2);
    byTrain(P1, P2);
    byPlane(P1, P2).

travel(P1, P2, go(P1, P3, G)) :-
       travel(P1, P3, go(P1, P3)),
       travel(P3, P2, G).


%% 4. Extend the predicate travel/3 so that it not only tells you the route to
%%    take to get from one place to another, but also how you have to travel. That
%%    is, the new program should let us know, for each stage of the voyage, 
%%    whether we need to travel by car, train, or plane.

travel(P1, P2, go(P1, P2, G)) :-
       (byCar(P1, P2),
	G = car);
       (byTrain(P1, P2),
	G = train);
       (byPlane(P1, P2),
	G = plane).

travel(P1, P2, go(P1, P3, V, G)) :-
       travel(P1, P3, go(P1, P3, V)),
       travel(P3, P2, G).
