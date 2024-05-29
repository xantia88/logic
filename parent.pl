% список предикатов, используемых для моделирования
:-discontiguous(goal/1).
:-discontiguous(description/2).
:-discontiguous(horizon/2).
:-discontiguous(strategy/1).
:-discontiguous(realize/2).
:-discontiguous(task/1).
:-discontiguous(deadline/2).
:-discontiguous(task_status/2).
:-discontiguous(status/2).

% справочник статусов для задач (Р09)
task_status(1, "Запланировано").
task_status(2, "В процессе").
task_status(3, "Завершено").
task_status(4, "Отменено").

% Проверка структуры целей (Р01)
valid_goal(X):-
    goal(X), % должна быть определена как цель
    description(X, _), % должно быть задано описание
    horizon(X, _). % должен быть задан горизонт

% Проверка структуры стратегических задач (Р02)
valid_strategy(X):-
    strategy(X), % должна быть определена как стратегическая задача
    description(X, _), % должно быть задано описание
    horizon(X, _), % должен быть определен горизонт
    realize(X, Goal), valid_goal(Goal). % должна быть связана с валидной целью

% Проверка структуры задач и планов (Р09)
valid_task(X):-
    task(X), % должна быть определена как задача
    description(X, _), % должно быть задано описание
    deadline(X, _), % должен быть задан срок
    status(X, Status), task_status(_, Status), % должен быть определен статус из соответствующего справочника
    realize(X, Strategy), valid_strategy(Strategy). % должна быть связана с валидной стратегической задачей

validate(T, X):-
    write(" "), write(T),
    write("........................"),
    (
        call(T, X, _) ->
        write(" ok"), !
        ; write(" ошибка (параметр)")
    ), nl.

validate(T, X, L):-
    write(" "), write(T),
    write("........................"),
    (
        call(T, X, V) ->
        write(" ok"),
        (
            call(L, _, V) ->
            write(" ok"), !
            ; write(" ошибка (справочник)")
        ), !
        ; write(" ошибка")
    ), nl.

explain_goal(X):-
    write("Цель "), write(X), write(" "),
    (
        goal(X) ->
        write("определена"), nl, 
        validate(description, X),
        validate(horizon, X),  !
        ; write("не определена")
    ).

explain_strategy(X):-
    write("Стратегическая задача "), write(X), write(" "),
    (
        strategy(X) ->
        write("определена"), nl, 
        validate(description, X),
        validate(horizon, X),
        (
            realize(X, G) ->
            explain_goal(G), !
            ; write("no goal")
        ), !
        ; write("не определена")
    ).

explain_task(X):-
    write("Задача "), write(X),
    (
        task(X) ->
        write(" определена"), nl, 
        validate(description, X),
        validate(deadline, X), 
        validate(status, X, task_status),
        (
            realize(X, S) ->
            explain_strategy(S), !
            ; write("no strategy")
        ), !
        ; write("не определена")
    ).

