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




% Load test integration10
% -------------------------------------------
integration(integration10).
description(integration(integration10), "this is integration1 description").
source(integration(integration10), system(system1)).
destination(integration(integration10), system(system2)).
transmit(integration(integration10), data(data1)).
transmit(integration(integration10), data(data2)).
technology(integration(integration10), "FILE").
mode(integration(integration10), "По расписанию").
load(integration(integration10), max("100 rps"), avg("10 rps")).
asynch(integration(integration10)).
status(integration(integration10), "Используется").
security(integration(integration10), "SSL").


% Load test integration11
% -------------------------------------------
integration(integration11).
description(integration(integration11), "this is integration1 description").
source(integration(integration11), system(system1)).
destination(integration(integration11), system(system2)).
transmit(integration(integration11), data(data1)).
transmit(integration(integration11), data(data2)).
technology(integration(integration11), "FILE").
mode(integration(integration11), "По расписанию").
load(integration(integration11), max("100 rps"), avg("10 rps")).
asynch(integration(integration11)).
status(integration(integration11), "Используется").
security(integration(integration11), "SSL").


% Load test integration12
% -------------------------------------------
integration(integration12).
description(integration(integration12), "this is integration1 description").
source(integration(integration12), system(system1)).
destination(integration(integration12), system(system2)).
transmit(integration(integration12), data(data1)).
transmit(integration(integration12), data(data2)).
technology(integration(integration12), "FILE").
mode(integration(integration12), "По расписанию").
load(integration(integration12), max("100 rps"), avg("10 rps")).
asynch(integration(integration12)).
status(integration(integration12), "Используется").
security(integration(integration12), "SSL").


% Load test integration13
% -------------------------------------------
integration(integration13).
description(integration(integration13), "this is integration1 description").
source(integration(integration13), system(system1)).
destination(integration(integration13), system(system2)).
transmit(integration(integration13), data(data1)).
transmit(integration(integration13), data(data2)).
technology(integration(integration13), "FILE").
mode(integration(integration13), "По расписанию").
load(integration(integration13), max("100 rps"), avg("10 rps")).
asynch(integration(integration13)).
status(integration(integration13), "Используется").
security(integration(integration13), "SSL").


% Load test integration14
% -------------------------------------------
integration(integration14).
description(integration(integration14), "this is integration1 description").
source(integration(integration14), system(system1)).
destination(integration(integration14), system(system2)).
transmit(integration(integration14), data(data1)).
transmit(integration(integration14), data(data2)).
technology(integration(integration14), "FILE").
mode(integration(integration14), "По расписанию").
load(integration(integration14), max("100 rps"), avg("10 rps")).
asynch(integration(integration14)).
status(integration(integration14), "Используется").
security(integration(integration14), "SSL").


% Load test integration15
% -------------------------------------------
integration(integration15).
description(integration(integration15), "this is integration1 description").
source(integration(integration15), system(system1)).
destination(integration(integration15), system(system2)).
transmit(integration(integration15), data(data1)).
transmit(integration(integration15), data(data2)).
technology(integration(integration15), "FILE").
mode(integration(integration15), "По расписанию").
load(integration(integration15), max("100 rps"), avg("10 rps")).
asynch(integration(integration15)).
status(integration(integration15), "Используется").
security(integration(integration15), "SSL").


% Load test integration16
% -------------------------------------------
integration(integration16).
description(integration(integration16), "this is integration1 description").
source(integration(integration16), system(system1)).
destination(integration(integration16), system(system2)).
transmit(integration(integration16), data(data1)).
transmit(integration(integration16), data(data2)).
technology(integration(integration16), "FILE").
mode(integration(integration16), "По расписанию").
load(integration(integration16), max("100 rps"), avg("10 rps")).
asynch(integration(integration16)).
status(integration(integration16), "Используется").
security(integration(integration16), "SSL").


% Load test integration17
% -------------------------------------------
integration(integration17).
description(integration(integration17), "this is integration1 description").
source(integration(integration17), system(system1)).
destination(integration(integration17), system(system2)).
transmit(integration(integration17), data(data1)).
transmit(integration(integration17), data(data2)).
technology(integration(integration17), "FILE").
mode(integration(integration17), "По расписанию").
load(integration(integration17), max("100 rps"), avg("10 rps")).
asynch(integration(integration17)).
status(integration(integration17), "Используется").
security(integration(integration17), "SSL").


% Load test integration18
% -------------------------------------------
integration(integration18).
description(integration(integration18), "this is integration1 description").
source(integration(integration18), system(system1)).
destination(integration(integration18), system(system2)).
transmit(integration(integration18), data(data1)).
transmit(integration(integration18), data(data2)).
technology(integration(integration18), "FILE").
mode(integration(integration18), "По расписанию").
load(integration(integration18), max("100 rps"), avg("10 rps")).
asynch(integration(integration18)).
status(integration(integration18), "Используется").
security(integration(integration18), "SSL").


% Load test integration19
% -------------------------------------------
integration(integration19).
description(integration(integration19), "this is integration1 description").
source(integration(integration19), system(system1)).
destination(integration(integration19), system(system2)).
transmit(integration(integration19), data(data1)).
transmit(integration(integration19), data(data2)).
technology(integration(integration19), "FILE").
mode(integration(integration19), "По расписанию").
load(integration(integration19), max("100 rps"), avg("10 rps")).
asynch(integration(integration19)).
status(integration(integration19), "Используется").
security(integration(integration19), "SSL").


% Load test integration20
% -------------------------------------------
integration(integration20).
description(integration(integration20), "this is integration1 description").
source(integration(integration20), system(system1)).
destination(integration(integration20), system(system2)).
transmit(integration(integration20), data(data1)).
transmit(integration(integration20), data(data2)).
technology(integration(integration20), "FILE").
mode(integration(integration20), "По расписанию").
load(integration(integration20), max("100 rps"), avg("10 rps")).
asynch(integration(integration20)).
status(integration(integration20), "Используется").
security(integration(integration20), "SSL").


% Load test integration21
% -------------------------------------------
integration(integration21).
description(integration(integration21), "this is integration1 description").
source(integration(integration21), system(system1)).
destination(integration(integration21), system(system2)).
transmit(integration(integration21), data(data1)).
transmit(integration(integration21), data(data2)).
technology(integration(integration21), "FILE").
mode(integration(integration21), "По расписанию").
load(integration(integration21), max("100 rps"), avg("10 rps")).
asynch(integration(integration21)).
status(integration(integration21), "Используется").
security(integration(integration21), "SSL").


