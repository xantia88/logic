% Подключить модель родительской компании
:-consult("model.pl").

% Стратегические цели (Р01)
% ----------------------------------------------------------------------
goal(goal1).
description(goal(goal1), "goal 1 description here").
horizon(goal(goal1), "").

goal(goal2).
description(goal(goal2), "zzz").
horizon(goal(goal2), "zzz").

% Стратегические задачи (Р02)
% ----------------------------------------------------------------------
strategy(strategy1).
description(strategy(strategy1), "strategy 1 description here").
horizon(strategy(strategy1), "2025Q1").
realize(strategy(strategy1), goal(goal1)).

strategy(strategy2).
description(strategy(strategy2), "strategy 2 description here").
horizon(strategy(strategy2), "2024Q3").
realize(strategy(strategy2), goal(goal1)).

% Задачи и планы (Р09)
% ----------------------------------------------------------------------
task(task1).
description(task(task1), "task 1 description here").
deadline(task(task1), "2024Q1").
status(task(task1), "Запланировано").
realize(task(task1), strategy(strategy1)).

task(task2).
description(task(task2), "task 2 description here").
deadline(task(task2), "2023Q3").
status(task(task2), "Запланировано").
realize(task(task2), strategy(strategy2)).

% Клиенты (Р03)
% ----------------------------------------------------------------------
client(client1).
description(client(client1), "client 1 description").
type(client(client1), "Физические лица").
count(client(client1), -100).

client(client2).
description(client(client2), "client 2 description").
type(client(client2), "Микро и малый бизнес").
count(client(client2), 10).

% Продукты (Р04)
% ----------------------------------------------------------------------
product(product1).
name(product(product1), "this product 1 name").
description(product(product1), "this is product 1 description").
status(product(product1), "Используется").
comments(product("product1"), "these are the comments, risks, problems").

product(product2).
name(product(product2), "this product 2 name").
description(product(product2), "this is product 2 description").
status(product(product2), "Используется").
comments(product("product2"), "these are the comments, risks, problems").

% Каналы (Р05)
% ----------------------------------------------------------------------
channel(channel1).
name(channel(channel1), "this is channel1 name").
type(channel(channel1), "Цифровой").
internal(channel(channel1)).
description(channel(channel1), "this is channel 1 description").
status(channel(channel1), "Создается").
security(channel(channel1), "SSL").
product(channel(channel1), product(product1)).
product(channel(channel1), product(product2)).
client(channel(channel1), client(client1)).
client(channel(channel1), client(client2)).

% Группы (Р12)
% ----------------------------------------------------------------------
group(group1).
name(group(group1), "this is group 1 name").

group(group2).
name(group(group2), "this is group 2 name").
parent(group(group2), group(group1)).

group(group3).
name(group(group3), "this is group 3 name").
parent(group(group3), group(group2)).

group(group4).
name(group(group4), "this is group 4 name").
parent(group(group4), group(group2)).
parent(group(group4), group(group3)).

% Системы (Р11)
% ----------------------------------------------------------------------
system(system1).
name(system(system1), "this is system 1 name").
description(system(system1), "this is system 1 description").
group(system(system1), group(group4)).
ownership(system(system1), "Используем как сервис (SaaS)").
class(system(system1), "Класс 1").
external(system(system1)).

system(system22).
name(system(system22), "this is system 1 name").
description(system(system22), "this is system 1 description").
group(system(system22), group(group4)).
ownership(system(system22), "Используем как сервис (SaaS)").
class(system(system22), "Класс 1").
external(system(system22)).
parent(system(system22), system(system1)).

system(system33).
name(system(system33), "this is system 1 name").
description(system(system33), "this is system 1 description").
group(system(system33), group(group4)).
ownership(system(system33), "Используем как сервис (SaaS)").
class(system(system33), "Класс 1").
external(system(system33)).
parent(system(system33), system(system22)).

system(system2).
name(system(system2), "this is system 2 name").
description(system(system2), "this is system 2 description").
group(system(system2), group(group3)).
ownership(system(system2), "Владеем экземпляром").
class(system(system2), "Класс 2").
internal(system(system2)).
status(system(system2), "Целевая").
change(system(system2), "Планируется").
current(system(system2), "Эскиз").
plan(system(system2), "Промышленная эксплуатация").
level(system(system2), "Business Critical").
performance(system(system2), "performance here").
availability(system(system2), "availablity here").
%rto(system(system2), "24").
rpo(system(system2), "20").
monitoring(system(system2), "monitoring here").
changes(system(system2), "changes here").

system(system3).
name(system(system3), "this is system 2 name").
description(system(system3), "this is system 2 description").
group(system(system3), group(group3)).
ownership(system(system3), "Владеем экземпляром").
class(system(system3), "Класс 3").
internal(system(system3)).
status(system(system3), "Целевая").
change(system(system3), "Планируется").
current(system(system3), "Эскиз").
plan(system(system3), "Промышленная эксплуатация").
level(system(system3), "Business Critical").
performance(system(system3), "performance here").
availability(system(system3), "availablity here").
rto(system(system3), "24").
rpo(system(system3), "20").
monitoring(system(system3), "monitoring here").
changes(system(system3), "changes here").
parent(system(system3), system(system2)).

