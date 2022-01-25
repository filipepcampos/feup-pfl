:- dynamic male/1, female/1, parent/2.

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
add_person_aux(male, Name) :-
    assert(male(Name)).

add_person_aux(female, Name) :-
    assert(female(Name)).

add_person :-
    write('Write new person in the format male/female-name\n >'),
    read(Gender-Name),
    add_person_aux(Gender, Name).

% b)
add_parents(Person) :-
    write('Write the parents in the format parent1-parent2\n >'),
    read(Parent1-Parent2),
    assert(parent(Parent1, Person)),
    assert(parent(Parent2, Person)).

% c)
remove_person :-
    write('Person name\n >'),
    read(Name),
    retractall(parent(Name, _)),
    retract((male(Name))),
    retract((female(Name))).