% Load test integration22
% -------------------------------------------
integration(integration22).
description(integration(integration22), "this is integration1 description").
source(integration(integration22), system(system1)).
destination(integration(integration22), system(system2)).
transmit(integration(integration22), data(data1)).
transmit(integration(integration22), data(data2)).
technology(integration(integration22), "FILE").
mode(integration(integration22), "По расписанию").
load(integration(integration22), max("100 rps"), avg("10 rps")).
asynch(integration(integration22)).
status(integration(integration22), "Используется").
security(integration(integration22), "SSL").


% Load test integration23
% -------------------------------------------
integration(integration23).
description(integration(integration23), "this is integration1 description").
source(integration(integration23), system(system1)).
destination(integration(integration23), system(system2)).
transmit(integration(integration23), data(data1)).
transmit(integration(integration23), data(data2)).
technology(integration(integration23), "FILE").
mode(integration(integration23), "По расписанию").
load(integration(integration23), max("100 rps"), avg("10 rps")).
asynch(integration(integration23)).
status(integration(integration23), "Используется").
security(integration(integration23), "SSL").


% Load test integration24
% -------------------------------------------
integration(integration24).
description(integration(integration24), "this is integration1 description").
source(integration(integration24), system(system1)).
destination(integration(integration24), system(system2)).
transmit(integration(integration24), data(data1)).
transmit(integration(integration24), data(data2)).
technology(integration(integration24), "FILE").
mode(integration(integration24), "По расписанию").
load(integration(integration24), max("100 rps"), avg("10 rps")).
asynch(integration(integration24)).
status(integration(integration24), "Используется").
security(integration(integration24), "SSL").


% Load test integration25
% -------------------------------------------
integration(integration25).
description(integration(integration25), "this is integration1 description").
source(integration(integration25), system(system1)).
destination(integration(integration25), system(system2)).
transmit(integration(integration25), data(data1)).
transmit(integration(integration25), data(data2)).
technology(integration(integration25), "FILE").
mode(integration(integration25), "По расписанию").
load(integration(integration25), max("100 rps"), avg("10 rps")).
asynch(integration(integration25)).
status(integration(integration25), "Используется").
security(integration(integration25), "SSL").


% Load test integration26
% -------------------------------------------
integration(integration26).
description(integration(integration26), "this is integration1 description").
source(integration(integration26), system(system1)).
destination(integration(integration26), system(system2)).
transmit(integration(integration26), data(data1)).
transmit(integration(integration26), data(data2)).
technology(integration(integration26), "FILE").
mode(integration(integration26), "По расписанию").
load(integration(integration26), max("100 rps"), avg("10 rps")).
asynch(integration(integration26)).
status(integration(integration26), "Используется").
security(integration(integration26), "SSL").


% Load test integration27
% -------------------------------------------
integration(integration27).
description(integration(integration27), "this is integration1 description").
source(integration(integration27), system(system1)).
destination(integration(integration27), system(system2)).
transmit(integration(integration27), data(data1)).
transmit(integration(integration27), data(data2)).
technology(integration(integration27), "FILE").
mode(integration(integration27), "По расписанию").
load(integration(integration27), max("100 rps"), avg("10 rps")).
asynch(integration(integration27)).
status(integration(integration27), "Используется").
security(integration(integration27), "SSL").


% Load test integration28
% -------------------------------------------
integration(integration28).
description(integration(integration28), "this is integration1 description").
source(integration(integration28), system(system1)).
destination(integration(integration28), system(system2)).
transmit(integration(integration28), data(data1)).
transmit(integration(integration28), data(data2)).
technology(integration(integration28), "FILE").
mode(integration(integration28), "По расписанию").
load(integration(integration28), max("100 rps"), avg("10 rps")).
asynch(integration(integration28)).
status(integration(integration28), "Используется").
security(integration(integration28), "SSL").


% Load test integration29
% -------------------------------------------
integration(integration29).
description(integration(integration29), "this is integration1 description").
source(integration(integration29), system(system1)).
destination(integration(integration29), system(system2)).
transmit(integration(integration29), data(data1)).
transmit(integration(integration29), data(data2)).
technology(integration(integration29), "FILE").
mode(integration(integration29), "По расписанию").
load(integration(integration29), max("100 rps"), avg("10 rps")).
asynch(integration(integration29)).
status(integration(integration29), "Используется").
security(integration(integration29), "SSL").


% Load test integration30
% -------------------------------------------
integration(integration30).
description(integration(integration30), "this is integration1 description").
source(integration(integration30), system(system1)).
destination(integration(integration30), system(system2)).
transmit(integration(integration30), data(data1)).
transmit(integration(integration30), data(data2)).
technology(integration(integration30), "FILE").
mode(integration(integration30), "По расписанию").
load(integration(integration30), max("100 rps"), avg("10 rps")).
asynch(integration(integration30)).
status(integration(integration30), "Используется").
security(integration(integration30), "SSL").


% Load test integration31
% -------------------------------------------
integration(integration31).
description(integration(integration31), "this is integration1 description").
source(integration(integration31), system(system1)).
destination(integration(integration31), system(system2)).
transmit(integration(integration31), data(data1)).
transmit(integration(integration31), data(data2)).
technology(integration(integration31), "FILE").
mode(integration(integration31), "По расписанию").
load(integration(integration31), max("100 rps"), avg("10 rps")).
asynch(integration(integration31)).
status(integration(integration31), "Используется").
security(integration(integration31), "SSL").


% Load test integration32
% -------------------------------------------
integration(integration32).
description(integration(integration32), "this is integration1 description").
source(integration(integration32), system(system1)).
destination(integration(integration32), system(system2)).
transmit(integration(integration32), data(data1)).
transmit(integration(integration32), data(data2)).
technology(integration(integration32), "FILE").
mode(integration(integration32), "По расписанию").
load(integration(integration32), max("100 rps"), avg("10 rps")).
asynch(integration(integration32)).
status(integration(integration32), "Используется").
security(integration(integration32), "SSL").


% Load test integration33
% -------------------------------------------
integration(integration33).
description(integration(integration33), "this is integration1 description").
source(integration(integration33), system(system1)).
destination(integration(integration33), system(system2)).
transmit(integration(integration33), data(data1)).
transmit(integration(integration33), data(data2)).
technology(integration(integration33), "FILE").
mode(integration(integration33), "По расписанию").
load(integration(integration33), max("100 rps"), avg("10 rps")).
asynch(integration(integration33)).
status(integration(integration33), "Используется").
security(integration(integration33), "SSL").


% Load test integration34
% -------------------------------------------
integration(integration34).
description(integration(integration34), "this is integration1 description").
source(integration(integration34), system(system1)).
destination(integration(integration34), system(system2)).
transmit(integration(integration34), data(data1)).
transmit(integration(integration34), data(data2)).
technology(integration(integration34), "FILE").
mode(integration(integration34), "По расписанию").
load(integration(integration34), max("100 rps"), avg("10 rps")).
asynch(integration(integration34)).
status(integration(integration34), "Используется").
security(integration(integration34), "SSL").


