/*Defining adjacent parameters*/
adjacent(X,Y) :- X is (Y + 1);
                 X is (Y - 1).

/* The print out formating*/
building([office(_, 5), office(_, 4), office(_, 3), office(_, 2), office(_, 1)]).


/*This contains the given logical parameters*/
whos_office(X) :- building(X),
    
    /*Hunter doesn't work in the 5th office*/  
    member(office(hunter, A), X), A \= 5,
    
    /*Laura doesn't work in the 1rst office*/
    member(office(laura, B), X), B \= 1,

    /*Sally works in an office higher than Laura's*/
    member(office(sally, D), X), D > B,

    member(office(jack, C), X),
    
    /*Jim doesn't work in the first or last office, and not next_to Jack or Laura*/
    member(office(jim, E), X), E \= 1, E \= 5, \+ (adjacent(E,B)), \+ (adjacent(E,C)).



