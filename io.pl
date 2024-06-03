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

% Проверка значения
validate(T, X):-
    tab(4), write(T), tab(4), 
    write("........................"),
    (
        call(T, X, _) ->
        write("ok"), !
        ; write("ошибка (параметр)")
    ), nl.

% Проверка значения из справочника
validate(T, X, L):-
    tab(4), write(T), tab(4),
    write("........................"),
    (
        call(T, X, V) ->
        write("ok"), tab(4),
        (
            call(L, _, V) ->
            write("ok"), !
            ; write("ошибка (справочник)")
        ), !
        ; write("ошибка")
    ), nl.

out(Name, Value):-
    write(Name), write(" = "), write(Value), nl.

task:-
    read_string("Код задачи", Id),
    read_string("Описание", Description),
    read_string("Срок", Deadline),
    select_item("Статус", task_status, Status),
    select_item("Стратегия", strategy, description, Strategy),
    write("---------------------"), nl,
    out("id", Id),
    out("description", Description),
    out("deadline", Deadline),
    out("status", Status),
    out("strategy", Strategy).

strategy:-
    read_string("Код стратегической задачи", Id),
    read_string("Описание", Description),
    read_string("Горизонт", Horizon),
    select_item("Цель", goal, description, Goal),
    write("---------------------"), nl,
    out("id", Id),
    out("description", Description),
    out("horizon", Horizon),
    out("Goal", Goal).

goal:-
    read_string("Код цели", Id),
    read_string("Описание", Description),
    read_string("Горизонт", Horizon),
    write("---------------------"), nl,
    out("id", Id),
    out("description", Description),
