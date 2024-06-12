% список предикатов, спользуемых для моделирования (общий язык моделирования предметной области)
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
:-discontiguous(object/1). % бизнес объект
:-discontiguous(data/1). % объект данных
:-discontiguous(category/2). % категория данных, содержащаяся в объекте данных
:-discontiguous(integration/1). % интеграционный поток
:-discontiguous(transmit/2). % передача объекта данных в интеграционном потоке
:-discontiguous(synch/1). % синхронный интеграционный поток
:-discontiguous(asynch/1). % асинхронный интеграционный поток
:-discontiguous(technology/2). % технология интеграции
:-discontiguous(mode/2). % механизм использования интеграционного потока
:-discontiguous(load/3). % максимальные и средние нагрузочные характеристики интеграционного потока
:-discontiguous(source/2). % система источник данных (поставщик)
:-discontiguous(destination/2). % система потребитель данных
:-discontiguous(component/1). % технический компонент
:-discontiguous(monitoring/2). % мониторинг технического компонента
:-discontiguous(software/2). % прикладное ПО технического компонента
:-discontiguous(vendor/2). % вендо технического компонента
:-discontiguous(scalability/2). % масштабируемость технического компонента
:-discontiguous(ha/2). % отказоустойчивость технического компонента
:-discontiguous(dr/2). % катастрофоустойчивость технического компонента
:-discontiguous(backup/2). % бэкапирование технического компонента
:-discontiguous(ha/3). % отказоустойчивость технического компонента 
:-discontiguous(dr/3). % катастрофоустойчивость технического компонента
:-discontiguous(backup/3). % бэкапирование технического компонента
:-discontiguous(process/1). % бизнесс процесс
:-discontiguous(use/2). % отношение типа использует
:-discontiguous(security/1). % система КБ
:-discontiguous(service/1). % технологический сервис
:-discontiguous(valid/1). % проверка валидности сущности
:-discontiguous(explain/1). % анализ сущности

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

% справочник типов канала (Р05)
channel_type(1, "Цифровой").
channel_type(2, "Физический").

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

% справочник типов изменений системы (Р11) или объекта данных (Р08)
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
system_class(1, "Класс 1").
system_class(2, "Класс 2").
system_class(3, "Класс 3").
system_class(4, "Класс 4").
system_class(5, "Класс 5").
system_class(6, "Класс 6").

% справочник целевого размещения функциональности (Р10)
target_location(1, "Целевое").
target_location(2, "Не целевое").

% справочник статуса функциональности (Р10) 
function_status(1, "Планируется").
function_status(2, "Разрабатывается или модифицируется").
function_status(3, "Используется").
function_status(4, "Удаляется").

% справочник категорий данных (Р08)
data_category(1, "Персональные данные").
data_category(2, "Медицинские данные").
data_category(3, "Платежные данные (карты)").
data_category(4, "Коммерческая тайна").
data_category(5, "Прочее").

% справочник статусов интеграционного потока (Р14)
integration_status(1, "Дорабатывается").
integration_status(2, "Используется").
integration_status(3, "Создается").
integration_status(4, "Удаляется").

% справочник механизмов использования интеграционного потока (Р14)
integration_mode(1, "По запросу").
integration_mode(2, "По событию").
integration_mode(3, "По расписанию").

% справочник типов технических компонентов (Р16)
component_type(1, "Фронт (web-приложение)").
component_type(2, "Фронт (мобильное приложение)").
component_type(3, "Фронт (десктопное приложение)").
component_type(4, "Шлюз").
component_type(5, "Proxy").
component_type(6, "Балансировщик").
component_type(7, "web сервер").
component_type(8, "Серверное приложение").
component_type(9, "Микросервис").
component_type(10, "Функция (serverless function)").
component_type(11, "Консольное приложение").

% справочник масштабируемости (Р16)
component_scalability(1, "Нет").
component_scalability(2, "Вертикальная").
component_scalability(3, "Горизонтальная").
component_scalability(4, "Вертикальная и горизонтальная").

% справочник типов резервирования мощностей (Р16)
capacity_type(1, "Active").
capacity_type(2, "StandBy").

% справочник уровней резервирования мощностей (Р16)
capacity_level(1, "Полное").
capacity_level(2, "Частичное").

% справочник мест хранения резервных копий (Р16)
backup_location(1, "ЦОД").
backup_location(2, "Резервный ЦОД").
backup_location(3, "Offsite").

% Справочник классов системы КБ (Р13)
security_class(1, "ИБ-Антивирусное ПО").
security_class(2, "ИБ-Аудит действий персонала").
security_class(3, "ИБ-Аутентификация пользователей").
security_class(4, "ИБ-Биометрия").
security_class(5, "ИБ-Защита от киберугроз").
security_class(6, "ИБ-Защита от сетевых атак").
security_class(7, "ИБ-Защита от утечек информации").
security_class(8, "ИБ-Защита трафика").
security_class(9, "ИБ-Криптография и шифрование").
security_class(10, "ИБ-Предотвращение мошенничества").
security_class(11, "ИБ-Управление доступом").
security_class(11, "ИБ-Управление сертификатами").

