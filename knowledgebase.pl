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
description(strategy1, "strategy 1 description here").
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

% Системы (Р11)
% ----------------------------------------------------------------------
system(system1).
name(system1, "this is system 1 name").
description(system1, "this is system 1 description").
group(system1, group4).
ownership(system1, "Используем как сервис (SaaS)").
class(system1, "Класс 1").
external(system1).

system(system2).
name(system2, "this is system 2 name").
description(system2, "this is system 2 description").
group(system2, group3).
ownership(system2, "Владеем экземпляром").
class(system2, "Класс 2").
internal(system2).
status(system2, "Целевая").
change(system2, "Планируется").
current(system2, "Эскиз").
plan(system2, "Промышленная эксплуатация").
level(system2, "Business Critical").
performance(system2, "performance here").
availability(system2, "availablity here").
%rto(system2, "24").
rpo(system2, "20").
monitoring(system2, "monitoring here").
changes(system2, "changes here").

system(system3).
name(system3, "this is system 2 name").
description(system3, "this is system 2 description").
group(system3, group3).
ownership(system3, "Владеем экземпляром").
class(system3, "Класс 3").
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

% Функциональность (Р10)
% ----------------------------------------------------------------------
function(function1).
name(function1, "this is function 1 name").
description(function1, "this is function 1 description").
target(function1, "Целевое").
status(function1, "Планируется").
system(function1, system1).
system(function1, system2).

% Бизнес процессы (Р06)
% ----------------------------------------------------------------------
process(process1).
name(process1, "this is process 1 name").
description(process1, "this is process 1 description").
use(process1, system1).
use(process1, product1).
use(process1, object1).
use(process1, integration1).

process(process2).
name(process2, "this is process 2 name").
description(process2, "this is process 2 description").
use(process2, system2).
use(process2, product2).
use(process2, object2).
use(process2, integration2).

% Бизнес объекты (Р07)
% ----------------------------------------------------------------------
object(object1).
name(object1, "this is object 1 name").
status(object1, "Используется").

object(object2).
name(object2, "this is object 2 name").
status(object2, "Используется1").

% Объекты данных (Р08)
% ----------------------------------------------------------------------
data(data1).
name(data1, "this is data 1 name").
category(data1, "Персональные данные").
status(data1, "Используется").
system(data1, system1).
parent(data1, object2).

data(data2).
name(data2, "this is data 2 name").
%category(data2, "Медицинские данные").
status(data2, "Используется").
system(data2, system2).

% Интеграционные потоки (Р14)
% ----------------------------------------------------------------------
integration(integration1).
description(integration1, "this is integration1 description").
source(integration1, system1).
destination(integration1, system2).
transmit(integration1, data1).
transmit(integration1, data2).
technology(integration1, "FILE").
mode(integration1, "По расписанию").
%load(integration1, max("100 rps"), avg("10 rps")).
asynch(integration1).
status(integration1, "Используется").
security(integration1, "SSL").

integration(integration2).
description(integration2, "this is integration1 description").
source(integration2, system1).
destination(integration2, system2).
transmit(integration2, data1).
transmit(integration2, data2).
technology(integration2, "FILE").
mode(integration2, "По расписанию").
load(integration2, max("100 rps"), avg("10 rps")).
asynch(integration2).
status(integration2, "Используется").
security(integration2, "SSL").

% Технические компоненты (Р16)
% ----------------------------------------------------------------------
component(component1).
system(component1, system1).
type(component1, "Proxy").
software(component1, "SuperProxy").
vendor(component1, "MS").
scalability(component1, "Горизонтальная").
ha(component1, false).
dr(component1, type("Active"), level("Полное")).
backup(component1, location("ЦОД"), duplicate("ЦОД")).
monitoring(component1, "Zabbix").

component(component2).
system(component2, system1).
type(component2, "Proxy").
software(component2, "SuperProxy 2").
vendor(component2, "MS").
scalability(component2, "Вертикальная").
ha(component2, type("Active"), level("Частичное")).
dr(component2, type("StandBy"), level("Полное")).
backup(component2, location("ЦОД"), duplicate("Offsite")).
monitoring(component2, "Zabbix").

