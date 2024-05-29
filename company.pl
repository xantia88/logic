% Подключить модель  родительской компании
:-consult("parent.pl").

% Стратегические цели (Р01)
goal(goal1).
description(goal1, "goal 1 description here").
%horizon(goal1, "2024Q4").

goal(goal2).
description(goal2, "zzz").
horizon(goal2, "zzz").

% Стратегические задачи (Р02)
strategy(strategy1).
description(strategy1, "strategy 1 description here").
horizon(strategy1, "2025Q1").
realize(strategy1, goal1).

strategy(strategy2).
description(strategy2, "strategy 2 description here").
horizon(strategy2, "2024Q3").
%realize(strategy2, goal1).

% Задачи и планы (Р09)
task(task1).
description(task1, "task 1 description here").
deadline(task1, "2024Q1").
status(task1, "Запланировано").
realize(task1, strategy1).

task(task2).
description(task2, "task 2 description here").
deadline(task2, "2023Q3").
status(task2, "Запланировано").
realize(task2, strategy2).

:-consult("io.pl").

out(Name, Value):-
    write(Name), write(" = "), write(Value), nl.

wtask(Id, Description, Deadline, Status, Strategy):-
    out("id", Id),
    out("description", Description),
    out("deadline", Deadline),
    out("status", Status),
    out("strategy", Strategy).

task:-
    read_string("Код задачи", Id),
    read_string("Описание", Description),
    read_string("Срок", Deadline),
    select_item("Статус", task_status, Status),
    select_item("Стратегия", strategy, description, Strategy),
    wtask(Id, Description, Deadline, Status, Strategy).

