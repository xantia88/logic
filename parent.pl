% список предикатов, используемых для моделирования (общий язык)
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
:-discontiguous(parent/2). % родительская группа систем

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
        ; fail
    ),
    (
        product(X, _) -> % если указаны продукты, поставляемые в канале
        findall(P, product(X, P), LP), % найти продукты
        forall(member(P, LP), valid_product(P)), ! % все указанные продукты должны быть валидны
        ; fail
    ).
 
% проверка корректности группы систем (P12)
valid_group(X):-
    group(X), % должна быть задана как группа систем 
    name(X, _), % должно быть указано наименование
    (
        parent(X, _) -> % если указана родительская группа систем
        findall(G, parent(X, G), L), % найти родительские группы
        forall(member(G, L), valid_group(G)) % проверить, что родительские группы валидны
        ; true % иначе проверку без ошибки
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
        ), !
        ; write(" не определена") % сообщить об ошибке
    ).

% анализ задачи (P09)
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
        ), !
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
            count(X, C), C>0 -> % проверить, что количество больше нуля
            !
            ; write("неверно указано количество, должно быть больше нуля") % сообщить об ошибке
        ), !
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
            ; write("Ошибка: не указаны обслуживаемые клиенты"), nl % сообщить об ошибке
        ),
        (
            product(X, _) -> % если указаны поставляемые продукты
            findall(P, product(X, P), LP), % найти поставляемые продукты
            forall(member(P, LP), explain_product(P)) % перейти к анализу поставляемых продуктов
            ; write("Ошибка: не указаны поставляемые продукты"), nl % сообщить об ошибке
        ), !
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
            forall(member(G, L), explain_group2(G)), ! % перейти к их анализу
            ; !
        )
        ; write(" не определена") % сообщить об ошибке
    ).