% Справочник классов технологического сервиса (Р15)
service_class(1, "Архитектурный репозиторий").
service_class(2, "Бэкапирование и восстановление данных").
service_class(3, "Виртуализация").
service_class(4, "Контейнеризация").
service_class(5, "Логгирование").
service_class(6, "Мониторинг").
service_class(7, "Удаленный доступ").
service_class(8, "Управление конфигурациями").
service_class(9, "Управление облачной инфраструктурой").

% Справочник статусов продукта (Р04), канала (Р05), системы КБ (Р13), технологического сервиса (Р15)
general_status(1, "Используется").
general_status(2, "Создается").

% проверка валидности цели компании (Р01)
valid(goal(X)):-
    goal(X), % должна быть определена в базе знаний как цель
    description(goal(X), D), string(D), % должно быть задано описание
    horizon(goal(X), H), string(H). % должен быть задан горизонт

% проверка валидности стратегической задачи (Р02)
valid(strategy(X)):-
    strategy(X), % должна быть определена в базе знаний как стратегическая задача
    description(strategy(X), D), string(D), % должно быть задано описание
    horizon(strategy(X), H), string(H), % должен быть определен горизонт
    realize(strategy(X), goal(Goal)), valid(goal(Goal)). % должна быть связана с валидной целью

% проверка валидности задачи и плана (Р09)
valid(task(X)):-
    task(X), % должна быть определена в базе знаний как задача
    description(task(X), D), string(D), % должно быть задано описание
    deadline(task(X), DL), string(DL), % должен быть задан срок
    status(task(X), S), listed(S, task_status), % должен быть определен статус из соответствующего справочника
    realize(task(X), strategy(Strategy)), valid(strategy(Strategy)). % должна быть связана с валидной стратегической задачей

% проверка валидности клиента (Р03)
valid(client(X)):-
    client(X), % должен быть определен в базе знаний как клиент
    description(client(X), D), string(D), % должно быть задано описание
    type(client(X), T), listed(T, client_type), % должен быть определен статус из соотвествующего справочника
    count(client(X), C), positive(C). % количество должно быть определено и значение должно быть положительным

% проверка валидности продукта (Р04)
valid(product(X)):-
    product(X), % должен быть определен в базе знаний как продукт
    name(product(X), N), string(N), % должно быть указано наименование
    description(product(X), D), string(D), % должно быть указано описание
    status(product(X), S), listed(S, general_status). % должен быть указан статус из соотвествующего справочника

% проверка валидности канала (Р05)
valid(channel(X)):-
    channel(X), % должен быть определен в базе знаний как канал
    name(channel(X), N), string(N), % должно быть указано наименование
    type(channel(X), T), listed(T, channel_type), % должен быть указан тип из соотвествующего справочника
    (   % проверка размещения
        internal(channel(X)), ! % может быть внутренним
        ; external(channel(X)), ! % может быть внешним
        ; fail % иначе завершить проверку с ошибкой
    ),   
    description(channel(X), D), string(D), % должно быть указано описание
    status(channel(X), S), listed(S, general_status), % должен быть указан статус из соотвествующего справочника
    security(channel(X), S), string(S), % должны быть указаны способы защиты
    (   % проверка клиентов
        client(channel(X), client(_)) -> % если указаны клиенты, обслуживаемые в канале
        findall(C, client(channel(X), client(C)), LC), forall(member(C, LC), valid(client(C))), ! % все указанные клиенты должны быть валидны
        ; fail % инача завершить проверку с ошибкой
    ),
    (   % проверка продуктов
        product(channel(X), product(_)) -> % если указаны продукты, поставляемые в канале
        findall(P, product(channel(X), product(P)), LP), forall(member(P, LP), valid(product(P))), ! % все указанные продукты должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ).
 
% проверка валидности группы систем (P12)
valid(group(X)):-
    group(X), % должна быть определена в базе знаний как группа систем 
    name(group(X), N), string(N), % должно быть указано наименование
    (   % проверка родительской группы
        parent(group(X), group(_)) -> % если указаны родительские группы систем
        findall(G, parent(group(X), group(G)), L), forall(member(G, L), valid(group(G))), ! % все указанные родительские группы систем должны быть валидны
        ; ! % иначе завершить проверку без ошибки
    ).