% Load test integration35
% -------------------------------------------
integration(integration35).
description(integration(integration35), "this is integration1 description").
source(integration(integration35), system(system1)).
destination(integration(integration35), system(system2)).
transmit(integration(integration35), data(data1)).
transmit(integration(integration35), data(data2)).
technology(integration(integration35), "FILE").
mode(integration(integration35), "По расписанию").
load(integration(integration35), max("100 rps"), avg("10 rps")).
asynch(integration(integration35)).
status(integration(integration35), "Используется").
security(integration(integration35), "SSL").


% Load test integration36
% -------------------------------------------
integration(integration36).
description(integration(integration36), "this is integration1 description").
source(integration(integration36), system(system1)).
destination(integration(integration36), system(system2)).
transmit(integration(integration36), data(data1)).
transmit(integration(integration36), data(data2)).
technology(integration(integration36), "FILE").
mode(integration(integration36), "По расписанию").
load(integration(integration36), max("100 rps"), avg("10 rps")).
asynch(integration(integration36)).
status(integration(integration36), "Используется").
security(integration(integration36), "SSL").


% Load test integration37
% -------------------------------------------
integration(integration37).
description(integration(integration37), "this is integration1 description").
source(integration(integration37), system(system1)).
destination(integration(integration37), system(system2)).
transmit(integration(integration37), data(data1)).
transmit(integration(integration37), data(data2)).
technology(integration(integration37), "FILE").
mode(integration(integration37), "По расписанию").
load(integration(integration37), max("100 rps"), avg("10 rps")).
asynch(integration(integration37)).
status(integration(integration37), "Используется").
security(integration(integration37), "SSL").


% Load test integration38
% -------------------------------------------
integration(integration38).
description(integration(integration38), "this is integration1 description").
source(integration(integration38), system(system1)).
destination(integration(integration38), system(system2)).
transmit(integration(integration38), data(data1)).
transmit(integration(integration38), data(data2)).
technology(integration(integration38), "FILE").
mode(integration(integration38), "По расписанию").
load(integration(integration38), max("100 rps"), avg("10 rps")).
asynch(integration(integration38)).
status(integration(integration38), "Используется").
security(integration(integration38), "SSL").


% Load test integration39
% -------------------------------------------
integration(integration39).
description(integration(integration39), "this is integration1 description").
source(integration(integration39), system(system1)).
destination(integration(integration39), system(system2)).
transmit(integration(integration39), data(data1)).
transmit(integration(integration39), data(data2)).
technology(integration(integration39), "FILE").
mode(integration(integration39), "По расписанию").
load(integration(integration39), max("100 rps"), avg("10 rps")).
asynch(integration(integration39)).
status(integration(integration39), "Используется").
security(integration(integration39), "SSL").


% Load test integration40
% -------------------------------------------
integration(integration40).
description(integration(integration40), "this is integration1 description").
source(integration(integration40), system(system1)).
destination(integration(integration40), system(system2)).
transmit(integration(integration40), data(data1)).
transmit(integration(integration40), data(data2)).
technology(integration(integration40), "FILE").
mode(integration(integration40), "По расписанию").
load(integration(integration40), max("100 rps"), avg("10 rps")).
asynch(integration(integration40)).
status(integration(integration40), "Используется").
security(integration(integration40), "SSL").


% Load test integration41
% -------------------------------------------
integration(integration41).
description(integration(integration41), "this is integration1 description").
source(integration(integration41), system(system1)).
destination(integration(integration41), system(system2)).
transmit(integration(integration41), data(data1)).
transmit(integration(integration41), data(data2)).
technology(integration(integration41), "FILE").
mode(integration(integration41), "По расписанию").
load(integration(integration41), max("100 rps"), avg("10 rps")).
asynch(integration(integration41)).
status(integration(integration41), "Используется").
security(integration(integration41), "SSL").


% Load test integration42
% -------------------------------------------
integration(integration42).
description(integration(integration42), "this is integration1 description").
source(integration(integration42), system(system1)).
destination(integration(integration42), system(system2)).
transmit(integration(integration42), data(data1)).
transmit(integration(integration42), data(data2)).
technology(integration(integration42), "FILE").
mode(integration(integration42), "По расписанию").
load(integration(integration42), max("100 rps"), avg("10 rps")).
asynch(integration(integration42)).
status(integration(integration42), "Используется").
security(integration(integration42), "SSL").


% Load test integration43
% -------------------------------------------
integration(integration43).
description(integration(integration43), "this is integration1 description").
source(integration(integration43), system(system1)).
destination(integration(integration43), system(system2)).
transmit(integration(integration43), data(data1)).
transmit(integration(integration43), data(data2)).
technology(integration(integration43), "FILE").
mode(integration(integration43), "По расписанию").
load(integration(integration43), max("100 rps"), avg("10 rps")).
asynch(integration(integration43)).
status(integration(integration43), "Используется").
security(integration(integration43), "SSL").


% Load test integration44
% -------------------------------------------
integration(integration44).
description(integration(integration44), "this is integration1 description").
source(integration(integration44), system(system1)).
destination(integration(integration44), system(system2)).
transmit(integration(integration44), data(data1)).
transmit(integration(integration44), data(data2)).
technology(integration(integration44), "FILE").
mode(integration(integration44), "По расписанию").
load(integration(integration44), max("100 rps"), avg("10 rps")).
asynch(integration(integration44)).
status(integration(integration44), "Используется").
security(integration(integration44), "SSL").


% Load test integration45
% -------------------------------------------
integration(integration45).
description(integration(integration45), "this is integration1 description").
source(integration(integration45), system(system1)).
destination(integration(integration45), system(system2)).
transmit(integration(integration45), data(data1)).
transmit(integration(integration45), data(data2)).
technology(integration(integration45), "FILE").
mode(integration(integration45), "По расписанию").
load(integration(integration45), max("100 rps"), avg("10 rps")).
asynch(integration(integration45)).
status(integration(integration45), "Используется").
security(integration(integration45), "SSL").


% Load test integration46
% -------------------------------------------
integration(integration46).
description(integration(integration46), "this is integration1 description").
source(integration(integration46), system(system1)).
destination(integration(integration46), system(system2)).
transmit(integration(integration46), data(data1)).
transmit(integration(integration46), data(data2)).
technology(integration(integration46), "FILE").
mode(integration(integration46), "По расписанию").
load(integration(integration46), max("100 rps"), avg("10 rps")).
asynch(integration(integration46)).
status(integration(integration46), "Используется").
security(integration(integration46), "SSL").


