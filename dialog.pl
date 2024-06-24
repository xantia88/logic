
it_is("отказать в приеме на работу"):- 
    not(this("есть диплом")).

it_is("должность научного сотрудника"):-
    this("сделал важное открытие").

it_is("должность инженера-конструктора"):- 
    this("средний балл за время учебы >=3.5").

it_is("должность инженера по эксплуатации"):- 
    this("средний балл <3.5"), this("работал по специальности >2 лет").

it_is("отказать в приеме на работу"):- 
    this("средний балл <3.5"), this("стаж работы <2 лет").

this(S):-
    write(S), write("?"), nl, 
    read(Ans), 
    Ans = 'y'.

%it_is(X), write(X)


:-dynamic(components/1).
:-dynamic(tight/1).

answer("yes"):-
    question("components1"), assertz(components(1)), write(saved), nl, 
    not(question("tight1")), assertz(tight(1)).

%
answer("no"):-
    not(components(1)).
%    (
%        components(1) ->
%        write(a1), nl, fail, !
%    ;   write(a2), nl
%    ).

answer("maybe"):-
    question("components3"), question("tight3").

question(S):-
    write(S), write("?"),
    read(Ans), Ans='y'.




