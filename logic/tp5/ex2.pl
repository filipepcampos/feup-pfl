% my_arg(+Index, +Term, ?Arg)
my_arg(Index, Term, Arg) :-
    List =.. Term,
    nth0(Index, List, Arg).

my_functor(Term, Name, Arity) :-
    List =.. Term,
    nth0(0, List, Name),
    length(List, LSize),
    Arity is LSize - 1.