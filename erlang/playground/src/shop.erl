-module(shop).
-export([total/1]).
-import(lists, [sum/1]).

total(L) -> sum([cost(A) *  B || {A, B} <- L]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2; 
cost(pears) -> 9;
cost(milk) -> 7.
