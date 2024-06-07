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

% справочник типов систем (Р11)
system_type(1, "Внутреняя").
system_type(2, "Внешняя").

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

% проверка валидности цели компании (Р01)
valid(goal(X)):-
    goal(X), % должна быть определена как цель
    description(goal(X), _), % должно быть задано описание
    horizon(goal(X), _). % должен быть задан горизонт

% проверка валидности стратегической задачи (Р02)
valid(strategy(X)):-
    strategy(X), % должна быть определена как стратегическая задача
    description(strategy(X), _), % должно быть задано описание
    horizon(strategy(X), _), % должен быть определен горизонт
    realize(strategy(X), goal(Goal)), valid(goal(Goal)). % должна быть связана с валидной целью

% проверка валидности задачи и плана (Р09)
valid(task(X)):-
    task(X), % должна быть определена как задача
    description(task(X), _), % должно быть задано описание
    deadline(task(X), _), % должен быть задан срок
    status(task(X), Status), task_status(_, Status), % должен быть определен статус из соответствующего справочника
    realize(task(X), strategy(Strategy)), valid(strategy(Strategy)). % должна быть связана с валидной стратегической задачей

% проверка валидности клиента (Р03)
valid(client(X)):-
    client(X), % должен быть определен как клиент
    description(client(X), _), % должно быть задано описание
    type(client(X), T), client_type(_, T), % должен быть определен статус из соотвествующего справочника
    count(client(X), C), C>0. % количество должно быть определено и значение должно быть положительным

% проверка валидности продукта (Р04)
valid(product(X)):-
    product(X), % должен быть определен как продукт
    name(product(X), _), % должно быть указано наименование
    description(product(X), _), % должно быть указано описание
    status(product(X), S), product_status(_, S). % должен быть указан статус из соотвествующего справочника

% проверка валидности канала (Р05)
valid(channel(X)):-
    channel(X), % должен быть определен как канал
    name(channel(X), _), % должно быть указано наименование
    type(channel(X), T), channel_type(_, T), % должен быть указан тип из соотвествующего справочника
    location(channel(X), L), channel_location(_, L), % должно быть указано размещение из соотвествующего справочника
    description(channel(X), _), % должно быть указано описание
    status(channel(X), S), channel_status(_, S), % должен быть указан статус из соотвествующего справочника
    security(channel(X), _), % должны быть указаны способы защиты
    (   % проверка клиентов
        client(channel(X), client(_)) -> % если указаны клиенты, обслуживаемые в канале
        findall(C, client(channel(X), client(C)), LC), % найти клиентов
        forall(member(C, LC), valid(client(C))), ! % все найденные клиенты должны быть валидны
        ; fail % инача завершить проверку с ошибкой
    ),
    (   % проверка продуктов
        product(channel(X), product(_)) -> % если указаны продукты, поставляемые в канале
        findall(P, product(channel(X), product(P)), LP), % найти продукты
        forall(member(P, LP), valid(product(P))), ! % все указанные продукты должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ).
 
% проверка валидности группы систем (P12)
valid(group(X)):-
    group(X), % должна быть определена как группа систем 
    name(group(X), _), % должно быть указано наименование
    (   % проверка родительской группы
        parent(group(X), group(_)) -> % если указана родительская группа систем
        findall(G, parent(group(X), group(G)), L), % найти родительские группы
        forall(member(G, L), valid(group(G))), ! % проверить, что родительские группы валидны
        ; ! % иначе завершить проверку без ошибки
    ).