% Load test integration47
% -------------------------------------------
integration(integration47).
description(integration(integration47), "this is integration1 description").
source(integration(integration47), system(system1)).
destination(integration(integration47), system(system2)).
transmit(integration(integration47), data(data1)).
transmit(integration(integration47), data(data2)).
technology(integration(integration47), "FILE").
mode(integration(integration47), "По расписанию").
load(integration(integration47), max("100 rps"), avg("10 rps")).
asynch(integration(integration47)).
status(integration(integration47), "Используется").
security(integration(integration47), "SSL").


% Load test integration48
% -------------------------------------------
integration(integration48).
description(integration(integration48), "this is integration1 description").
source(integration(integration48), system(system1)).
destination(integration(integration48), system(system2)).
transmit(integration(integration48), data(data1)).
transmit(integration(integration48), data(data2)).
technology(integration(integration48), "FILE").
mode(integration(integration48), "По расписанию").
load(integration(integration48), max("100 rps"), avg("10 rps")).
asynch(integration(integration48)).
status(integration(integration48), "Используется").
security(integration(integration48), "SSL").


% Load test integration49
% -------------------------------------------
integration(integration49).
description(integration(integration49), "this is integration1 description").
source(integration(integration49), system(system1)).
destination(integration(integration49), system(system2)).
transmit(integration(integration49), data(data1)).
transmit(integration(integration49), data(data2)).
technology(integration(integration49), "FILE").
mode(integration(integration49), "По расписанию").
load(integration(integration49), max("100 rps"), avg("10 rps")).
asynch(integration(integration49)).
status(integration(integration49), "Используется").
security(integration(integration49), "SSL").


% Load test integration50
% -------------------------------------------
integration(integration50).
description(integration(integration50), "this is integration1 description").
source(integration(integration50), system(system1)).
destination(integration(integration50), system(system2)).
transmit(integration(integration50), data(data1)).
transmit(integration(integration50), data(data2)).
technology(integration(integration50), "FILE").
mode(integration(integration50), "По расписанию").
load(integration(integration50), max("100 rps"), avg("10 rps")).
asynch(integration(integration50)).
status(integration(integration50), "Используется").
security(integration(integration50), "SSL").


% Load test integration51
% -------------------------------------------
integration(integration51).
description(integration(integration51), "this is integration1 description").
source(integration(integration51), system(system1)).
destination(integration(integration51), system(system2)).
transmit(integration(integration51), data(data1)).
transmit(integration(integration51), data(data2)).
technology(integration(integration51), "FILE").
mode(integration(integration51), "По расписанию").
load(integration(integration51), max("100 rps"), avg("10 rps")).
asynch(integration(integration51)).
status(integration(integration51), "Используется").
security(integration(integration51), "SSL").


% Load test integration52
% -------------------------------------------
integration(integration52).
description(integration(integration52), "this is integration1 description").
source(integration(integration52), system(system1)).
destination(integration(integration52), system(system2)).
transmit(integration(integration52), data(data1)).
transmit(integration(integration52), data(data2)).
technology(integration(integration52), "FILE").
mode(integration(integration52), "По расписанию").
load(integration(integration52), max("100 rps"), avg("10 rps")).
asynch(integration(integration52)).
status(integration(integration52), "Используется").
security(integration(integration52), "SSL").


% Load test integration53
% -------------------------------------------
integration(integration53).
description(integration(integration53), "this is integration1 description").
source(integration(integration53), system(system1)).
destination(integration(integration53), system(system2)).
transmit(integration(integration53), data(data1)).
transmit(integration(integration53), data(data2)).
technology(integration(integration53), "FILE").
mode(integration(integration53), "По расписанию").
load(integration(integration53), max("100 rps"), avg("10 rps")).
asynch(integration(integration53)).
status(integration(integration53), "Используется").
security(integration(integration53), "SSL").


% Load test integration54
% -------------------------------------------
integration(integration54).
description(integration(integration54), "this is integration1 description").
source(integration(integration54), system(system1)).
destination(integration(integration54), system(system2)).
transmit(integration(integration54), data(data1)).
transmit(integration(integration54), data(data2)).
technology(integration(integration54), "FILE").
mode(integration(integration54), "По расписанию").
load(integration(integration54), max("100 rps"), avg("10 rps")).
asynch(integration(integration54)).
status(integration(integration54), "Используется").
security(integration(integration54), "SSL").


% Load test integration55
% -------------------------------------------
integration(integration55).
description(integration(integration55), "this is integration1 description").
source(integration(integration55), system(system1)).
destination(integration(integration55), system(system2)).
transmit(integration(integration55), data(data1)).
transmit(integration(integration55), data(data2)).
technology(integration(integration55), "FILE").
mode(integration(integration55), "По расписанию").
load(integration(integration55), max("100 rps"), avg("10 rps")).
asynch(integration(integration55)).
status(integration(integration55), "Используется").
security(integration(integration55), "SSL").


% Load test integration56
% -------------------------------------------
integration(integration56).
description(integration(integration56), "this is integration1 description").
source(integration(integration56), system(system1)).
destination(integration(integration56), system(system2)).
transmit(integration(integration56), data(data1)).
transmit(integration(integration56), data(data2)).
technology(integration(integration56), "FILE").
mode(integration(integration56), "По расписанию").
load(integration(integration56), max("100 rps"), avg("10 rps")).
asynch(integration(integration56)).
status(integration(integration56), "Используется").
security(integration(integration56), "SSL").


% Load test integration57
% -------------------------------------------
integration(integration57).
description(integration(integration57), "this is integration1 description").
source(integration(integration57), system(system1)).
destination(integration(integration57), system(system2)).
transmit(integration(integration57), data(data1)).
transmit(integration(integration57), data(data2)).
technology(integration(integration57), "FILE").
mode(integration(integration57), "По расписанию").
load(integration(integration57), max("100 rps"), avg("10 rps")).
asynch(integration(integration57)).
status(integration(integration57), "Используется").
security(integration(integration57), "SSL").


% Load test integration58
% -------------------------------------------
integration(integration58).
description(integration(integration58), "this is integration1 description").
source(integration(integration58), system(system1)).
destination(integration(integration58), system(system2)).
transmit(integration(integration58), data(data1)).
transmit(integration(integration58), data(data2)).
technology(integration(integration58), "FILE").
mode(integration(integration58), "По расписанию").
load(integration(integration58), max("100 rps"), avg("10 rps")).
asynch(integration(integration58)).
status(integration(integration58), "Используется").
security(integration(integration58), "SSL").


% Load test integration59
% -------------------------------------------
integration(integration59).
description(integration(integration59), "this is integration1 description").
source(integration(integration59), system(system1)).
destination(integration(integration59), system(system2)).
transmit(integration(integration59), data(data1)).
transmit(integration(integration59), data(data2)).
technology(integration(integration59), "FILE").
mode(integration(integration59), "По расписанию").
load(integration(integration59), max("100 rps"), avg("10 rps")).
asynch(integration(integration59)).
status(integration(integration59), "Используется").
security(integration(integration59), "SSL").