% Функциональность (Р10)
% ----------------------------------------------------------------------
function(function1).
name(function(function1), "this is function 1 name").
description(function(function1), "this is function 1 description").
target(function(function1), "Целевое").
status(function(function1), "Планируется").
system(function(function1), system(system1)).
system(function(function1), system(system2)).

% Бизнес процессы (Р06)
% ----------------------------------------------------------------------
process(process1).
name(process(process1), "this is process 1 name").
description(process(process1), "this is process 1 description").
use(process(process1), system(system1)).
use(process(process1), product(product1)).
use(process(process1), object(object1)).
use(process(process1), integration(integration1)).

process(process2).
name(process(process2), "this is process 2 name").
description(process(process2), "this is process 2 description").
use(process(process2), system(system2)).
use(process(process2), product(product2)).
use(process(process2), object(object2)).
use(process(process2), integration(integration2)).

% Бизнес объекты (Р07)
% ----------------------------------------------------------------------
object(object1).
name(object(object1), "this is object 1 name").
status(object(object1), "Используется").

object(object2).
name(object(object2), "this is object 2 name").
status(object(object2), "Используется1").

% Объекты данных (Р08)
% ----------------------------------------------------------------------
data(data1).
name(data(data1), "this is data 1 name").
category(data(data1), "Персональные данные").
status(data(data1), "Используется").
system(data(data1), system(system1)).
parent(data(data1), object(object2)).

data(data2).
name(data(data2), "this is data 2 name").
%category(data(data2), "Медицинские данные").
status(data(data2), "Используется").
system(data(data2), system(system2)).

% Интеграционные потоки (Р14)
% ----------------------------------------------------------------------
integration(integration1).
description(integration(integration1), "this is integration1 description").
source(integration(integration1), system(system1)).
destination(integration(integration1), system(system2)).
transmit(integration(integration1), data(data1)).
transmit(integration(integration1), data(data2)).
technology(integration(integration1), "FILE").
mode(integration(integration1), "По расписанию").
%load(integration(integration1), max("100 rps"), avg("10 rps")).
asynch(integration(integration1)).
status(integration(integration1), "Используется").
security(integration(integration1), "SSL").

integration(integration2).
description(integration(integration2), "this is integration1 description").
source(integration(integration2), system(system1)).
destination(integration(integration2), system(system2)).
transmit(integration(integration2), data(data1)).
transmit(integration(integration2), data(data2)).
technology(integration(integration2), "FILE").
mode(integration(integration2), "По расписанию").
load(integration(integration2), max("100 rps"), avg("10 rps")).
asynch(integration(integration2)).
status(integration(integration2), "Используется").
security(integration(integration2), "SSL").

% Технические компоненты (Р16)
% ----------------------------------------------------------------------
component(component1).
system(component(component1), system(system1)).
type(component(component1), "Proxy").
software(component(component1), "SuperProxy").
vendor(component(component1), "MS").
scalability(component(component1), "Горизонтальная").
ha(component(component1), false).
dr(component(component1), type("Active"), level("Полное")).
backup(component(component1), location("ЦОД"), duplicate("ЦОД")).
monitoring(component(component1), "Zabbix").

component(component2).
system(component(component2), system(system1)).
type(component(component2), "Proxy").
software(component(component2), "SuperProxy 2").
vendor(component(component2), "MS").
scalability(component(component2), "Вертикальная").
ha(component(component2), type("Active"), level("Частичное")).
dr(component(component2), type("StandBy"), level("Полное")).
backup(component(component2), location("ЦОД"), duplicate("Offsite")).
monitoring(component(component2), "Zabbix").

% Системы КБ (Р13)
% ----------------------------------------------------------------------
security(security1).
name(security(security1), "this is security 1 name").
description(security(security1), "this is security 1 description").
class(security(security1), "ИБ-Антивирусное ПО").
internal(security(security1)).
status(security(security1), "Используется").

security(security2).
name(security(security2), "this is security 2 name").
description(security(security2), "this is security 2 description").
class(security(security2), "ИБ-Антивирусное ПО2").
status(security(security2), "Используется").

% Технологические сервисы (Р15)
% ----------------------------------------------------------------------
service(service1).
name(service(service1), "this is service 1 name").
description(service(service1), "this is service 1 description").
class(service(service1), "Мониторинг").
internal(service(service1)).
status(service(service1), "Используется").

service(service2).
name(service(service2), "this is service 2 name").
description(service(service2), "this is service 2 description").
class(service(service2), "Удаленный доступ ччч").
status(service(service2), "Используется").