% проверка валидности системы (Р11)
valid(system(X)):-
    system(X), % должна быть определена как система
    name(system(X), _), % должно быть определено наименование
    description(system(X), _), % должно быть определено описание
    (   % проверка группы систем
        group(system(X), group(_)) -> % если указана группа систем
        findall(G, group(system(X), group(G)), LG), % выбрать указанные группы систем
        forall(member(G, LG), valid(group(G))), ! % проверить, что они валидны
        ; fail % иначе завершить проверку группы с ошибкой
    ), 
    ownership(system(X), O), system_ownership(_, O), % должна быть степень владения из соотвествующего справочника
    class(system(X), Cl), system_class(_, Cl), % должен быть указан класс систем из соотвествующего справочника
    (   % проверка внутренних и внешних систем
        internal(system(X)), % если система указана как внутреняя
        status(system(X), S), system_status(_, S), % должен быть указан статус системы из соотвествующего справочника (только для внутренних систем)
        change(system(X), C), change_type(_, C), % должен быть указан тип изменений систем из соотвествующего справочника (только для внутренних сиcтем) 
        current(system(X), L1), lifecycle(_, L1), % должен быть указан текущий этап ЖЦ системы из соотвествующего справочника (только для внутренних сиcтем) 
        plan(system(X), P), lifecycle(_, P), % должен быть указан этап ЖЦ системы на горизонт проектирования (только для внутренних сиcтем)
        level(system(X), L2), criticality(_, L2), % должен быть указан уровень критичности системы из соответствующего справочника (только для внутренних сиcтем)
        performance(system(X), _), % должна быть указана производительность (только для внутренних сиcтем)
        availability(system(X), _), % должна быть указана доступность (только для внутренних сиcтем)
        rto(system(X), _), % должно быть указано значение RTO (только для внутренних сиcтем)
        rpo(system(X), _), % должно быть указано значение RPO (только для внутренних сиcтем)
        monitoring(system(X), _), % должны быть указаны средства мониторинга (только для внутренних сиcтем)
        changes(system(X), _), ! % должно быть указано описание изменений (только для внутренних сиcтем) 
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
    function(X), % должна быть определена как функциональность
    name(function(X), _), % должно быть задано наименование
    description(function(X), _), % должно быть задано описание
    target(function(X), L), target_location(_, L), % должно быть указано целевое размещение из соответсвующего справочника
    status(function(X), Y), function_status(_, Y), % должен быть указан статус
    (   % проверка систем
        system(function(X), system(_)) -> % если указаны системы
        findall(S, system(function(X), system(S)), LS), % найти системы
        forall(member(S, LS), valid(system(S))), ! % все найденные системы должны быть валидны
        ; fail % иначе завершить проверку с ошибкой
    ).

% выбрать из базы знаний системы, которые использует бизнес процесс
systems(process(Process), system(System)):-
    process(Process), use(process(Process), system(System)), system(System).

% выбрать из базы знаний продукты, которые реализует бизнес процесс
products(process(Process), product(Product)):-
    process(Process), use(process(Process), product(Product)), product(Product).

% выбрать из базы знаний интеграционные потоки, которые использует бизнес процесс
integrations(process(Process), integration(Integration)):-
    process(Process), use(process(Process), integration(Integration)), integration(Integration).

% выбрать из базы знаний бизнес объекты, которые использует бизнес процесс
objects(process(Process), object(BusinessObject)):-
    process(Process), use(process(Process), object(BusinessObject)), object(BusinessObject).

% проверка валидности бизнес процесса
valid(process(X)):-
    process(X), % должен быть определен как бизнес процесс
    name(process(X), _), % должно быть указано наименование
    description(process(X), _), % должно быть указано описание
    (   % проверка обеспечивающих систем
        use(process(X), system(S)) -> % если бизнес процесс использует системы
        findall(S, systems(process(X), system(S)), LS), forall(member(S, LS), valid(system(S))), ! % выбрать системы и проверить, что они валидны
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка используемых продуктов
        use(process(X), product(P)) -> % если бизнес процесс использует продукты
        findall(P, products(process(X), product(P)), LP), forall(member(P, LP), valid(product(P))), ! % выбрать продукты и проверить, что они валидны
        ; fail % иначе завершить проверку с ошибкой
    ),
    (
        % проверка используемых интеграционных потоков
        use(process(X), integration(I)) -> % если бизнес процесс использует интеграции
        findall(I, integrations(process(X), integration(I)), LI), forall(member(I, LI), valid(integration(I))), ! % выбрать интеграции и проверить, что они валидны
        ; fail % иначе завершить проверку с ошибкой
    ), 
    (
        % проверка реаизуемых бизнес объектов
        use(process(X), object(O)) -> % если бизнес процесс использует бизнес объекты
        findall(O, objects(process(X), object(O)), LO), forall(member(O, LO), valid(object(O))), ! % выбрать бизнес объекты и проверить, что они валидны
        ; fail % иначе завершить проверку с ошибкой
    ).

% проверка валидности бизнес объекта (Р07)
valid(object(X)):-
    object(X), % должен быть определен как бизнес данных
    name(object(X), _), % должно быть задано наименование
    status(object(X), Y), change_type(_, Y). % должен быть указан статус изменений из соотвествующего справочника

% проверка валидности объекта данных (Р08)
valid(data(X)):-
    data(X), % должен быть определен как объект данных
    name(data(X), _), % должно быть задано наименование
    category(data(X), C), data_category(_, C), % должна быть определена категория данных из соответсвующего справочника
    status(data(X), Y), change_type(_, Y), % должен быть указан статус изменений из соотвествующего справочника
    system(data(X), S), valid(system(S)), % должна быть указана валидная мастер система
    parent(data(X), B), valid(object(B)). % должен быть указан валидный родительский бизнес объект  

% проверка валидности интеграционного потока (Р14)
valid(integration(X)):-
    integration(X), % должен быть определен как интеграционный поток
    description(integration(X), _), % должно быть задано описание
    source(integration(X), system(From)), valid(system(From)), % должна быть указана система источник данных
    destination(integration(X), system(To)), valid(system(To)), % должна быть указана система потребитель данных
    (   % проверка объектов данных
        transmit(integration(X), data(_)) -> % если указаны передаваемые объекты данных
        findall(B, transmit(integration(X), data(B)), LB), % найти объекты данных
        forall(member(B, LB), valid(data(B))), ! % все объекты данных должны быть валидны
       ; fail % иначе ошибка
    ),
    technology(integration(X), _), % должна быть указана технологич интеграции
    mode(integration(X), M), integration_mode(_, M), % должен быть указан механизм использования из соответсвующего справочника
    load(integration(X), max(_), avg(_)), % должны быть указаны максимальные и средние нагрузочные характеристики
    (   % проверка асинхронности интеграционного потока
        synch(integration(X)), ! % поток может быть синхронным
        ; asynch(integration(X)), ! % поток может быть асинхронным
        ; fail % иначе завершить проверку с ошибкой
    ),
    status(integration(X), S), integration_status(_, S), % должен быть указан статус из соответсвующего справочника
    security(integration(X), _). % должны быть указаны средства защиты

% проверка валидности технического компонента (Р16)
valid(component(X)):-
    component(X), % должен быть определен как компонент
    system(component(X), system(S)), valid(system(S)), % должена быть задана валидная система
    type(component(X), T), component_type(_, T), % должен быть указан тип компонента из соответсвующего справочника
    software(component(X), _), % должно быть указано прикладное ПО
    vendor(component(X), _), % должен быть указан вендор
    scalability(component(X), Sc), component_scalability(_, Sc), % должен быть указан тип масштабируемости
    (   % проверка параметров отказоустойчивости
        ha(component(X), false), ! % если высокая доступность отсуствует
        ; ha(component(X), type(T1), level(L1)), capacity_type(_, T1), capacity_level(_, L1), ! % если указана высокая доступность, то должны быть корректно указаны тип и полнота резервирования
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка параметров катастрофоустойчивости
        dr(component(X), false), ! % если катастрофоустойчивость отсуствует
        ; dr(component(X), type(T2), level(L2)), capacity_type(_, T2), capacity_level(_, L2), ! % если указана катастрофоустойчивость, то должны быть корректно указаны тип и полнота резервирования
        ; fail % иначе завершить проверку с ошибкой
    ),
    (   % проверка параметров бэкапирования
        backup(component(X), false), ! % если бэкапирование отсутсвует
        ; backup(component(X), location(L3), duplicate(L4)), backup_location(_, L3), backup_location(_, L4), ! % если указано бэкапирование, то должны быть корректно указаны место хранения основной копии и дубликата
        ; fail % иначе завершить проверку с ошибкой
    ),
    monitoring(component(X), _). % должен быть указан мониторинг

% анализ цели (P01)
explain(goal(X)):-
    write("Цель "), write(X), write(" "),
    (
        goal(X) -> % если цель определена
        write(" определена"), nl, 
        validate(description, goal(X)), % проверить, что задано описание
        validate(horizon, goal(X)),  ! % проверить, что задан горизон
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ стратегической задачи (P02)
explain(strategy(X)):-
    write("Стратегическая задача "), write(X), write(" "),
    (
        strategy(X) -> % если стратегическая задача определена
        write(" определена"), nl, 
        validate(description, strategy(X)), % проверить, что задано описание
        validate(horizon, strategy(X)), % проверить, что задан горизонт
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
        task(X) -> % если задача определена
        write(" определена"), nl, 
        validate(description, task(X)), % проверить, что задано описание
        validate(deadline, task(X)),  % проверить, что задан срок
        validate(status, task(X), task_status), % проверить, что задан статус из соотвествующего справочника
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
        client(X) -> % если клиент определен
        write(" определен"), nl, 
        validate(description, client(X)), % проверить, что задано описание
        validate(type, client(X), client_type), % проверить, что задан тип из соотвествующего справочника
        validate(count, client(X)), % проверить, что задано количество
        (   % анализ количества клиентов
            count(client(X), C), C>0 -> % если указано количество
            ! % завершить анализ
            ; write("Ошибка: неверно указано количество, должно быть больше нуля"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ продукта (P04)
explain(product(X)):-
    write("Продукт "), write(X),
    (
        product(X) -> % если продукт определен
        write(" определен"), nl, 
        validate(name, product(X)), % проверить, что задано наименование
        validate(description, product(X)), % проверить, что задано описание
        validate(status, product(X), product_status), ! % проверить, что задан статус из соотвествующего справочника
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ канала (P05)
explain(channel(X)):-
    write("Канал "), write(X), nl,
    (
        channel(X) -> % если клиент определен
        write(" определен"), nl, 
        validate(name, channel(X)), % проверить, что задано наименование
        validate(description, channel(X)), % проверить, что задано описание
        validate(type, channel(X), channel_type), % проверить, что задан тип из соотвествующего справочника
        validate(location, channel(X), channel_location), % проверить, что размещение задано из соотвествующего справочника
        validate(status, channel(X), channel_status), % проверить, что статус задан из соотвествующего справочника
        validate(security, channel(X)), % проверить, что заданы средства защиты  
        (
            client(channel(X), client(_)) -> % если указаны обслуживаемые клиенты
            findall(C, client(channel(X), client(C)), LC), % найти обслуживаемых клиентов
            forall(member(C, LC), explain(client(C))), ! %  перейти к анализу обслуживаемых клиентов
            ; write("Ошибка: не указаны обслуживаемые клиенты"), nl % иначе сообщить об ошибке
        ),
        (
            product(channel(X), product(_)) -> % если указаны поставляемые продукты
            findall(P, product(channel(X), product(P)), LP), % найти поставляемые продукты
            forall(member(P, LP), explain(product(P))), ! % перейти к анализу поставляемых продуктов
            ; write("Ошибка: не указаны поставляемые продукты"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ группы систем (P12)
explain(group(X)):-
    write("Группа систем "), write(X),
    (
        group(X) -> % если группа систем определена
        write(" + "), nl, 
        validate(name, group(X)), % проверить, что задано наименование
        (   % анализ родительской группы
            parent(group(X), group(_)) -> % если указана родительская группа систем
            findall(G, parent(group(X), group(G)), L), % найти родительские группы
            forall(member(G, L), explain(group(G))), ! % перейти к их анализу
            ; ! % иначе завершить анализ родительской группы
        ), ! % завершить анализ
        ; write(" - "), nl % иначе сообщить об ошибке
    ).

% анализ системы (Р11)
explain(system(X)):-
    write("["), write(X), write("]"),
    (   % анализ системы
        system(X) -> % если система определена
        write(" + "), nl,
        validate(name, system(X)), % проверить, что задано наименование
        validate(description, system(X)), % проверить, что задано описание  
        (   % анализ группы систем
            group(system(X), group(_)) -> % если указана группа систем
            findall(G, group(system(X), group(G)), LG), % выбрать указанные группы
            forall(member(G, LG), explain(group(G))), ! % перейти к анализу выбранных групп
            ; write("Ошибка: не указана группа систем"), nl % сообщить об ошибке
        ),
        validate(ownership, system(X), system_ownership), % проверить, что задана степень владения
        validate(class, system(X), system_class), % проверть, что задан класс систем
        (   % анализ внутренних и внешних систем           
            internal(system(X)), % если система объявлена как внутреняя
            validate(status, system(X), system_status), % проверить, что задан статус системы из соответсвующего справочника
            validate(change, system(X), change_type), % проверить, что задан тип изменений из соответсвующего справочника
            validate(current, system(X), lifecycle), % проверить, что задан текущий этап ЖЦ из соответсвующего справочника
            validate(plan, system(X), lifecycle), % проверить, что задан этап ЖЦ на горизонт проектирования из соответсвующего справочника
            validate(level, system(X), criticality), % проверить, что задан уровень критичности из соответсвующего справочника
            validate(performance, system(X)), % проверить, что задана производительность
            validate(availability, system(X)), % проверить, что задана доступность
            validate(rto, system(X)), % проверить, что задано значение RTO
            validate(rpo, system(X)), % проверить, что задано значение RPO
            validate(monitoring, system(X)), % проверить, что заданы средства мониторинга
            validate(changes, system(X)), ! % проверить, что задано описание изменений
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
        function(X) -> % если функциональность определена
        write(" определена"), nl, 
        validate(name, function(X)), % проверить, что задано наименование
        validate(description, function(X)), % проверить, что задано описание
        validate(target, function(X), target_location), % проверить, что задано целевое размещение
        validate(status, function(X), function_status), % проверить, что задан статус
        (   % анализ систем
            system(function(X), system(_)) -> % если указана система
            findall(S, system(function(X), system(S)), LS), % найти системы
            forall(member(S, LS), explain(system(S))), ! % перейти к их анализу
            ; write("Ошибка: не указаны системы, в которых реализована функциональность"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определена"), nl % иначе сообщить об ошибке
    ).

% анализ бизнес объекта (P07)
explain(object(X)):-
    write("Бизнес объект "), write(X), write(" "),
    (
        object(X) -> % если бизнес объект определен
        write(" определен"), nl, 
        validate(name, object(X)), % проверить, что задано наименование
        validate(status, object(X), change_type), ! % проверить, что задан статус из соответсвующего справочника
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ объекта данных (P08)
explain(data(X)):-
    write("Объект данных "), write(X), write(" "),
    (
        data(X) -> % если объект данных определен
        write(" определен"), nl, 
        validate(name, data(X)), % проверить, что задано наименование
        validate(status, data(X), change_type), % проверить, что задан статус из соответсвующего справочника
        validate(category, data(X), data_category), % проверить, что задана категория данных из соотвествующего справочника
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
    write("Интеграционный поток "), write(X), write(" "),
    (
        integration(X) -> % если интеграционный поток определен
        write(" определен"), nl, 
        validate(description, integration(X)), % проверить, что задано описание
        (   % анализ источникаданных
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
        (   % проверка передаваемых объектов данных
            transmit(integration(X), data(_)) -> % если указаны передаваемые объекты данных
            findall(B, transmit(integration(X), data(B)), LB), % выбрать указанные объекты данных
            forall(member(B, LB), explain(data(B))), ! % перейти к анализу объектов данных 
            ; write("Ошибка: не указаны передаваемые объекты данных"), nl % иначе сообщить об ошибке
        ),
        validate(technology, integration(X)), % проверить, что задано описание
        validate(mode, integration(X), integration_mode), % проверить, что задан механизм использования из соответсвующего справочника
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
        validate(status, integration(X), integration_status), % проверить, что указан статус
        validate(security, integration(X)), ! % проверить, что указаны средства защиты
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ технического компонента (Р16)
explain(component(X)):- 
    write("Компонент "), write(X), write(" "),
    (
        component(X) -> % если компонент определен
        write(" определен"), nl, 
        (   % анализ системы
            system(component(X), system(S)) -> % если указана система
            explain(system(S)), ! % перейти к анализу системы
            ; write("Ошибка: должна быть указана система"), nl % иначе сообщить об ошибке
        ),
        validate(type, component(X), component_type), % проверить, что задан тип компоненты из соответсвующего справочника
        validate(software, component(X)), % проверить, что задано прикладное ПО
        validate(vendor, component(X)), % проверить, что задан вендор
        validate(scalability, component(X), component_scalability), % проверить, что задан тип масштабируемости из соответсвующего справочника
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
        validate(monitoring, component(X)), ! % проверитЬ, что указан мониторинг
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

% анализ бизнес процесса
explain(process(X)):-
    write("Бизнес процесс "), write(X), write(" "),
    (
        process(X) -> % если бизнес процесс определен
        write(" определен"), nl, 
        validate(name, process(X)), % проверить, что задано наименование
        validate(description, process(X)), % проверить, что задано описание
        (   % анализ обеспечивающих систем
            use(process(X), system(S)) -> % если бизнес процесс использует системы
            findall(S, systems(process(X), system(S)), LS), forall(member(S, LS), explain(system(S))), ! % выбрать системы и перейти к их анализу
            ; write("Ошибка: не указаны системы, которые обеспечивают бизнес процесс"), nl % иначе сообщить об ошибке
        ),
        (   % анализ используемых продуктов
            use(process(X), product(P)) -> % если бизнес процесс использует продукты
            findall(P, products(process(X), product(P)), LP), forall(member(P, LP), explain(product(P))), ! % выбрать продукты и перейти к их анализу
            ; write("Ошибка: не указаны продукты, реализуемые бизнес процессом"), nl % иначе сообщить об ошибке
        ),
        (   % анализ используемых интеграционных потоков
            use(process(X), integration(I)) ->  % если бизнес процесс использует интеграционные потоки
            findall(I, integrations(process(X), integration(I)), LI), forall(member(I, LI), explain(integration(I))), ! % найти интеграционные потоки и перейти к их анализу
            ; write("Ошибка: не указаны интеграционные потоки, которые обеспечивают бизнес процесс"), nl % иначе сообщить об ошибке
        ),
        (   % анализ используемых бизнес объектов
            use(process(X), object(O)) -> % если бизнес процесс использует бизнес объекты
            findall(O, objects(process(X), object(O)), LO), forall(member(O, LO), explain(object(O))), ! % найти бизнес объекты и перейти к их анализу
            ; write("Ошибка: не указаны бизнес объекты, которые использует бизнес процесс"), nl % иначе сообщить об ошибке
        ), ! % завершить анализ
        ; write(" не определен"), nl % иначе сообщить об ошибке
    ).