% Load test integration60
% -------------------------------------------
integration(integration60).
description(integration(integration60), "this is integration1 description").
source(integration(integration60), system(system1)).
destination(integration(integration60), system(system2)).
transmit(integration(integration60), data(data1)).
transmit(integration(integration60), data(data2)).
technology(integration(integration60), "FILE").
mode(integration(integration60), "По расписанию").
load(integration(integration60), max("100 rps"), avg("10 rps")).
asynch(integration(integration60)).
status(integration(integration60), "Используется").
security(integration(integration60), "SSL").


% Load test integration61
% -------------------------------------------
integration(integration61).
description(integration(integration61), "this is integration1 description").
source(integration(integration61), system(system1)).
destination(integration(integration61), system(system2)).
transmit(integration(integration61), data(data1)).
transmit(integration(integration61), data(data2)).
technology(integration(integration61), "FILE").
mode(integration(integration61), "По расписанию").
load(integration(integration61), max("100 rps"), avg("10 rps")).
asynch(integration(integration61)).
status(integration(integration61), "Используется").
security(integration(integration61), "SSL").


% Load test integration62
% -------------------------------------------
integration(integration62).
description(integration(integration62), "this is integration1 description").
source(integration(integration62), system(system1)).
destination(integration(integration62), system(system2)).
transmit(integration(integration62), data(data1)).
transmit(integration(integration62), data(data2)).
technology(integration(integration62), "FILE").
mode(integration(integration62), "По расписанию").
load(integration(integration62), max("100 rps"), avg("10 rps")).
asynch(integration(integration62)).
status(integration(integration62), "Используется").
security(integration(integration62), "SSL").


% Load test integration63
% -------------------------------------------
integration(integration63).
description(integration(integration63), "this is integration1 description").
source(integration(integration63), system(system1)).
destination(integration(integration63), system(system2)).
transmit(integration(integration63), data(data1)).
transmit(integration(integration63), data(data2)).
technology(integration(integration63), "FILE").
mode(integration(integration63), "По расписанию").
load(integration(integration63), max("100 rps"), avg("10 rps")).
asynch(integration(integration63)).
status(integration(integration63), "Используется").
security(integration(integration63), "SSL").


% Load test integration64
% -------------------------------------------
integration(integration64).
description(integration(integration64), "this is integration1 description").
source(integration(integration64), system(system1)).
destination(integration(integration64), system(system2)).
transmit(integration(integration64), data(data1)).
transmit(integration(integration64), data(data2)).
technology(integration(integration64), "FILE").
mode(integration(integration64), "По расписанию").
load(integration(integration64), max("100 rps"), avg("10 rps")).
asynch(integration(integration64)).
status(integration(integration64), "Используется").
security(integration(integration64), "SSL").


% Load test integration65
% -------------------------------------------
integration(integration65).
description(integration(integration65), "this is integration1 description").
source(integration(integration65), system(system1)).
destination(integration(integration65), system(system2)).
transmit(integration(integration65), data(data1)).
transmit(integration(integration65), data(data2)).
technology(integration(integration65), "FILE").
mode(integration(integration65), "По расписанию").
load(integration(integration65), max("100 rps"), avg("10 rps")).
asynch(integration(integration65)).
status(integration(integration65), "Используется").
security(integration(integration65), "SSL").


% Load test integration66
% -------------------------------------------
integration(integration66).
description(integration(integration66), "this is integration1 description").
source(integration(integration66), system(system1)).
destination(integration(integration66), system(system2)).
transmit(integration(integration66), data(data1)).
transmit(integration(integration66), data(data2)).
technology(integration(integration66), "FILE").
mode(integration(integration66), "По расписанию").
load(integration(integration66), max("100 rps"), avg("10 rps")).
asynch(integration(integration66)).
status(integration(integration66), "Используется").
security(integration(integration66), "SSL").


% Load test integration67
% -------------------------------------------
integration(integration67).
description(integration(integration67), "this is integration1 description").
source(integration(integration67), system(system1)).
destination(integration(integration67), system(system2)).
transmit(integration(integration67), data(data1)).
transmit(integration(integration67), data(data2)).
technology(integration(integration67), "FILE").
mode(integration(integration67), "По расписанию").
load(integration(integration67), max("100 rps"), avg("10 rps")).
asynch(integration(integration67)).
status(integration(integration67), "Используется").
security(integration(integration67), "SSL").


% Load test integration68
% -------------------------------------------
integration(integration68).
description(integration(integration68), "this is integration1 description").
source(integration(integration68), system(system1)).
destination(integration(integration68), system(system2)).
transmit(integration(integration68), data(data1)).
transmit(integration(integration68), data(data2)).
technology(integration(integration68), "FILE").
mode(integration(integration68), "По расписанию").
load(integration(integration68), max("100 rps"), avg("10 rps")).
asynch(integration(integration68)).
status(integration(integration68), "Используется").
security(integration(integration68), "SSL").


% Load test integration69
% -------------------------------------------
integration(integration69).
description(integration(integration69), "this is integration1 description").
source(integration(integration69), system(system1)).
destination(integration(integration69), system(system2)).
transmit(integration(integration69), data(data1)).
transmit(integration(integration69), data(data2)).
technology(integration(integration69), "FILE").
mode(integration(integration69), "По расписанию").
load(integration(integration69), max("100 rps"), avg("10 rps")).
asynch(integration(integration69)).
status(integration(integration69), "Используется").
security(integration(integration69), "SSL").


% Load test integration70
% -------------------------------------------
integration(integration70).
description(integration(integration70), "this is integration1 description").
source(integration(integration70), system(system1)).
destination(integration(integration70), system(system2)).
transmit(integration(integration70), data(data1)).
transmit(integration(integration70), data(data2)).
technology(integration(integration70), "FILE").
mode(integration(integration70), "По расписанию").
load(integration(integration70), max("100 rps"), avg("10 rps")).
asynch(integration(integration70)).
status(integration(integration70), "Используется").
security(integration(integration70), "SSL").


% Load test integration71
% -------------------------------------------
integration(integration71).
description(integration(integration71), "this is integration1 description").
source(integration(integration71), system(system1)).
destination(integration(integration71), system(system2)).
transmit(integration(integration71), data(data1)).
transmit(integration(integration71), data(data2)).
technology(integration(integration71), "FILE").
mode(integration(integration71), "По расписанию").
load(integration(integration71), max("100 rps"), avg("10 rps")).
asynch(integration(integration71)).
status(integration(integration71), "Используется").
security(integration(integration71), "SSL").


