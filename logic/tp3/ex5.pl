female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(mitchell).
female(pameron).
female(haley).
female(lily).
male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(cameron).
male(bo).
male(dylan).
male(alex).
male(luke).
male(rexford).
male(calhoun).
parent(grace, phil).
parent(frank, phil).
parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).
parent(jay,joe).
parent(gloria,joe).
parent(gloria,manny).
parent(javier,manny).
parent(barb,cameron).
parent(merle,cameron).
parent(barb,pameron).
parent(merle,pameron).
parent(phil,haley).
parent(claire,haley).
parent(phil,alex).
parent(claire,alex).
parent(phil,luke).
parent(claire,luke).
parent(mitchell,lily).
parent(cameron,lily).
parent(mitchell,rexford).
parent(cameron,rexford).
parent(pameron,calhoun).
parent(bo,calhoun).
parent(dylan,george).
parent(haley,george).
parent(dylan,poppy).
parent(haley,poppy).
father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).
grandparent(X,Z) :- parent(X,Y), parent(Y,Z).
grandfather(X,Z) :- father(X,Y), parent(Y,Z).
grandmother(X,Z) :- mother(X,Y), parent(Y,Z).
siblings(X,Y) :- father(Z,X), father(Z,Y), mother(K,X), mother(K,Y), X \= Y.
halfSiblings(X,Y) :- parent(Z,X), parent(Z,Y), \+ siblings(X,Y), X \= Y.
cousins(X,Y) :- parent(A,X), parent(B,Y), siblings(A,B), X \= Y.
uncle(X,Y) :- father(Z,Y), siblings(Z,X).

% a)
children(Person, Children) :-
    findall(Child, parent(Person,Child), Children).

% b)
children_of_aux(Person, ListOfPeople, Child) :-
    member(Person, ListOfPeople),
    parent(Person, Child).

children_of(ListOfPeople, ListOfPairs) :-
    bagof(Person-Child, children_of_aux(Person,ListOfPeople,Child), ListOfPairs).

% c)
person(X) :- male(X).
person(X) :- female(X).
family(F) :-
    findall(Person, person(Person), F).

% d)
couple(A,B) :-
    parent(A,C),
    parent(B,C),
    A \== B.

% e)
couples(C) :-
    setof(A-B, couple(A,B), C).

% f)
common_child(Person, Spouse, Child) :-
    parent(Person, Child),
    parent(Spouse, Child),
    Person \== Spouse.

children_of_two(A,B,Children) :-
    parent(A,C),
    parent(B,C),
    A \== B,
    findall(Child, common_child(A,B,Child), Children).

spouse_children(Person, SC) :-
    setof(Spouse/Children, children_of_two(Person, Spouse, Children), SC).

% g)
immediate_family(Person, A-B) :-
    findall(Parent, parent(Parent, Person), A),
    spouse_children(Person, B).

% d)
parent_of_two(A) :-
    parent(A,C),
    parent(B,C),
    parent(A,D),
    parent(B,D),
    A \== B,
    C \== D.

parents_of_two(Parents) :-
    setof(P, parent_of_two(P), Parents).