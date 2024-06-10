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
    call(L, N, Name), write("["), write(N), write("]"), write("="), write(Name), nl, fail.
list(_) :-
    true.

% Отобразить сущности для выбора
% E - название сущности, N - аттрибут, используемый для выбора
list(E, N) :-
    call(E, Id), write("["), write(Id), write("]"), tab(4), call(N, Id, Name), write(Name), nl, fail.
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






:-dynamic(goal/1).
:-dynamic(realize/2).
:-dynamic(description/2).
:-dynamic(horizon/2).
:-dynamic(deadline/2).
:-dynamic(status/2).
:-dynamic(task/1).
:-dynamic(strategy/1).

% диалог добавления новой цели
goal:-
    % собрать данные от пользователя
    read_string("Код цели", Id),
    read_string("Описание", Description),
    read_string("Горизонт", Horizon),
    % сохранить в базе знаний
    assertz(goal(Id)), % добавить в базу знаний
    assertz(description(Id, Description)),
    assertz(horizon(Id, Horizon)),
    % уведомить пользователя об операции
    write("Цель сохранена в базе знаний"), nl.

% диалог добавления новой стратегической задачи
strategy:-
    % собрать данные от пользователя
    read_string("Код стратегической задачи", Id),
    read_string("Описание", Description),
    read_string("Горизонт", Horizon),
    select_item("Цель", goal, description, Goal),
    % сохранить в базе знаний
    assertz(strategy(Id)), 
    assertz(description(Id, Description)),
    assertz(horizon(Id, Horizon)),
    assertz(realize(Id, Goal)),
    % уведомить пользователя об операции
    write("Новая стратегическая задача соохранена в базе знаний"), nl.

% диалог добавления новой задачи
task:-
    % собрать данные от пользователя
    read_string("Код задачи", Id),
    read_string("Описание", Description),
    read_string("Срок", Deadline),
    select_item("Статус", task_status, Status),
    select_item("Стратегия", strategy, description, Strategy),
    % сохранить в базе знаний
    assertz(task(Id)),
    assertz(description(Id, Description)),
    assertz(deadline(Id, Deadline)),
    assertz(status(Id, Status)),
    assertz(realize(Id, Strategy)),
    % уведомить пользователя об операции
    write("Новая задача и план соохранены в базе знаний"), nl.

% структура YAML для цели
yaml(goal(X)):-
    goal(X),
    tab(4), write("goal: "), write(X), nl,
    tab(8), write("description:"), description(X, D), write(D), nl,
    tab(8), write("horizon: "), horizon(X, H), write(H), nl.

% структура YAML для стратегической задачи
yaml(strategy(X)):-
    strategy(X),
    tab(4), write("strategy: "), write(X), nl,
    tab(8), write("description:"), description(X, D), write(D), nl,
    tab(8), write("horizon: "), horizon(X, H), write(H), nl,
    tab(8), write("goal: "), realize(X, G), write(G), nl.

% структура YAML для задачи и плана
yaml(task(X)):-
    task(X),
    tab(4), write("task: "), write(X), nl,
    tab(8), write("description:"), description(task(X), D), write(D), nl,
    tab(8), write("deadline: "), deadline(task(X), DL), write(DL), nl,
    tab(8), write("status: "), status(task(X), S), write(S), nl,
    tab(8), write("startegy: "), realize(task(X), St), write(St), nl.



