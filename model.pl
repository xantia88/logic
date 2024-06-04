% список предикатов, используемых для моделирования (общий язык моделирования предметной области)
:-discontiguous(goal/1). % цели компании 
:-discontiguous(name/2). % наименование объекта
:-discontiguous(description/2). % описания объекта
:-discontiguous(comments/2). % дополнителные комментарии, связанные с объектом
:-discontiguous(horizon/2). % горизонта планирования 
:-discontiguous(strategy/1). % стратегические задачи компании
:-discontiguous(realize/2). % отношения реализации
:-discontiguous(task/1). % тактические задачи компании
:-discontiguous(deadline/2). % ожидаемый срок завершения тактической задачи компании 
:-discontiguous(client/1). % клиенты компании
:-discontiguous(client/2). % клиенты компании, использующие каналы компании 
:-discontiguous(count/2). % количество клиентов компании 
:-discontiguous(product/1). % продукты компании
:-discontiguous(product/2). % продукты компании, поставляемые в каналах компании
:-discontiguous(channel/1). % каналы компании
:-discontiguous(status/2). % статус объекта
:-discontiguous(type/2). % типа объекта
:-discontiguous(security/2). % механизм защиты канала
:-discontiguous(group/1). % группа систем
:-discontiguous(parent/2). % отношение иерархии (связь с родительским объектом)
:-discontiguous(system/1). % система
:-discontiguous(internal/1). % внутреняя система
:-discontiguous(external/1). % внешняя система
:-discontiguous(lifecycle/2). % этап ЖЦ системы
:-discontiguous(class/2). % класс системы
:-discontiguous(group/2). % группа системы
:-discontiguous(ownership/2). % степень владения системы
:-discontiguous(availability/2). % уровень доступности системы
:-discontiguous(monitoring/2). % средства мониторинга системы
:-discontiguous(change/2). % тип изменений системы
:-discontiguous(current/2). % текущий этап ЖЦ системы
:-discontiguous(plan/2). % планируемый этап ЖЦ на горизонт проектирования
:-discontiguous(level/2). % уровень критичности системы
:-discontiguous(performance/2). % производительность системы
:-discontiguous(rto/2). % значение RTO системы
:-discontiguous(rpo/2). % значение RpO системы
:-discontiguous(changes/2). % описание изменений системы
:-discontiguous(target/2). % целевое размещение функциональности
:-discontiguous(system/2). % системы, в которых реализована функциональность

% подключить функциональность для интерактивного взаимодействия с пользователем
:-consult("io.pl").

% справочник статусов задачи (Р09)
task_status(1, "Запланировано").
task_status(2, "В процессе").
task_status(3, "Завершено").
task_status(4, "Отменено").

% справочник типов клиента (Р03)
client_type(1, "Физические лица").
client_type(2, "Микро и малый бизнес").
client_type(3, "Крупный и средний бизнес").
client_type(4, "Купнейшие клиенты и финансовые институты").
client_type(5, "Сотрдуники компании или компаний Группы").

% справочник статусов продукта (Р04)
product_status(1, "Используется").
product_status(2, "Создается").

% справочник типов канала (Р05)
channel_type(1, "Цифровой").
channel_type(2, "Физический").

% справочник размещения канала (Р05)
channel_location(1, "Внешний").
channel_location(2, "Внутренний").

% справочник статусов канала (Р05)
channel_status(1, "Используется").
channel_status(2, "Создается").

% справочник целевых статусов системы (Р11)
system_status(1, "Целевая").
system_status(2, "Не целевая").

% справочник этапов жизненного цикла системы (Р11)
lifecycle(1, "Эскиз").
lifecycle(2, "В разработке / приобретение").
lifecycle(3, "Внедрение / Не введена в эксплуатацию").
lifecycle(4, "Опытная эксплуатация").
lifecycle(5, "Промышленная эксплуатация").
lifecycle(6, "Архивная").

% справочник типов изменений системы (Р11)
change_type(1, "Планируется").
change_type(2, "Разрабатывается").
change_type(3, "Модифицируется").
change_type(4, "Используется").
change_type(5, "Выводится из эксплуатации").

% справочник типов владения системы (Р11)
system_ownership(1, "Владеем исходным кодом").
system_ownership(2, "Владеем экземпляром").
system_ownership(3, "Используем как сервис (SaaS)").
system_ownership(4, "Система партнера").