% Load test integration72
% -------------------------------------------
integration(integration72).
description(integration(integration72), "this is integration1 description").
source(integration(integration72), system(system1)).
destination(integration(integration72), system(system2)).
transmit(integration(integration72), data(data1)).
transmit(integration(integration72), data(data2)).
technology(integration(integration72), "FILE").
mode(integration(integration72), "По расписанию").
load(integration(integration72), max("100 rps"), avg("10 rps")).
asynch(integration(integration72)).
status(integration(integration72), "Используется").
security(integration(integration72), "SSL").


% Load test integration73
% -------------------------------------------
integration(integration73).
description(integration(integration73), "this is integration1 description").
source(integration(integration73), system(system1)).
destination(integration(integration73), system(system2)).
transmit(integration(integration73), data(data1)).
transmit(integration(integration73), data(data2)).
technology(integration(integration73), "FILE").
mode(integration(integration73), "По расписанию").
load(integration(integration73), max("100 rps"), avg("10 rps")).
asynch(integration(integration73)).
status(integration(integration73), "Используется").
security(integration(integration73), "SSL").


% Load test integration74
% -------------------------------------------
integration(integration74).
description(integration(integration74), "this is integration1 description").
source(integration(integration74), system(system1)).
destination(integration(integration74), system(system2)).
transmit(integration(integration74), data(data1)).
transmit(integration(integration74), data(data2)).
technology(integration(integration74), "FILE").
mode(integration(integration74), "По расписанию").
load(integration(integration74), max("100 rps"), avg("10 rps")).
asynch(integration(integration74)).
status(integration(integration74), "Используется").
security(integration(integration74), "SSL").


% Load test integration75
% -------------------------------------------
integration(integration75).
description(integration(integration75), "this is integration1 description").
source(integration(integration75), system(system1)).
destination(integration(integration75), system(system2)).
transmit(integration(integration75), data(data1)).
transmit(integration(integration75), data(data2)).
technology(integration(integration75), "FILE").
mode(integration(integration75), "По расписанию").
load(integration(integration75), max("100 rps"), avg("10 rps")).
asynch(integration(integration75)).
status(integration(integration75), "Используется").
security(integration(integration75), "SSL").


% Load test integration76
% -------------------------------------------
integration(integration76).
description(integration(integration76), "this is integration1 description").
source(integration(integration76), system(system1)).
destination(integration(integration76), system(system2)).
transmit(integration(integration76), data(data1)).
transmit(integration(integration76), data(data2)).
technology(integration(integration76), "FILE").
mode(integration(integration76), "По расписанию").
load(integration(integration76), max("100 rps"), avg("10 rps")).
asynch(integration(integration76)).
status(integration(integration76), "Используется").
security(integration(integration76), "SSL").


% Load test integration77
% -------------------------------------------
integration(integration77).
description(integration(integration77), "this is integration1 description").
source(integration(integration77), system(system1)).
destination(integration(integration77), system(system2)).
transmit(integration(integration77), data(data1)).
transmit(integration(integration77), data(data2)).
technology(integration(integration77), "FILE").
mode(integration(integration77), "По расписанию").
load(integration(integration77), max("100 rps"), avg("10 rps")).
asynch(integration(integration77)).
status(integration(integration77), "Используется").
security(integration(integration77), "SSL").


% Load test integration78
% -------------------------------------------
integration(integration78).
description(integration(integration78), "this is integration1 description").
source(integration(integration78), system(system1)).
destination(integration(integration78), system(system2)).
transmit(integration(integration78), data(data1)).
transmit(integration(integration78), data(data2)).
technology(integration(integration78), "FILE").
mode(integration(integration78), "По расписанию").
load(integration(integration78), max("100 rps"), avg("10 rps")).
asynch(integration(integration78)).
status(integration(integration78), "Используется").
security(integration(integration78), "SSL").


% Load test integration79
% -------------------------------------------
integration(integration79).
description(integration(integration79), "this is integration1 description").
source(integration(integration79), system(system1)).
destination(integration(integration79), system(system2)).
transmit(integration(integration79), data(data1)).
transmit(integration(integration79), data(data2)).
technology(integration(integration79), "FILE").
mode(integration(integration79), "По расписанию").
load(integration(integration79), max("100 rps"), avg("10 rps")).
asynch(integration(integration79)).
status(integration(integration79), "Используется").
security(integration(integration79), "SSL").


% Load test integration80
% -------------------------------------------
integration(integration80).
description(integration(integration80), "this is integration1 description").
source(integration(integration80), system(system1)).
destination(integration(integration80), system(system2)).
transmit(integration(integration80), data(data1)).
transmit(integration(integration80), data(data2)).
technology(integration(integration80), "FILE").
mode(integration(integration80), "По расписанию").
load(integration(integration80), max("100 rps"), avg("10 rps")).
asynch(integration(integration80)).
status(integration(integration80), "Используется").
security(integration(integration80), "SSL").


% Load test integration81
% -------------------------------------------
integration(integration81).
description(integration(integration81), "this is integration1 description").
source(integration(integration81), system(system1)).
destination(integration(integration81), system(system2)).
transmit(integration(integration81), data(data1)).
transmit(integration(integration81), data(data2)).
technology(integration(integration81), "FILE").
mode(integration(integration81), "По расписанию").
load(integration(integration81), max("100 rps"), avg("10 rps")).
asynch(integration(integration81)).
status(integration(integration81), "Используется").
security(integration(integration81), "SSL").


% Load test integration82
% -------------------------------------------
integration(integration82).
description(integration(integration82), "this is integration1 description").
source(integration(integration82), system(system1)).
destination(integration(integration82), system(system2)).
transmit(integration(integration82), data(data1)).
transmit(integration(integration82), data(data2)).
technology(integration(integration82), "FILE").
mode(integration(integration82), "По расписанию").
load(integration(integration82), max("100 rps"), avg("10 rps")).
asynch(integration(integration82)).
status(integration(integration82), "Используется").
security(integration(integration82), "SSL").


% Load test integration83
% -------------------------------------------
integration(integration83).
description(integration(integration83), "this is integration1 description").
source(integration(integration83), system(system1)).
destination(integration(integration83), system(system2)).
transmit(integration(integration83), data(data1)).
transmit(integration(integration83), data(data2)).
technology(integration(integration83), "FILE").
mode(integration(integration83), "По расписанию").
load(integration(integration83), max("100 rps"), avg("10 rps")).
asynch(integration(integration83)).
status(integration(integration83), "Используется").
security(integration(integration83), "SSL").


% Load test integration84
% -------------------------------------------
integration(integration84).
description(integration(integration84), "this is integration1 description").
source(integration(integration84), system(system1)).
destination(integration(integration84), system(system2)).
transmit(integration(integration84), data(data1)).
transmit(integration(integration84), data(data2)).
technology(integration(integration84), "FILE").
mode(integration(integration84), "По расписанию").
load(integration(integration84), max("100 rps"), avg("10 rps")).
asynch(integration(integration84)).
status(integration(integration84), "Используется").
security(integration(integration84), "SSL").


