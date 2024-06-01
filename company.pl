% Подключить модель  родительской компании
:-consult("parent.pl").

% Стратегические цели (Р01)
% ----------------------------------------------------------------------
goal(goal1).
description(goal1, "goal 1 description here").
horizon(goal1, "2024Q4").

goal(goal2).
description(goal2, "zzz").
horizon(goal2, "zzz").

% Стратегические задачи (Р02)
% ----------------------------------------------------------------------
strategy(strategy1).
%description(strategy1, "strategy 1 description here").
horizon(strategy1, "2025Q1").
realize(strategy1, goal1).

strategy(strategy2).
description(strategy2, "strategy 2 description here").
horizon(strategy2, "2024Q3").
realize(strategy2, goal1).

% Задачи и планы (Р09)
% ----------------------------------------------------------------------
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

% Клиенты (Р03)
% ----------------------------------------------------------------------
client(client1).
description(client1, "client 1 description").
type(client1, "Физические лица").
count(client1, 100).

client(client2).
description(client2, "client 2 description").
type(client2, "Микро и малый бизнес").
count(client2, 10).

% Продукты (Р04)
% ----------------------------------------------------------------------
product(product1).
name(product1, "this product 1 name").
description(product1, "this is product 1 description").
status(product1, "Используется").
comments("product1", "these are the comments, risks, problems").

product(product2).
name(product2, "this product 2 name").
description(product2, "this is product 2 description").
status(product2, "Используется").
comments("product2", "these are the comments, risks, problems").

% Каналы (Р05)
% ----------------------------------------------------------------------
channel(channel1).
name(channel1, "this is channel1 name").
type(channel1, "Цифровой").
location(channel1, "Внутренний").
description(channel1, "this is channel 1 description").
status(channel1, "Создается").
security(channel1, "SSL").
product(channel1, product1).
product(channel1, product2).
client(channel1, client1).
client(channel1, client2).

% Группы (Р12)
% ----------------------------------------------------------------------
group(group1).
name(group1, "this is group 1 name").

group(group2).
name(group2, "this is group 2 name").
parent(group2, group1).

group(group3).
%name(group3, "this is group 3 name").
parent(group3, group2).

group(group4).
name(group4, "this is group 4 name").
parent(group4, group2).
parent(group4, group3).






:-consult("io.pl").

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
    out("horizon", Horizon).