% справочник уровней критичности системы (Р11)
criticality(1, "Mission Critical").
criticality(2, "Business Critical").
criticality(3, "Business Operational").
criticality(4, "Office Productivity").

% справочник классов систем (Р11)
system_class(1, "Класс").
system_class(2, "Класс").
system_class(3, "Класс").
system_class(4, "Класс").
system_class(5, "Класс").
system_class(6, "Класс").

% справочник целевого размещения функциональности (Р10)
target_location(1, "Целевое").
target_location(2, "Не целевое").

% справочник статуса функциональности (Р10) 
function_status(1, "Планируется").
function_status(2, "Разрабатывается или модифицируется").
function_status(3, "Используется").
function_status(4, "Удаляется").

% проверка корректности целей (Р01)
valid_goal(X):-
    goal(X), % должна быть определена как цель
    description(X, _), % должно быть задано описание
    horizon(X, _). % должен быть задан горизонт

% проверка корректности стратегических задач (Р02)
valid_strategy(X):-
    strategy(X), % должна быть определена как стратегическая задача
    description(X, _), % должно быть задано описание
    horizon(X, _), % должен быть определен горизонт
    realize(X, Goal), valid_goal(Goal). % должна быть связана с валидной целью

% проверка корректности задач и планов (Р09)
valid_task(X):-
    task(X), % должна быть определена как задача
    description(X, _), % должно быть задано описание
    deadline(X, _), % должен быть задан срок
    status(X, Status), task_status(_, Status), % должен быть определен статус из соответствующего справочника
    realize(X, Strategy), valid_strategy(Strategy). % должна быть связана с валидной стратегической задачей

% проверка корректности клиента (Р03)
valid_client(X):-
    client(X), % должен быть определен как клиент
    description(X, _), % должно быть задано описание
    type(X, T), client_type(_, T), % должен быть определен статус из соотвествующего справочника
    count(X, C), C>0. % количество должно быть определено и значение должно быть положительным

% проверка корректности продукта (Р04)
valid_product(X):-
    product(X), % должен быть задан как продукт
    name(X, _), % должно быть указано наименование
    description(X, _), % должно быть указано описание
    status(X, S), product_status(_, S). % должен быть указан статус из соотвествующего справочника

% проверка корректности канала (Р05)
valid_channel(X):-
    channel(X), % должен быть задан как канал
    name(X, _), % должно быть указано наименование
    type(X, T), channel_type(_, T), % должен быть указан тип из соотвествующего справочника
    location(X, L), channel_location(_, L), % должно быть указано размещение из соотвествующего справочника
    description(X, _), % должно быть указано описание
    status(X, S), channel_status(_, S), % должен быть указан статус из соотвествующего справочника
    security(X, _), % должны быть указаны способы защиты
    (
        client(X, _) -> % если указаны клиенты, обслуживаемые в канале
        findall(C, client(X, C), LC), % найти клиентов
        forall(member(C, LC), valid_client(C)), ! % все найденные клиенты должны быть валидны
        ; fail % инача завершить проверку с ошибкой
    ),
    (
        product(X, _) -> % если указаны продукты, поставляемые в канале
        findall(P, product(X, P), LP), % найти продукты
        forall(member(P, LP), valid_product(P)), ! % все указанные продукты должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ).
 
% проверка корректности группы систем (P12)
valid_group(X):-
    group(X), % должна быть задана как группа систем 
    name(X, _), % должно быть указано наименование
    (
        parent(X, _) -> % если указана родительская группа систем
        findall(G, parent(X, G), L), % найти родительские группы
        forall(member(G, L), valid_group(G)) % проверить, что родительские группы валидны
        ; true % иначе завершить проверку без ошибки
    ).

