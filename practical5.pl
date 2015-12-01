%% Author: Rebecca Lee
%% Date: 18 November 2015

%% CHAPTER 5 PRACTICAL - Learn Prolog Now! (online version)

%% 1. In the text we discussed the 3-place predicate accMax which returned the
%%    maximum of a list of integers. By changing the code slightly, turn this into
%%    a 3-place predicate accMin which returns the minimum of a list of integers.

accMin([], A, A).

accMin([H|T], A, Min) :-
    H < A,
    accMin(T, H, Min).

accMin([H|T], A, Min) :-
    H >= A,
    accMin(T, A, Min).

min(List, Min) :-
    List = [H|_],
    accMin(List, H, Min).


%% 2. In mathematics, an n-dimensional vector is a list of numbers of length n. For
%%    example, [2,5,12] is a 3-dimensional vector. One of the basic operations on
%%    vectors is scalar multiplication. In this operation, every element of a 
%%    vector is multiplied by some number. For example, if we scalar multiply the
%%    3-dimensional vector [2,7,4] by 3 the result is a 3-dimensional vector
%%    [6,21,12]. Write a 3-place predicate scalarMult whose first argument is and
%%    integer, whose second argument is a list of integers, and whose third 
%%    argument is the result of scalar multiplying the second argument by the 
%%    first.

scalarMult(_, [], []).

scalarMult(Int, [H1|T1], [H2|T2]) :-
    H2 is H1*Int,
    scalarMult(Int, T1, T2).


%% 3. Another fundamental operation on vectors is the dot product. This operation
%%    combines two vectors of the same dimension and yields a number as a result.
%%    The operation is carried out as follows: the corresponding elements of the
%%    two vectors are multiplied, and the results added. For example, the dot
%%    product of [2,5,6] and [3,4,1] is 6+20+6, that is 32. Write a 3-place 
%%    predicate dot whose first argument is a list of integers, whose second 
%%    argument is a list of integers of the same length as the first, and whose
%%    third argument is the dot product of the first argument with the second.

dot([], [], Acc, Acc).

dot([H1|T1], [H2|T2], Acc, Dot) :-
    NewAcc is H1*H2 + Acc,
    dot(T1, T2, NewAcc, Dot).

dot(List1, List2, Dot) :-
    dot(List1, List2, 0, Dot).
