% Подключить модель родительской компании
:-consult("model.pl").

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
name(group3, "this is group 3 name").
parent(group3, group2).

group(group4).
name(group4, "this is group 4 name").
parent(group4, group2).
parent(group4, group3).

% проверка корректности систем (Р11)
% ----------------------------------------------------------------------
system(system1).
name(system1, "this is system 1 name").
description(system1, "this is system 1 description").
group(system1, group4).
ownership(system1, "Используем как сервис (SaaS)").
class(system1, "Класс").
external(system1).

system(system2).
name(system2, "this is system 2 name").
description(system2, "this is system 2 description").
group(system2, group3).
ownership(system2, "Владеем экземпляром").
class(system2, "Класс").
internal(system2).
status(system2, "Целевая").
change(system2, "Планируется").
current(system2, "Эскиз").
plan(system2, "Промышленная эксплуатация").
level(system2, "Business Critical").
performance(system2, "performance here").
availability(system2, "availablity here").
rto(system2, "24").
rpo(system2, "20").
%monitoring(system2, "monitoring here").
changes(system2, "changes here").

system(system3).
name(system3, "this is system 2 name").
description(system3, "this is system 2 description").
group(system3, group3).
ownership(system3, "Владеем экземпляром").
class(system3, "Класс").
internal(system3).
status(system3, "Целевая").
change(system3, "Планируется").
current(system3, "Эскиз").
plan(system3, "Промышленная эксплуатация").
level(system3, "Business Critical").
performance(system3, "performance here").
availability(system3, "availablity here").
rto(system3, "24").
rpo(system3, "20").
monitoring(system3, "monitoring here").
changes(system3, "changes here").
parent(system3, system2).