% проверка корректности систем (Р11)
valid_system(X):-
    system(X), % должна быть определена как система
    name(X, _), % должно быть определено наименование
    description(X, _), % должно быть определено описание
    group(X, G), valid_group(G), % должна быть указана валидная группа систем
    ownership(X, O), system_ownership(_, O), % должна быть степень владения из соотвествующего справочника
    class(X, C), system_class(_, C), % должен быть указан класс систем из соотвествующего справочника
    (
        external(X) ; % система может быть указана как внешняя (ИЛИ)
        internal(X), % система может быть указана как внутреняя 
        status(X, S), system_status(_, S), % должен быть указан статус системы из соотвествующего справочника (только для внутренних систем)
        change(X, C), change_type(_, C), % должен быть указан тип изменений систем из соотвествующего справочника (только для внутренних сиcтем) 
        current(X, L), lifecycle(_, L), % должен быть указан текущий этап ЖЦ системы из соотвествующего справочника (только для внутренних сиcтем) 
        plan(X, P), lifecycle(_, P), % должен быть указан этап ЖЦ системы на горизонт проектирования (только для внутренних сиcтем)
        level(X, L), criticality(_, L), % должен быть указан уровень критичности системы из соответствующего справочника (только для внутренних сиcтем)
        performance(X, _), % должна быть указана производительность (только для внутренних сиcтем)
        availability(X, _), % должна быть указана доступность (только для внутренних сиcтем)
        rto(X, _), % должно быть указано значение RTO (только для внутренних сиcтем)
        rpo(X, _), % должно быть указано значение RPO (только для внутренних сиcтем)
        monitoring(X, _), % должны быть указаны средства мониторинга (только для внутренних сиcтем)
        changes(X, _) % должно быть указано описание изменений (только для внутренних сиcтем) 
    ),
    (
        parent(X, Y) -> % если указана родительская система (для ФП)
        valid_system(Y), ! % родительская система должна быть валидна
        ; ! % иначе завершить проверку без ошибки
    ).

% проверка корректности функциональности (Р10)
valid_function(X):-
    function(X), % должна быть определена как функциональности
    name(X, _), % должно быть задано наименование
    description(X, _), % должно быть задано описание
    target(X, L), target_location(_, L), % должно быть указано целевое размещение
    status(X, Y), function_status(_, Y), % должен быть указан статус
    (
        system(X, _) -> % если указаны системы
        findall(S, system(X, S), LS), % найти системы
        forall(member(S, LS), valid_system(S)), ! % все найденные системы должны быть валидны
        ; write("error"), fail % иначе завершить проверку с ошибкой
    ).

% анализ цели (P01)
explain_goal(X):-
    write("Цель "), write(X), write(" "),
    (
        goal(X) -> % если цель задана как сущность
        write(" определена"), nl, 
        validate(description, X), % проверить, что задано описание
        validate(horizon, X),  ! % проверить, что задан горизон
        ; write(" не определена") % иначе сообщить об ошибке
    ).

