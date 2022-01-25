:-use_module(library(lists)).

%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

% a)
airport(Airport) :-
    flight(Airport, _, _, _, _, _).

airport(Airport) :-
    flight(_, Airport, _, _, _, _).

get_all_nodes(ListOfAirports) :-
    setof(Airport, airport(Airport), ListOfAirports).

% b)
% number_of_flights_of_company(Company, Number) :-
%     flight(_,_,Company,_,_,_), % Need to instanciate the company
%     setof(Flight-D, flight(_,D,Company,_,_,_), ListOfFlights),
%     length(ListOfFlights, Number).
% 
% find_max([], Result-Max, Result).
% find_max([Company-N | T], BestCompany-Max, Result) :-
%     N > Max,
%     find_max(T, Company-N, Result).
% find_max([H | T], BestCompany-Max, Result) :-
%     find_max(T, BestCompany-Max, Result).
% 
% most_diverfied(Company) :-
%     setof(C-N, number_of_flights_of_company(C, N), ListOfCompanies),
%     find_max(ListOfCompanies, none-0, Company).

% b)
find_most_diverfied([], Result-Max, Result).

find_most_diverfied([Company | T], BestCompany-Max, Result) :-
    setof(D, flight(_,D,Company,_,_,_), ListOfDestinations),
    length(ListOfDestinations, N),
    N > Max,
    find_most_diverfied(T, Company-N, Result).

find_most_diverfied([H | T], BestCompany-Max, Result) :-
    find_most_diverfied(T, BestCompany-Max, Result).

company(Company) :-
    !,
    flight(_, _, Company, _, _, _).

most_diverfied(Result) :-
    setof(Company, company(Company), ListOfCompanies),
    find_most_diverfied(ListOfCompanies, none-0, Result).