% проверка валидности системы (Р11)
valid(system(X)):-
    system(X), % должна быть определена в базе знаний как система
    name(system(X), N), string(N), % должно быть определено наименование
    description(system(X), D), string(D), % должно быть определено описание
    (   % проверка группы систем
        group(system(X), group(_)) -> % если указаны группы систем
        findall(G, group(system(X), group(G)), LG), forall(member(G, LG), valid(group(G))), ! % все указанные группы систем должны быть валидны
        ; fail % иначе завершить проверку группы с ошибкой
    ), 
    ownership(system(X), O), listed(O, system_ownership), % должна быть степень владения из соотвествующего справочника
    class(system(X), Cl), listed(Cl, system_class), % должен быть указан класс систем из соотвествующего справочника
    (   % проверка внутренних и внешних систем
        internal(system(X)), % если система указана как внутреняя
        status(system(X), S), listed(S, system_status), % должен быть указан статус системы из соотвествующего справочника (только для внутренних систем)
        change(system(X), C), listed(C, change_type), % должен быть указан тип изменений систем из соотвествующего справочника (только для внутренних сиcтем) 
        current(system(X), L1), listed(L1, lifecycle), % должен быть указан текущий этап ЖЦ системы из соотвествующего справочника (только для внутренних сиcтем) 
        plan(system(X), P), listed(P, lifecycle), % должен быть указан этап ЖЦ системы на горизонт проектирования (только для внутренних сиcтем)
        level(system(X), L2), listed(L2, criticality), % должен быть указан уровень критичности системы из соответствующего справочника (только для внутренних сиcтем)
        performance(system(X), P), string(P), % должна быть указана производительность (только для внутренних сиcтем)
        availability(system(X), A), string(A), % должна быть указана доступность (только для внутренних сиcтем)
        rto(system(X), Rto), string(Rto), % должно быть указано значение RTO (только для внутренних сиcтем)
        rpo(system(X), Rpo), string(Rpo), % должно быть указано значение RPO (только для внутренних сиcтем)
        monitoring(system(X), M), string(M), % должны быть указаны средства мониторинга (только для внутренних сиcтем)
        changes(system(X), Ch), string(Ch), ! % должно быть указано описание изменений (только для внутренних сиcтем) 
        ; external(system(X)), ! % если система указана как внешняя - завершить проверку
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка родительской системы (для ФП)
        parent(system(X), system(Y)) -> % если указана родительская система
        valid(system(Y)), ! % родительская система должна быть валидна
        ; ! % иначе завершить проверку родительской системы
    ).

% проверка валидности функциональности (Р10)
valid(function(X)):-
    function(X), % должна быть определена в базе знаний как функциональность
    name(function(X), N), string(N), % должно быть задано наименование
    description(function(X), D), string(D), % должно быть задано описание
    target(function(X), L), listed(L, target_location), % должно быть указано целевое размещение из соответсвующего справочника
    status(function(X), Y), listed(Y, function_status), % должен быть указан статус
    (   % проверка систем
        system(function(X), system(_)) -> % если указаны системы, в которых реализована функциональность 
        findall(S, system(function(X), system(S)), LS), forall(member(S, LS), valid(system(S))), ! % все указанные системы должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ).

% проверка валидности бизнес процесса
valid(process(X)):-
    process(X), % должен быть определен в базе знаний как бизнес процесс
    name(process(X), N), string(N), % должно быть указано наименование
    description(process(X), D), string(D), % должно быть указано описание
    (   % проверка обеспечивающих систем
        use(process(X), system(S)) -> % если указаны системы, которые обеспечивают бизнес процесс
        findall(S, use(process(X), system(S)), LS), forall(member(S, LS), valid(system(S))), ! % все указанные системы должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка реализуемых продуктов
        use(process(X), product(P)) -> % если указаны продукты, которые реализует бизнес процесс
        findall(P, use(process(X), product(P)), LP), forall(member(P, LP), valid(product(P))), ! % все указаныне продукты должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ),
    (
        % проверка обеспечивающих интеграционных потоков
        use(process(X), integration(I)) -> % если указаны интеграционные потоки, которые обеспечивают бизнес процесс
        findall(I, use(process(X), integration(I)), LI), forall(member(I, LI), valid(integration(I))), ! % все указанные интеграционные потоки должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ), 
    (
        % проверка используемых бизнес объектов
        use(process(X), object(O)) -> % если указаны бизнес объекты, которые использует бизнес процесс
        findall(O, use(process(X), object(O)), LO), forall(member(O, LO), valid(object(O))), ! % все указанные бизнес объекты должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ).

% проверка валидности бизнес объекта (Р07)
valid(object(X)):-
    object(X), % должен быть определен в базе знаний как бизнес данных
    name(object(X), N), string(N), % должно быть задано наименование
    status(object(X), Y), listed(Y, change_type). % должен быть указан статус изменений из соотвествующего справочника

