% Ex A
fatorial(0,0).
fatorial(1,1).
fatorial(N, F) :- 
    M is N - 1,
    fatorial(M, K),
    F is N * K.

% Ex B
somaRec(1,1).
somaRec(N,Sum) :- 
    M is N - 1,
    somaRec(M, K),
    Sum is K + N.

% Ex C
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F) :-
    M is N - 1,
    L is M - 1,
    fibonacci(M, X),
    fibonacci(L, Y),
    F is X + Y.

% Ex D
isPrimeAux(N,0).
isPrimeAux(N,1).
isPrimeAux(N,K) :-
    A is N mod K,
    A =\= 0,
    X is K - 1,
    isPrimeAux(N,X).
    
isPrime(N) :- 
    M is N - 1,
    isPrimeAux(N,M).