% анализ стратегической задачи (P02)
explain_strategy(X):-
    write("Стратегическая задача "), write(X), write(" "),
    (
        strategy(X) -> % если стратегическая задача определена как сущность
        write(" определена"), nl, 
        validate(description, X), % проверить, что задано описание
        validate(horizon, X), % проверить, что задан горизонт
        (
            realize(X, G) -> % если есть связь с целью
            explain_goal(G), ! % перейти к анализу цели
            ; write("no goal") % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена") % сообщить об ошибке
    ).

% анализ задач и планов (P09)
explain_task(X):-
    write("Задача "), write(X),
    (
        task(X) -> % если задача определена как сущность
        write(" определена"), nl, 
        validate(description, X), % проверить, что задано описание
        validate(deadline, X),  % проверить, что задан срок
        validate(status, X, task_status), % проверить, что задан статус из соотвествующего справочника
        (
            realize(X, S) -> % если задача связана со стратегической задачей
            explain_strategy(S), ! % перейти к анализу стратегической задачи
            ; write("no strategy") % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена") % сообщить об ошибке
    ).

% анализ клиента (P03)
explain_client(X):-
    write("Клиент "), write(X),
    (
        client(X) -> % если клиент определен как сущность
        write(" определен"), nl, 
        validate(description, X), % проверить, что задано описание
        validate(type, X, client_type), % проверить, что задан тип из соотвествующего справочника
        validate(count, X), % проверить, что задано количество
        (
            count(X, C), C>0 -> % проверить, что количество указано и значение положительное
            ! % завершить анализ 
            ; write("неверно указано количество, должно быть больше нуля") % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена") % сообщить об ошибке
    ).

% анализ продукта (P04)
explain_product(X):-
    write("Продукт "), write(X),
    (
        product(X) -> % если продукт определен как сущность
        write(" определен"), nl, 
        validate(name, X), % проверить, что задано наименование
        validate(description, X), % проверить, что задано описание
        validate(status, X, product_status), ! % проверить, что задан статус из соотвествующего справочника
        ; write(" не определен") % сообщить об ошибке
    ).

% анализ канала (P05)
explain_channel(X):-
    write("Канал "), write(X), nl,
    (
        channel(X) -> % если клиент определен как сущность
        write(" определен"), nl, 
        validate(name, X), % проверить, что задано наименование
        validate(description, X), % проверить, что задано описание
        validate(type, X, channel_type), % проверить, что задан тип из соотвествующего справочника
        validate(location, X, channel_location), % проверить, что размещение задано из соотвествующего справочника
        validate(status, X, channel_status), % проверить, что статус задан из соотвествующего справочника
        validate(security, X), % проверить, что заданы средства защиты  
        (
            client(X, _) -> % если указаны обслуживаемые клиенты
            findall(C, client(X, C), LC), % найти обслуживаемых клиентов
            forall(member(C, LC), explain_client(C)) %  перейти к анализу обслуживаемых клиентов
            ; write("Ошибка: не указаны обслуживаемые клиенты"), nl % иначе сообщить об ошибке
        ),
        (
            product(X, _) -> % если указаны поставляемые продукты
            findall(P, product(X, P), LP), % найти поставляемые продукты
            forall(member(P, LP), explain_product(P)) % перейти к анализу поставляемых продуктов
            ; write("Ошибка: не указаны поставляемые продукты"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определен") % сообщить об ошибке
    ).

% анализ группы систем (P12)
explain_group(X):-
    write("Группа систем "), write(X),
    (
        group(X) -> % если группа систем определена как сущность
        write(" определена"), nl, 
        validate(name, X), % проверить, что задано наименование
        (
            parent(X, _) -> % если указана родительская группа систем
            findall(G, parent(X, G), L), % найти родительские группы
            forall(member(G, L), explain_group(G)), ! % перейти к их анализу
            ; ! % иначе завершить анализ
        ), ! % завершить анализ
        ; write(" не определена") % иначе сообщить об ошибке
    ).

% проверка систем (Р11)
explain_system(X):-
    write("Система "), write(X),
    (
        system(X) -> % если система определена в базе знаний
        write(" определена"), nl,
        validate(name, X), % проверить, что задано наименование
        validate(description, X), % проверить, что задано описание
        group(X, G), explain_group(G), % проверить, что задана группа систем и она валидная
        validate(ownership, X, system_ownership), % проверить, что задана степень владения
        validate(class, X, system_class), % проверть, что задан класс систем
        (
            internal(X) -> % если система внутреняя
            write(" internal system"), 
            validate(status, X, system_status), % проверить, что задан статус системы из соответсвующего справочника
            validate(change, X, change_type), % проверить, что задан тип изменений из соответсвующего справочника
            validate(current, X, lifecycle), % проверить, что задан текущий этап ЖЦ из соответсвующего справочника
            validate(plan, X, lifecycle), % проверить, что задан этап ЖЦ на горизонт проектирования из соответсвующего справочника
            validate(level, X, criticality), % проверить, что задан уровень критичности из соответсвующего справочника
            validate(performance, X), % проверить, что задана производительность
            validate(availability, X), % проверить, что задана доступность
            validate(rto, X), % проверить, что задано значение RTO
            validate(rpo, X), % проверить, что задано значение RPO
            validate(monitoring, X), % проверить, что заданы средства мониторинга
            validate(changes, X) % проверить, что задано описание изменений
            ; write(" external system")
        ),
        (
            parent(X, S) -> % если указана родительская система (для ФП)
            explain_system(S), ! % перейти к анализу родительской системы
            ; ! % иначе завершить анализ
        ), ! % завершить анализ
        ; write(" не определена") % иначе сообщить об ошибке
    ).

% анализ функциональности (P10)
explain_function(X):-
    write("Функциональность "), write(X),
    (
        function(X) -> % если функциональность определена как сущность
        write(" определена"), nl, 
        validate(name, X), % проверить, что задано наименование
        validate(description, X), % проверить, что задано описание
        validate(target, X, target_location), % проверить, что задано целевое размещение
        validate(status, X, function_status), % проверить, что задан статус
        (
            system(X, _) -> % если указана система
            findall(S, system(X, S), LS), % найти системы
            forall(member(S, LS), explain_system(S)), ! % перейти к их анализу
            ; write("Ошибка: не указаны системы, в которых реализована функциональность"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена") % сообщить об ошибке
    ).