% проверка валидности объекта данных (Р08)
valid(data(X)):-
    data(X), % должен быть определен в базе знаний как объект данных
    name(data(X), N), string(N), % должно быть задано наименование
    category(data(X), C), listed(C, data_category), % должна быть определена категория данных из соответсвующего справочника
    status(data(X), Y), listed(Y, change_type), % должен быть указан статус изменений из соотвествующего справочника
    system(data(X), S), valid(system(S)), % должна быть указана валидная мастер система
    parent(data(X), B), valid(object(B)). % должен быть указан валидный родительский бизнес объект  

% проверка валидности интеграционного потока (Р14)
valid(integration(X)):-
    integration(X), % должен быть определен в базе знаний как интеграционный поток
    description(integration(X), D), string(D), % должно быть задано описание
    source(integration(X), system(Source)), valid(system(Source)), % должна быть указана система источник данных
    destination(integration(X), system(Destination)), valid(system(Destination)), % должна быть указана система потребитель данных
    (   % проверка объектов данных
        transmit(integration(X), data(_)) -> % если указаны передаваемые объекты данных
        findall(B, transmit(integration(X), data(B)), LB), forall(member(B, LB), valid(data(B))), ! % все указанные объекты данных должны быть валидны
       ; fail % иначе ошибка
    ),
    technology(integration(X), T), string(T), % должна быть указана технологич интеграции
    mode(integration(X), M), listed(M, integration_mode), % должен быть указан механизм использования из соответсвующего справочника
    load(integration(X), max(ML), avg(AL)), string(ML), string(AL), % должны быть указаны максимальные и средние нагрузочные характеристики
    (   % проверка асинхронности интеграционного потока
        synch(integration(X)), ! % поток может быть синхронным
        ; asynch(integration(X)), ! % поток может быть асинхронным
        ; fail % иначе завершить проверку с ошибкой
    ),
    status(integration(X), S), listed(S, integration_status), % должен быть указан статус из соответсвующего справочника
    security(integration(X), Sec), string(Sec). % должны быть указаны средства защиты

% проверка валидности технического компонента (Р16)
valid(component(X)):-
    component(X), % должен быть определен в базе знаний как компонент
    system(component(X), system(S)), valid(system(S)), % должена быть задана валидная система
    type(component(X), T), listed(T, component_type), % должен быть указан тип компонента из соответсвующего справочника
    software(component(X), S), string(S), % должно быть указано прикладное ПО
    vendor(component(X), V), string(V), % должен быть указан вендор
    scalability(component(X), Sc), listed(Sc, component_scalability), % должен быть указан тип масштабируемости
    (   % проверка параметров отказоустойчивости
        ha(component(X), false), ! % если высокая доступность отсуствует
        ; ha(component(X), type(T1), level(L1)), listed(T1, capacity_type), listed(L1, capacity_level), ! % если указана высокая доступность, то должны быть корректно указаны тип и полнота резервирования
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка параметров катастрофоустойчивости
        dr(component(X), false), ! % если катастрофоустойчивость отсуствует
        ; dr(component(X), type(T2), level(L2)), listed(T2, capacity_type), listed(L2, capacity_level), ! % если указана катастрофоустойчивость, то должны быть корректно указаны тип и полнота резервирования
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка параметров бэкапирования
        backup(component(X), false), ! % если бэкапирование отсутсвует
        ; backup(component(X), location(L3), duplicate(L4)), listed(L3, backup_location), listed(L4, backup_location), ! % если указано бэкапирование, то должны быть корректно указаны место хранения основной копии и дубликата
        ; fail % иначе завершить проверку с ошибкой
    ),
    monitoring(component(X), M), string(M). % должен быть указан ммониторинг

% проверка валидности системы КБ (Р13)
valid(security(X)):-
    security(X), % должна быть определена в базе знаний как системы КБ
    name(security(X), N), string(N), % должно быть указано наименование
    description(security(X), D), string(D), % должно быть указано описание
    class(security(X), C), listed(C, security_class), % должен быть указан класс систем КБ из соответсвующего справочника
    (   % проверка размещения
        internal(security(X)), ! % может быть указана как внутреняя
        ; external(security(X)), ! % может быть указана как внешняя
        ; fail % иначе завершить проверку с ошибкой
    ),
    status(security(X), S), listed(S, general_status). % должен быть указан статус из соответсвующего справочника

% проверка валидности технологического сервиса (Р15)
valid(service(X)):-
    service(X), % должен быть определен в базе знаний как технологический сервис
    name(service(X), N), string(N), % должно быть указано наименование
    description(service(X), D), string(D), % должно быть указано описание
    class(service(X), C), listed(C, service_class), % должен быть указан класс технологического сервиса из соответсвующего справочника
    (   % проверка размещения
        internal(service(X)), ! % может быть указан как внутренний
        ; external(service(X)), ! % может быть указан как внешний
        ; fail % иначе завершить проверку с ошибкой
    ),
    status(service(X), S), listed(S, general_status). % должен быть указан статус из соответсвующего справочника