% Load test integration85
% -------------------------------------------
integration(integration85).
description(integration(integration85), "this is integration1 description").
source(integration(integration85), system(system1)).
destination(integration(integration85), system(system2)).
transmit(integration(integration85), data(data1)).
transmit(integration(integration85), data(data2)).
technology(integration(integration85), "FILE").
mode(integration(integration85), "По расписанию").
load(integration(integration85), max("100 rps"), avg("10 rps")).
asynch(integration(integration85)).
status(integration(integration85), "Используется").
security(integration(integration85), "SSL").


% Load test integration86
% -------------------------------------------
integration(integration86).
description(integration(integration86), "this is integration1 description").
source(integration(integration86), system(system1)).
destination(integration(integration86), system(system2)).
transmit(integration(integration86), data(data1)).
transmit(integration(integration86), data(data2)).
technology(integration(integration86), "FILE").
mode(integration(integration86), "По расписанию").
load(integration(integration86), max("100 rps"), avg("10 rps")).
asynch(integration(integration86)).
status(integration(integration86), "Используется").
security(integration(integration86), "SSL").


% Load test integration87
% -------------------------------------------
integration(integration87).
description(integration(integration87), "this is integration1 description").
source(integration(integration87), system(system1)).
destination(integration(integration87), system(system2)).
transmit(integration(integration87), data(data1)).
transmit(integration(integration87), data(data2)).
technology(integration(integration87), "FILE").
mode(integration(integration87), "По расписанию").
load(integration(integration87), max("100 rps"), avg("10 rps")).
asynch(integration(integration87)).
status(integration(integration87), "Используется").
security(integration(integration87), "SSL").


% Load test integration88
% -------------------------------------------
integration(integration88).
description(integration(integration88), "this is integration1 description").
source(integration(integration88), system(system1)).
destination(integration(integration88), system(system2)).
transmit(integration(integration88), data(data1)).
transmit(integration(integration88), data(data2)).
technology(integration(integration88), "FILE").
mode(integration(integration88), "По расписанию").
load(integration(integration88), max("100 rps"), avg("10 rps")).
asynch(integration(integration88)).
status(integration(integration88), "Используется").
security(integration(integration88), "SSL").


% Load test integration89
% -------------------------------------------
integration(integration89).
description(integration(integration89), "this is integration1 description").
source(integration(integration89), system(system1)).
destination(integration(integration89), system(system2)).
transmit(integration(integration89), data(data1)).
transmit(integration(integration89), data(data2)).
technology(integration(integration89), "FILE").
mode(integration(integration89), "По расписанию").
load(integration(integration89), max("100 rps"), avg("10 rps")).
asynch(integration(integration89)).
status(integration(integration89), "Используется").
security(integration(integration89), "SSL").


% Load test integration90
% -------------------------------------------
integration(integration90).
description(integration(integration90), "this is integration1 description").
source(integration(integration90), system(system1)).
destination(integration(integration90), system(system2)).
transmit(integration(integration90), data(data1)).
transmit(integration(integration90), data(data2)).
technology(integration(integration90), "FILE").
mode(integration(integration90), "По расписанию").
load(integration(integration90), max("100 rps"), avg("10 rps")).
asynch(integration(integration90)).
status(integration(integration90), "Используется").
security(integration(integration90), "SSL").


% Load test integration91
% -------------------------------------------
integration(integration91).
description(integration(integration91), "this is integration1 description").
source(integration(integration91), system(system1)).
destination(integration(integration91), system(system2)).
transmit(integration(integration91), data(data1)).
transmit(integration(integration91), data(data2)).
technology(integration(integration91), "FILE").
mode(integration(integration91), "По расписанию").
load(integration(integration91), max("100 rps"), avg("10 rps")).
asynch(integration(integration91)).
status(integration(integration91), "Используется").
security(integration(integration91), "SSL").


% Load test integration92
% -------------------------------------------
integration(integration92).
description(integration(integration92), "this is integration1 description").
source(integration(integration92), system(system1)).
destination(integration(integration92), system(system2)).
transmit(integration(integration92), data(data1)).
transmit(integration(integration92), data(data2)).
technology(integration(integration92), "FILE").
mode(integration(integration92), "По расписанию").
load(integration(integration92), max("100 rps"), avg("10 rps")).
asynch(integration(integration92)).
status(integration(integration92), "Используется").
security(integration(integration92), "SSL").


% Load test integration93
% -------------------------------------------
integration(integration93).
description(integration(integration93), "this is integration1 description").
source(integration(integration93), system(system1)).
destination(integration(integration93), system(system2)).
transmit(integration(integration93), data(data1)).
transmit(integration(integration93), data(data2)).
technology(integration(integration93), "FILE").
mode(integration(integration93), "По расписанию").
load(integration(integration93), max("100 rps"), avg("10 rps")).
asynch(integration(integration93)).
status(integration(integration93), "Используется").
security(integration(integration93), "SSL").


% Load test integration94
% -------------------------------------------
integration(integration94).
description(integration(integration94), "this is integration1 description").
source(integration(integration94), system(system1)).
destination(integration(integration94), system(system2)).
transmit(integration(integration94), data(data1)).
transmit(integration(integration94), data(data2)).
technology(integration(integration94), "FILE").
mode(integration(integration94), "По расписанию").
load(integration(integration94), max("100 rps"), avg("10 rps")).
asynch(integration(integration94)).
status(integration(integration94), "Используется").
security(integration(integration94), "SSL").


% Load test integration95
% -------------------------------------------
integration(integration95).
description(integration(integration95), "this is integration1 description").
source(integration(integration95), system(system1)).
destination(integration(integration95), system(system2)).
transmit(integration(integration95), data(data1)).
transmit(integration(integration95), data(data2)).
technology(integration(integration95), "FILE").
mode(integration(integration95), "По расписанию").
load(integration(integration95), max("100 rps"), avg("10 rps")).
asynch(integration(integration95)).
status(integration(integration95), "Используется").
security(integration(integration95), "SSL").


% Load test integration96
% -------------------------------------------
integration(integration96).
description(integration(integration96), "this is integration1 description").
source(integration(integration96), system(system1)).
destination(integration(integration96), system(system2)).
transmit(integration(integration96), data(data1)).
transmit(integration(integration96), data(data2)).
technology(integration(integration96), "FILE").
mode(integration(integration96), "По расписанию").
load(integration(integration96), max("100 rps"), avg("10 rps")).
asynch(integration(integration96)).
status(integration(integration96), "Используется").
security(integration(integration96), "SSL").


