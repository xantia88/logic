% Попросить пользователя ввести строковое значение и прочитать его
read_string(Message, Value) :-
    write(Message), nl,
    read(Y),
    Value = Y.


% Попросить пользователя ввести числовое значение и прочитать его
read_number(Message, Value) :-
    repeat,
    write(Message), nl,
    read(Y),
    (
        (integer(Y) ; float(Y)) ->
        Value = Y, !
        ; write("Ошибка: не число, попробуйте еще раз"), nl, fail % Ошибка, если не число
    ).

% Попросить пользователя выбрать элемент из справочника
select_item(Message, List, Id) :-
    repeat,
    write(Message), nl,
    list(List),
    read(Y),
    (
        call(List, Y, _) ->
        Id = Y, !
        ; write("Ошибка: нет такого элемента в справочнике, попробуйте еще раз"), nl, fail % Ошибка, если выбран элемент не из справочника
    ).

% Попросить пользователя выбрать элемент из существующих сущностей
select_item(Message, Entity, Attribute, Id) :-
    repeat,
    write(Message), nl,
    list(Entity, Attribute),
    read(Y),
    (
        call(Entity, Y) ->
        Id = Y, !
        ; write("Ошибка: нет такой сущности в списке, попробуйте еще раз"), nl, fail % Ошибка, если выбран элемент не из справочника
    ).

% Отобразить элементы справочника
list(L) :-
    call(L, N, Name), write(N), write("="), write(Name), nl, fail.
list(_) :-
    true.

% Отобразить сущности для выбора
% E - название сущности, N - аттрибут, используемый для выбора
list(E, N) :-
    call(E, Id), write(Id), write("="), call(N, Id, Name), write(Name), nl, fail.
list(_, _) :-
    true.