% анализ системы КБ (P13)
explain(security(X)):-
    write("Система КБ "), write(X), 
    (
        security(X) ->  % если системы КБ определена в базе знаний
        write(" определена"), nl, 
        string(name, security(X)), % проверить, что задано наименование
        string(description, security(X)), % проверить, что задано описание
        list(class, security(X), security_class), % проверить, что задан класс системы КБ из соответствующего справочника
        (   % анализ размещения
            internal(security(X)), ! % может быть внутренней
            ; external(security(X)), ! % может быть внешней
            ; write("Ошибка: должно быть указано размещение системы КБ"), nl % иначе сообщить об ошибке
        ),
        list(status, security(X), general_status),  ! % проверить, что задан статус 
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ технологического сервиса (P15)
explain(service(X)):-
    write("Технологический сервис "), write(X), 
    (
        service(X) ->  % если технологический сервис определен в базе знаний
        write(" определен"), nl, 
        string(name, service(X)), % проверить, что задано наименование
        string(description, service(X)), % проверить, что задано описание
        list(class, service(X), service_class), % проверить, что задан класс технологического сервиса из соответствующего справочника
        (   % анализ размещения
            internal(service(X)), ! % может быть внутренним
            ; external(service(X)), ! % может быть внешним
            ; write("Ошибка: должно быть указано размещение технологического сервиса"), nl % иначе сообщить об ошибке
        ),
        list(status, service(X), general_status),  ! % проверить, что задан статус 
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ цели (P01)
explain(goal(X)):-
    write("Цель "), write(X),
    (
        goal(X) -> % если цель определена в базе знаний
        write(" определена"), nl, 
        string(description, goal(X)), % проверить, что задано описание
        string(horizon, goal(X)),  ! % проверить, что задан горизон
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ стратегической задачи (P02)
explain(strategy(X)):-
    write("Стратегическая задача "), write(X),
    (
        strategy(X) -> % если стратегическая задача определена в базе знаний
        write(" определена"), nl, 
        string(description, strategy(X)), % проверить, что задано описание
        string(horizon, strategy(X)), % проверить, что задан горизонт
        (
            realize(strategy(X), goal(G)) -> % если есть связь с целью
            explain(goal(G)), ! % перейти к анализу цели
            ; write("Ошибка: не задана цель компании"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ задачи и плана (P09)
explain(task(X)):-
    write("Задача "), write(X),
    (
        task(X) -> % если задача определена в базе знаний
        write(" определена"), nl, 
        string(description, task(X)), % проверить, что задано описание
        string(deadline, task(X)),  % проверить, что задан срок
        list(status, task(X), task_status), % проверить, что задан статус из соотвествующего справочника
        (
            realize(task(X), strategy(S)) -> % если задача связана со стратегической задачей
            explain(strategy(S)), ! % перейти к анализу стратегической задачи
            ; write("Ошибка: не определена стратегическая задача"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ клиента (P03)
explain(client(X)):-
    write("Клиент "), write(X),
    (
        client(X) -> % если клиент определен в базе знаний
        write(" определен"), nl, 
        string(description, client(X)), % проверить, что задано описание
        list(type, client(X), client_type), % проверить, что задан тип из соотвествующего справочника
        positive(count, client(X)), ! % проверить, что задано количество
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ продукта (P04)
explain(product(X)):-
    write("Продукт "), write(X),
    (
        product(X) -> % если продукт определен в базе знаний
        write(" определен"), nl, 
        string(name, product(X)), % проверить, что задано наименование
        string(description, product(X)), % проверить, что задано описание
        list(status, product(X), general_status), ! % проверить, что задан статус из соотвествующего справочника
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ канала (P05)
explain(channel(X)):-
    write("Канал "), write(X),
    (
        channel(X) -> % если клиент определен в базе знаний
        write(" определен"), nl, 
        string(name, channel(X)), % проверить, что задано наименование
        string(description, channel(X)), % проверить, что задано описание
        list(type, channel(X), channel_type), % проверить, что задан тип из соотвествующего справочника
        (   % анализ размещения
            internal(channel(X)), ! % может быть внутренним
            ; external(channel(X)), ! % может быть внешним
            ; write("Ошибка: должно быть указано размещение канала"), nl
        ),
        list(status, channel(X), general_status), % проверить, что статус задан из соотвествующего справочника
        string(security, channel(X)), % проверить, что заданы средства защиты  
        (   % анализ клиентов
            client(channel(X), client(_)) -> % если указаны обслуживаемые в канале клиенты
            findall(C, client(channel(X), client(C)), LC), forall(member(C, LC), explain(client(C))), ! %  перейти к анализу указанных клиентов
            ; write("Ошибка: не указаны обслуживаемые клиенты"), nl % иначе сообщить об ошибке
        ),
        (   % анализ продуктов
            product(channel(X), product(_)) -> % если указаны поставляемые в канале продукты
            findall(P, product(channel(X), product(P)), LP), forall(member(P, LP), explain(product(P))), ! % перейти к анализу указанных продуктов
            ; write("Ошибка: не указаны поставляемые продукты"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ группы систем (P12)
explain(group(X)):-
    write("Группа систем "), write(X),
    (
        group(X) -> % если группа систем определена в базе знаний
        write(" + "), nl, 
        string(name, group(X)), % проверить, что задано наименование
        (   % анализ родительских групп системы
            parent(group(X), group(_)) -> % если указаны родительские группы систем
            findall(G, parent(group(X), group(G)), L), forall(member(G, L), explain(group(G))), ! % перейти анализу указанных групп систем
            ; ! % иначе завершить анализ родительской группы
        ), ! % завершить анализ
        ; write(" - "), nl % иначе сообщить об ошибке
    ).

% анализ системы (Р11)
explain(system(X)):-
    write("["), write(X), write("]"),
    (   % анализ системы
        system(X) -> % если система определена в базе знаний
        write(" + "), nl,
        string(name, system(X)), % проверить, что задано наименование
        string(description, system(X)), % проверить, что задано описание  
        (   % анализ групп систем
            group(system(X), group(_)) -> % если указаны группы систем
            findall(G, group(system(X), group(G)), LG), forall(member(G, LG), explain(group(G))), ! % перейти к анализу указанных групп систем
            ; write("Ошибка: не указана группа систем"), nl % сообщить об ошибке
        ),
        list(ownership, system(X), system_ownership), % проверить, что задана степень владения
        list(class, system(X), system_class), % проверть, что задан класс систем
        (   % анализ внутренних и внешних систем           
            internal(system(X)), % если система объявлена как внутреняя
            list(status, system(X), system_status), % проверить, что задан статус системы из соответсвующего справочника
            list(change, system(X), change_type), % проверить, что задан тип изменений из соответсвующего справочника
            list(current, system(X), lifecycle), % проверить, что задан текущий этап ЖЦ из соответсвующего справочника
            list(plan, system(X), lifecycle), % проверить, что задан этап ЖЦ на горизонт проектирования из соответсвующего справочника
            list(level, system(X), criticality), % проверить, что задан уровень критичности из соответсвующего справочника
            string(performance, system(X)), % проверить, что задана производительность
            string(availability, system(X)), % проверить, что задана доступность
            string(rto, system(X)), % проверить, что задано значение RTO
            string(rpo, system(X)), % проверить, что задано значение RPO
            string(monitoring, system(X)), % проверить, что заданы средства мониторинга
            string(changes, system(X)), ! % проверить, что задано описание изменений
            ; external(system(X)), !  % если система объявлена как внешняя - закончить анализ
            ; write("Ошибка: система должна быть объявлена как внешняя или внутреняя"), nl % иначе сообщить об ошибке
        ),
        (   % анализ родительской системы (для ФП)
            parent(system(X), system(S)) -> % если указана родительская система
            explain(system(S)), ! % перейти к анализу родительской системы
            ; ! % иначе завершить анализ родительской системы
        ), ! % завершить анализ
        ; write(" - "), nl % иначе сообщить об ошибке
    ).

% анализ функциональности (P10)
explain(function(X)):-
    write("Функциональность "), write(X),
    (
        function(X) -> % если функциональность определена в базе знаний
        write(" определена"), nl, 
        string(name, function(X)), % проверить, что задано наименование
        string(description, function(X)), % проверить, что задано описание
        list(target, function(X), target_location), % проверить, что задано целевое размещение
        list(status, function(X), function_status), % проверить, что задан статус
        (   % анализ систем
            system(function(X), system(_)) -> % если указаны системы, реализующие функциональность
            findall(S, system(function(X), system(S)), LS), forall(member(S, LS), explain(system(S))), ! % перейти к анализу указанных систем
            ; write("Ошибка: не указаны системы, в которых реализована функциональность"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ бизнес объекта (P07)
explain(object(X)):-
    write("Бизнес объект "), write(X),
    (
        object(X) -> % если бизнес объект определен в базе знаний
        write(" определен"), nl, 
        string(name, object(X)), % проверить, что задано наименование
        list(status, object(X), change_type), ! % проверить, что задан статус из соответсвующего справочника
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ объекта данных (P08)
explain(data(X)):-
    write("Объект данных "), write(X), 
    (
        data(X) -> % если объект данных определен в базе знаний
        write(" определен"), nl, 
        string(name, data(X)), % проверить, что задано наименование
        list(status, data(X), change_type), % проверить, что задан статус из соответсвующего справочника
        list(category, data(X), data_category), % проверить, что задана категория данных из соотвествующего справочника
        (   % анализ систем
            system(data(X), system(S)) -> % если указана мастер система
            explain(system(S)), ! % перейти к анализу мастер системы
            ; write("Ошибка: не задана мастер система"), nl % иначе сообщить об ошибке
        ),
        (
            % анализ родительского бизнес объекта
            parent(data(X), object(B)) -> % если указан родительский бизнес объект
            explain(object(B)), ! % перейти к анализу родительского бизнес объекта
            ; write("Ошибка: должен быть указан родительский бизнес объект"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ интеграционного потока (P14)
explain(integration(X)):-
    write("Интеграционный поток "), write(X), 
    (
        integration(X) -> % если интеграционный поток определен в базе знаний
        write(" определен"), nl, 
        string(description, integration(X)), % проверить, что задано описание
        (   % анализ источника данных
            source(integration(X), system(From)) -> % если указана система источник данных
            explain(system(From)), ! % перейти к анализу системы
            ; write("Ошибка: не указана система источник данных"), nl % иначе сообщить об ошибке
        ),
        (
            % анализ потребителя данных
            destination(integration(X), system(To)) -> % если указана система потребитель данных
            explain(system(To)), ! % перейти к анализу системы
            ; write("Ошибка: не указана система потребитель данных"), nl % иначе сообщить об ошибке
        ),
        (   % проверка объектов данных
            transmit(integration(X), data(_)) -> % если указаны передаваемые объекты данных
            findall(B, transmit(integration(X), data(B)), LB), forall(member(B, LB), explain(data(B))), ! % перейти к анализу указанных объектов данных 
            ; write("Ошибка: не указаны передаваемые объекты данных"), nl % иначе сообщить об ошибке
        ),
        string(technology, integration(X)), % проверить, что задано описание
        list(mode, integration(X), integration_mode), % проверить, что задан механизм использования из соответсвующего справочника
        (   % анализ параметров нагрузки
            load(integration(X), max(_), avg(_)) -> % если параметры нагрузки заданы
            ! % завершить анализ параметров нагрузки
            ; write("Ошибка: должны быть заданы параметры максимальной и средней нагрузки"), nl % иначе сообщить об ошибке
        ),
        (   % проверка асинхронности интеграционного потока
            synch(integration(X)), ! % интеграционный поток может быть указан как синхронный
            ; asynch(integration(X)), ! % интеграционный поток может быть указан как асинхронный
            ; write("Ошибка: поток должен быть опереден как синхронный или асинхронный"), nl % иначе сообщить об ошибке
        ),
        list(status, integration(X), integration_status), % проверить, что указан статус
        string(security, integration(X)), ! % проверить, что указаны средства защиты
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ технического компонента (Р16)
explain(component(X)):- 
    write("Компонент "), write(X), 
    (
        component(X) -> % если компонент определен в базе знаний
        write(" определен"), nl, 
        (   % анализ системы
            system(component(X), system(S)) -> % если указана система
            explain(system(S)), ! % перейти к анализу системы
            ; write("Ошибка: должна быть указана система"), nl % иначе сообщить об ошибке
        ),
        list(type, component(X), component_type), % проверить, что задан тип компоненты из соответсвующего справочника
        string(software, component(X)), % проверить, что задано прикладное ПО
        string(vendor, component(X)), % проверить, что задан вендор
        list(scalability, component(X), component_scalability), % проверить, что задан тип масштабируемости из соответсвующего справочника
        (   % анализ параметров отказоустойчивости
            (   % должно быть явно указано, есть ли отказоустойчивость 
                ha(component(X), false), ! % если отказоустойчивость отсуствует
                ; ha(component(X), type(T1), level(L1)), capacity_type(_, T1), capacity_level(_, L1), ! % если отказоустойчивость есть, то ее параметры должны быть указан из соответсвующих справочников
            ), write("Параметры отказоустойчивости указаны верно"), nl, ! % иначе сообщить об ошибке
            ; write("Ошибка: неверно указаны параметры отказоустойчивости"), nl % иначе сообщить об ошибке
        ),         
        (   % анализ параметров катастрофоустойчивости
            (   % должно быть явно указано, есть ли катастрофоустойчивость
                dr(component(X), false), ! % если катастрофоустойчивость отсутсвует
                ; dr(component(X), type(T2), level(L2)), capacity_type(_, T2), capacity_level(_, L2), !  % если катастрофоустойчивость есть, то ее параметры должны быть указан из соответсвующих справочников
            ), write("Параметры катастрофоустойчивости указаны верно"), nl, ! % иначе сообщить об ошибке
            ; write("Ошибка: неверно указаны параметры катастрофоустойчивости"), nl % иначе сообщить об ошибке
        ),
        (   % анализ параметров бэкапирования
            (   % должно быть явно указано, есть бэкапирование
                backup(component(X), false), ! % если бэкапирование отсутсвует
                ; backup(component(X), location(BL), duplicate(D)), backup_location(_, BL), backup_location(_, D), ! % если бэкапирование есть, то его параметры должны быть указан из соответсвующих справочников
            ),  write("Параметры бэкапироания указаны верно"), nl, !
            ; write("Ошибка: неверно указаны параметры бэкапирования"), nl
        ),
        string(monitoring, component(X)), ! % проверитЬ, что указан мониторинг
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ бизнес процесса
explain(process(X)):-
    write("Бизнес процесс "), write(X), 
    (
        process(X) -> % если бизнес процесс определен в базе знаний
        write(" определен"), nl, 
        string(name, process(X)), % проверить, что задано наименование
        string(description, process(X)), % проверить, что задано описание
        (   % анализ обеспечивающих систем
            use(process(X), system(S)) -> % если указаны системы, которые обеспечивают бизнес процесс
            findall(S, use(process(X), system(S)), LS), forall(member(S, LS), explain(system(S))), ! % перейти к анализу указанных систем
            ; write("Ошибка: не указаны системы, которые обеспечивают бизнес процесс"), nl % иначе сообщить об ошибке
        ),
        (   % анализ реализуемых продуктов
            use(process(X), product(P)) -> % если указаны продукты, которые реализует бизнес процсс
            findall(P, use(process(X), product(P)), LP), forall(member(P, LP), explain(product(P))), ! % перейти к анализу указанных продуктов
            ; write("Ошибка: не указаны продукты, реализуемые бизнес процессом"), nl % иначе сообщить об ошибке
        ),
        (   % анализ обеспечивающих интеграционных потоков
            use(process(X), integration(I)) ->  % если указаны интеграционные потоки, которые обеспечивают бизнес процесс
            findall(I, use(process(X), integration(I)), LI), forall(member(I, LI), explain(integration(I))), ! % перейти к анализу указанных интеграционных потоков
            ; write("Ошибка: не указаны интеграционные потоки, которые обеспечивают бизнес процесс"), nl % иначе сообщить об ошибке
        ),
        (   % анализ используемых бизнес объектов
            use(process(X), object(O)) -> % если указаны бизнес объекты, которые использует бизнес процесс
            findall(O, use(process(X), object(O)), LO), forall(member(O, LO), explain(object(O))), ! % перейти к анализу указанных бизнес объектов
            ; write("Ошибка: не указаны бизнес объекты, которые использует бизнес процесс"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% значение X является непустой строкой
string(X):-
    string(X), string_length(X, Y), Y>0.    

% значение X является положительным числом (целым или дробным)
positive(X):-
    number(X), X>0.

% значение X определено в справочнике L
listed(X, L):-
    call(L, _, X).

% Анализ параметра Т, значение Х которого должно быть строкой
string(T, X):-
    (
        call(T, X, V) ->
        write("Обязательный параметр "), write(T), write(" найден"), nl,
        (
            string(V) ->
            write("Тип обязательного параметра "), write(T), write(" ok"), nl, 
            (
                string_length(V, L), L>0 ->
                write("Значение обязательного параметра "), write(T), write(" ok"), nl, !
                ; write("Ошибка: длинна строки должна быть больше нуля"), nl
            ), !
            ; write("Ошибка: должно быть строковое значение "), write(V), nl
        ), !
        ; write("Ошибка: отсутствует обязательный параметр "), write(T), nl
    ).

% Анализ параметра T, значение X которого должно быть положительным числом
positive(T, X):-
    (
        call(T, X, V) ->
        write("Обязательный параметр "), write(T), write(" найден"), nl,
        (
            number(V) ->
            write("Тип обязательного параметра "), write(T), write(" ok"), nl, 
            (
                V>0 ->
                write("Значение обязательного параметра "), write(T), write(" ok"), nl, !
                ; write("Ошибка: значение должно быть положительным "), write(V), nl
            ), !
            ; write("Ошибка: должно быть численное значение "), write(V), nl
        ), !
        ; write("Ошибка: отсутствует обязательный параметр "), write(T), nl
    ).

% Анализ параметра T, значение X которого должно быть из справочника L
list(T, X, L):-
    (
        call(T, X, V) ->
        write("Обязательный параметр "), write(T), write(" найден"), nl,
        (
            call(L, _, V) ->
            write("Значение обязательного параметра "), write(T), write(" ok"), !
            ; write("Ошибка: значение справочника задано неверно "), write(V), nl
        ), !
        ; write("Ошибка: отсутствует обязательный параметр "), write(T), nl
    ), nl.