% Load test integration97
% -------------------------------------------
integration(integration97).
description(integration(integration97), "this is integration1 description").
source(integration(integration97), system(system1)).
destination(integration(integration97), system(system2)).
transmit(integration(integration97), data(data1)).
transmit(integration(integration97), data(data2)).
technology(integration(integration97), "FILE").
mode(integration(integration97), "По расписанию").
load(integration(integration97), max("100 rps"), avg("10 rps")).
asynch(integration(integration97)).
status(integration(integration97), "Используется").
security(integration(integration97), "SSL").


% Load test integration98
% -------------------------------------------
integration(integration98).
description(integration(integration98), "this is integration1 description").
source(integration(integration98), system(system1)).
destination(integration(integration98), system(system2)).
transmit(integration(integration98), data(data1)).
transmit(integration(integration98), data(data2)).
technology(integration(integration98), "FILE").
mode(integration(integration98), "По расписанию").
load(integration(integration98), max("100 rps"), avg("10 rps")).
asynch(integration(integration98)).
status(integration(integration98), "Используется").
security(integration(integration98), "SSL").


% Load test integration99
% -------------------------------------------
integration(integration99).
description(integration(integration99), "this is integration1 description").
source(integration(integration99), system(system1)).
destination(integration(integration99), system(system2)).
transmit(integration(integration99), data(data1)).
transmit(integration(integration99), data(data2)).
technology(integration(integration99), "FILE").
mode(integration(integration99), "По расписанию").
load(integration(integration99), max("100 rps"), avg("10 rps")).
asynch(integration(integration99)).
status(integration(integration99), "Используется").
security(integration(integration99), "SSL").


% Load test integration100
% -------------------------------------------
integration(integration100).
description(integration(integration100), "this is integration1 description").
source(integration(integration100), system(system1)).
destination(integration(integration100), system(system2)).
transmit(integration(integration100), data(data1)).
transmit(integration(integration100), data(data2)).
technology(integration(integration100), "FILE").
mode(integration(integration100), "По расписанию").
load(integration(integration100), max("100 rps"), avg("10 rps")).
asynch(integration(integration100)).
status(integration(integration100), "Используется").
security(integration(integration100), "SSL").


% Load test integration101
% -------------------------------------------
integration(integration101).
description(integration(integration101), "this is integration1 description").
source(integration(integration101), system(system1)).
destination(integration(integration101), system(system2)).
transmit(integration(integration101), data(data1)).
transmit(integration(integration101), data(data2)).
technology(integration(integration101), "FILE").
mode(integration(integration101), "По расписанию").
load(integration(integration101), max("100 rps"), avg("10 rps")).
asynch(integration(integration101)).
status(integration(integration101), "Используется").
security(integration(integration101), "SSL").


% Load test integration102
% -------------------------------------------
integration(integration102).
description(integration(integration102), "this is integration1 description").
source(integration(integration102), system(system1)).
destination(integration(integration102), system(system2)).
transmit(integration(integration102), data(data1)).
transmit(integration(integration102), data(data2)).
technology(integration(integration102), "FILE").
mode(integration(integration102), "По расписанию").
load(integration(integration102), max("100 rps"), avg("10 rps")).
asynch(integration(integration102)).
status(integration(integration102), "Используется").
security(integration(integration102), "SSL").


% Load test integration103
% -------------------------------------------
integration(integration103).
description(integration(integration103), "this is integration1 description").
source(integration(integration103), system(system1)).
destination(integration(integration103), system(system2)).
transmit(integration(integration103), data(data1)).
transmit(integration(integration103), data(data2)).
technology(integration(integration103), "FILE").
mode(integration(integration103), "По расписанию").
load(integration(integration103), max("100 rps"), avg("10 rps")).
asynch(integration(integration103)).
status(integration(integration103), "Используется").
security(integration(integration103), "SSL").


% Load test integration104
% -------------------------------------------
integration(integration104).
description(integration(integration104), "this is integration1 description").
source(integration(integration104), system(system1)).
destination(integration(integration104), system(system2)).
transmit(integration(integration104), data(data1)).
transmit(integration(integration104), data(data2)).
technology(integration(integration104), "FILE").
mode(integration(integration104), "По расписанию").
load(integration(integration104), max("100 rps"), avg("10 rps")).
asynch(integration(integration104)).
status(integration(integration104), "Используется").
security(integration(integration104), "SSL").


% Load test integration105
% -------------------------------------------
integration(integration105).
description(integration(integration105), "this is integration1 description").
source(integration(integration105), system(system1)).
destination(integration(integration105), system(system2)).
transmit(integration(integration105), data(data1)).
transmit(integration(integration105), data(data2)).
technology(integration(integration105), "FILE").
mode(integration(integration105), "По расписанию").
load(integration(integration105), max("100 rps"), avg("10 rps")).
asynch(integration(integration105)).
status(integration(integration105), "Используется").
security(integration(integration105), "SSL").


% Load test integration106
% -------------------------------------------
integration(integration106).
description(integration(integration106), "this is integration1 description").
source(integration(integration106), system(system1)).
destination(integration(integration106), system(system2)).
transmit(integration(integration106), data(data1)).
transmit(integration(integration106), data(data2)).
technology(integration(integration106), "FILE").
mode(integration(integration106), "По расписанию").
load(integration(integration106), max("100 rps"), avg("10 rps")).
asynch(integration(integration106)).
status(integration(integration106), "Используется").
security(integration(integration106), "SSL").


% Load test integration107
% -------------------------------------------
integration(integration107).
description(integration(integration107), "this is integration1 description").
source(integration(integration107), system(system1)).
destination(integration(integration107), system(system2)).
transmit(integration(integration107), data(data1)).
transmit(integration(integration107), data(data2)).
technology(integration(integration107), "FILE").
mode(integration(integration107), "По расписанию").
load(integration(integration107), max("100 rps"), avg("10 rps")).
asynch(integration(integration107)).
status(integration(integration107), "Используется").
security(integration(integration107), "SSL").


% Load test integration108
% -------------------------------------------
integration(integration108).
description(integration(integration108), "this is integration1 description").
source(integration(integration108), system(system1)).
destination(integration(integration108), system(system2)).
transmit(integration(integration108), data(data1)).
transmit(integration(integration108), data(data2)).
technology(integration(integration108), "FILE").
mode(integration(integration108), "По расписанию").
load(integration(integration108), max("100 rps"), avg("10 rps")).
asynch(integration(integration108)).
status(integration(integration108), "Используется").
security(integration(integration108), "SSL").


% Load test integration109
% -------------------------------------------
integration(integration109).
description(integration(integration109), "this is integration1 description").
source(integration(integration109), system(system1)).
destination(integration(integration109), system(system2)).
transmit(integration(integration109), data(data1)).
transmit(integration(integration109), data(data2)).
technology(integration(integration109), "FILE").
mode(integration(integration109), "По расписанию").
load(integration(integration109), max("100 rps"), avg("10 rps")).
asynch(integration(integration109)).
status(integration(integration109), "Используется").
security(integration(integration109), "SSL").
