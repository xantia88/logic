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
    goal(X), % должна быть определена в базе знаний как цель компании
    description(goal(X), Description), string(Description), % должно быть задано описание, значение должно быть строкой
    horizon(goal(X), Horizon), string(Horizon). % должен быть задан горизонт, значение должно быть строкой

% проверка валидности стратегической задачи (Р02)
valid(strategy(X)):-
    strategy(X), % должна быть определена в базе знаний как стратегическая задача
    description(strategy(X), Description), string(Description), % должно быть задано описание, значение должно быть строкой
    horizon(strategy(X), Horizon), string(Horizon), % должен быть определен горизонт, значение должно быть строкой
    realize(strategy(X), goal(Goal)), valid(goal(Goal)). % должна быть связана с валидной целью

% проверка валидности задачи и плана (Р09)
valid(task(X)):-
    task(X), % должна быть определена в базе знаний как задача
    description(task(X), Description), string(Description), % должно быть задано описание, значение должно быть строкой
    deadline(task(X), Deadline), string(Deadline), % должен быть задан срок, значение должно быть строкой
    status(task(X), Status), listed(Status, task_status), % должен быть определен статус из соответствующего справочника
    realize(task(X), strategy(Strategy)), valid(strategy(Strategy)). % должна быть связана с валидной стратегической задачей

% проверка валидности клиента (Р03)
valid(client(X)):-
    client(X), % должен быть определен в базе знаний как клиент
    description(client(X), Description), string(Description), % должно быть задано описание, значение должно быть строкой
    type(client(X), Type), listed(Type, client_type), % должен быть определен статус из соотвествующего справочника
    count(client(X), Count), positive(Count). % количество должно быть определено и значение должно быть положительным числом

% проверка валидности продукта (Р04)
valid(product(X)):-
    product(X), % должен быть определен в базе знаний как продукт
    name(product(X), Name), string(Name), % должно быть указано наименование, значение должно быть строкой
    description(product(X), Description), string(Description), % должно быть указано описание, значение должно быть строкой
    status(product(X), Status), listed(Status, general_status). % должен быть указан статус из соотвествующего справочника

% проверка валидности канала (Р05)
valid(channel(X)):-
    channel(X), % должен быть определен в базе знаний как канал
    name(channel(X), Name), string(Name), % должно быть указано наименование, значение должно быть строкой
    type(channel(X), Type), listed(Type, channel_type), % должен быть указан тип из соотвествующего справочника
    description(channel(X), Description), string(Description), % должно быть указано описание, значение должно быть строкой
    status(channel(X), Status), listed(Status, general_status), % должен быть указан статус из соотвествующего справочника
    security(channel(X), Security), string(Security), % должны быть указаны способы защиты, значение должно быть строкой
    (   % проверка размещения
        internal(channel(X)), ! % может быть внутренним
        ; external(channel(X)), ! % может быть внешним
    ),   
    (   % проверка поставляемых в канале продуктов
        findall(Product, product(channel(X), product(Product)), Products), many(Products), % должен быть указан хотя бы один продукт
        forall(member(Product, Products), valid(product(Product))) % все указанные продукты должны быть валидны
    ),
    (   % проверка обслуживаемых в канале клиентов
        findall(Client, client(channel(X), client(Client)), Clients), many(Clients), % должен быть указан хотя бы один клиент
        forall(member(Client, Clients), valid(client(Client))) % все указанные клиенты должны быть валидны
    ),
    (   % проверка доступных в канале систем
        findall(System, system(channel(X), system(System)), Systems), many(Systems), % должна быть указана хотя бы одна системы
        forall(member(System, Systems), valid(system(System))) % все указанные системы должны быть валидны
    ).
 
% проверка валидности группы систем (P12)
valid(group(X)):-
    group(X), % должна быть определена в базе знаний как группа систем 
    name(group(X), Name), string(Name), % должно быть указано наименование, значение должно быть строкой
    (
        findall(Group, parent(group(X), group(Group)), Groups), any(Groups), % если указаны родительские группы систем
        forall(member(Group, Groups), (X\=Group, valid(group(Group)))) % все указанные группы систем должны быть валидны
    ).

% проверка валидности системы (Р11)
valid(system(X)):-
    system(X), % должна быть определена в базе знаний как система
    name(system(X), Name), string(Name), % должно быть определено наименование, значение должно быть строкой
    description(system(X), Description), string(Description), % должно быть определено описание, значение должно быть строкой
    ownership(system(X), Ownership), listed(Ownership, system_ownership), % должна быть степень владения из соотвествующего справочника
    class(system(X), Class), listed(Class, system_class), % должен быть указан класс систем из соотвествующего справочника
    (   % проверка внутренних и внешних систем
        internal(system(X)), % если система указана как внутреняя
        status(system(X), Status), listed(Status, system_status), % должен быть указан статус системы из соотвествующего справочника (только для внутренних систем)
        change(system(X), Change), listed(Change, change_type), % должен быть указан тип изменений систем из соотвествующего справочника (только для внутренних сиcтем) 
        current(system(X), CurrentState), listed(CurrentState, lifecycle), % должен быть указан текущий этап ЖЦ системы из соотвествующего справочника (только для внутренних сиcтем) 
        plan(system(X), PlanState), listed(PlanState, lifecycle), % должен быть указан этап ЖЦ системы на горизонт проектирования (только для внутренних сиcтем)
        level(system(X), Level), listed(Level, criticality), % должен быть указан уровень критичности системы из соответствующего справочника (только для внутренних сиcтем)
        performance(system(X), Performance), string(Performance), % должна быть указана производительность (только для внутренних сиcтем), значение должно быть строкой
        availability(system(X), Availability), string(Availability), % должна быть указана доступность (только для внутренних сиcтем), значение должно быть строкой
        rto(system(X), Rto), string(Rto), % должно быть указано значение RTO (только для внутренних сиcтем), значение должно быть строкой
        rpo(system(X), Rpo), string(Rpo), % должно быть указано значение RPO (только для внутренних сиcтем), значение должно быть строкой
        monitoring(system(X), Monitoring), string(Monitoring), % должны быть указаны средства мониторинга (только для внутренних сиcтем), значение должно быть строкой
        changes(system(X), Changes), string(Changes), ! % должно быть указано описание изменений (только для внутренних сиcтем), значение должно быть строкой 
        ; external(system(X)), ! % если система указана как внешняя - завершить проверку
    ),
    (   % проверка родительской системы (для ФП)
        parent(system(X), system(Parent)) -> % если указана родительская система
        X\=Parent, % система не должна ссылаться на саму себя
        not(parent(system(Parent), system(Parent2))), system(Parent2), % родительской системой не может быть ФП
        valid(system(Parent)), ! % указанная родительская система должна быть валидна
        ; ! % иначе завершить проверку родительской системы
    ),
    (   % проверка группы систем
        findall(Group, group(system(X), group(Group)), Groups), many(Groups), % должна быть указана хотя бы одна группа систем 
        forall(member(Group, Groups), valid(group(Group))) % все указанные группы систем должны быть валидны
    ). 

% проверка валидности функциональности (Р10)
valid(function(X)):-
    function(X), % должна быть определена в базе знаний как функциональность
    name(function(X), Name), string(Name), % должно быть задано наименование, значение должно быть строкой
    description(function(X), Description), string(Description), % должно быть задано описание, значение должно быть строкой
    target(function(X), Location), listed(Location, target_location), % должно быть указано целевое размещение из соответсвующего справочника
    status(function(X), Status), listed(Status, function_status), % должен быть указан статус из соответсвующего справочника
    (   % проверка систем
        findall(System, system(function(X), system(System)), Systems), many(Systems), % должна быть указана хотя бы одна система
        forall(member(System, Systems), valid(system(System))) % все указанные системы должны быть валидны
    ).

% проверка валидности бизнес процесса
valid(process(X)):-
    process(X), % должен быть определен в базе знаний как бизнес процесс
    name(process(X), Name), string(Name), % должно быть указано наименование, значение должно быть строкой
    description(process(X), Description), string(Description), % должно быть указано описание, значение должно быть строкой
    (   % проверка обеспечивающих систем
        findall(System, use(process(X), system(System)), Systems), many(Systems), % должна быть указана хотя бы одна система 
        forall(member(System, Systems), valid(system(System))) % все указанные системы должны быть валидны
    ),
    (   % проверка реализуемых продуктов
        findall(Product, use(process(X), product(Product)), Products), many(Products), % должен быть указан хотя бы один реализуемый продукт 
        forall(member(Product, Products), valid(product(Product))) % все указаныне продукты должны быть валидны
    ),
    (   % проверка обеспечивающих интеграционных потоков
        findall(Integration, use(process(X), integration(Integration)), Integrations), many(Integrations), % должен быть указан хотя бы один интеграционный поток 
        forall(member(Integration, Integrations), valid(integration(Integration))) % все указанные интеграционные потоки должны быть валидны
    ), 
    (   % проверка используемых бизнес объектов
        findall(Object, use(process(X), object(Object)), Objects), many(Objects), % должен быть указан хотя бы один бизнес объект
        forall(member(Object, Objects), valid(object(Object))) % все указанные бизнес объекты должны быть валидны
    ).

% проверка валидности бизнес объекта (Р07)
valid(object(X)):-
    object(X), % должен быть определен в базе знаний как бизнес объект
    name(object(X), Name), string(Name), % должно быть задано наименование, значение должно быть строкой
    status(object(X), Status), listed(Status, change_type). % должен быть указан статус изменений из соотвествующего справочника

% проверка валидности объекта данных (Р08)
valid(data(X)):-
    data(X), % должен быть определен в базе знаний как объект данных
    name(data(X), Name), string(Name), % должно быть задано наименование, значение должно быть строкой
    category(data(X), Category), listed(Category, data_category), % должна быть определена категория данных из соответсвующего справочника
    status(data(X), Status), listed(Status, change_type), % должен быть указан статус изменений из соотвествующего справочника
    system(data(X), System), valid(system(System)), % должна быть указана валидная мастер система
    parent(data(X), Object), valid(object(Object)). % должен быть указан валидный родительский бизнес объект  

% проверка валидности интеграционного потока (Р14)
valid(integration(X)):-
    integration(X), % должен быть определен в базе знаний как интеграционный поток
    description(integration(X), Description), string(Description), % должно быть задано описание, значение должно быть строкой
    source(integration(X), system(Source)), valid(system(Source)), % должна быть указана система источник данных
    destination(integration(X), system(Destination)), valid(system(Destination)), % должна быть указана система потребитель данных
    technology(integration(X), Technology), string(Technology), % должна быть указана технология интеграции, значение должно быть строкой
    mode(integration(X), Mode), listed(Mode, integration_mode), % должен быть указан механизм использования из соответсвующего справочника
    load(integration(X), max(MaximumLoad), avg(AverageLoad)), string(MaximumLoad), string(AverageLoad), % должны быть указаны максимальные и средние нагрузочные характеристики, значение должно быть строкой
    status(integration(X), Status), listed(Status, integration_status), % должен быть указан статус из соответсвующего справочника
    security(integration(X), Security), string(Security), % должны быть указаны средства защиты, значение должно быть строкой
    (   % проверка асинхронности интеграционного потока
        synch(integration(X)), ! % поток может быть синхронным
        ; asynch(integration(X)), ! % поток может быть асинхронным
    ),
    (   % проверка передаваемых объектов данных
        findall(DataObject, transmit(integration(X), data(DataObject)), DataObjects), many(DataObjects), % должен быть указан хотя бы один объект данных  
        forall(member(DataObject, DataObjects), valid(data(DataObject))) % все указанные объекты данных должны быть валидны
    ).

% проверка валидности технического компонента (Р16)
valid(component(X)):-
    component(X), % должен быть определен в базе знаний как компонент
    system(component(X), system(System)), valid(system(System)), % должена быть задана валидная система
    type(component(X), Type), listed(Type, component_type), % должен быть указан тип компонента из соответсвующего справочника
    software(component(X), Software), string(Software), % должно быть указано прикладное ПО, значение должно быть строкой
    vendor(component(X), Vendor), string(Vendor), % должен быть указан вендор, значение должно быть строкой
    scalability(component(X), Scalability), listed(Scalability, component_scalability), % должен быть указан тип масштабируемости из соответсвующего справочника
    monitoring(component(X), Monitoring), string(Monitoring), % должен быть указан мониторинг, значение должно быть строкой
    (   % проверка параметров отказоустойчивости
        ha(component(X), false), ! % если высокая доступность отсуствует
        ; ha(component(X), type(HaType), level(HaLevel)), listed(HaType, capacity_type), listed(HaLevel, capacity_level), ! % если указана высокая доступность, то должны быть корректно указаны тип и полнота резервирования
    ),
    (   % проверка параметров катастрофоустойчивости
        dr(component(X), false), ! % если катастрофоустойчивость отсуствует
        ; dr(component(X), type(DrType), level(DrLevel)), listed(DrType, capacity_type), listed(DrLevel, capacity_level), ! % если указана катастрофоустойчивость, то должны быть корректно указаны тип и полнота резервирования
    ),
    (   % проверка параметров бэкапирования
        backup(component(X), false), ! % если бэкапирование отсутсвует
        ; backup(component(X), location(Location), duplicate(Duplicate)), listed(Location, backup_location), listed(Duplicate, backup_location), ! % если указано бэкапирование, то должны быть корректно указаны место хранения основной копии и дубликата
    ).

% проверка валидности системы КБ (Р13)
valid(security(X)):-
    security(X), % должна быть определена в базе знаний как система КБ
    name(security(X), Name), string(Name), % должно быть указано наименование, значение должно быть строкой
    description(security(X), Description), string(Description), % должно быть указано описание, значение должно быть строкой
    class(security(X), Class), listed(Class, security_class), % должен быть указан класс системы КБ из соответсвующего справочника
    status(security(X), Status), listed(Status, general_status), % должен быть указан статус из соответсвующего справочника
    (   % проверка размещения
        internal(security(X)), ! % может быть указана как внутреняя
        ; external(security(X)), ! % может быть указана как внешняя
    ).

% проверка валидности технологического сервиса (Р15)
valid(service(X)):-
    service(X), % должен быть определен в базе знаний как технологический сервис
    name(service(X), Name), string(Name), % должно быть указано наименование, значение должно быть строкой
    description(service(X), Description), string(Description), % должно быть указано описание, значение должно быть строкой
    class(service(X), Class), listed(Class, service_class), % должен быть указан класс технологического сервиса из соответсвующего справочника
    status(service(X), Status), listed(Status, general_status), % должен быть указан статус из соответсвующего справочника
    (   % проверка размещения
        internal(service(X)), ! % может быть указан как внутренний
        ; external(service(X)), ! % может быть указан как внешний
    ).

% анализ цели (P01)
explain(goal(X)):-
    goal(X) -> % если цель определена в базе знаний
    string(description, goal(X)), % проверить, что задано описание
    string(horizon, goal(X)), % проверить, что задан горизон
    ! % завершить анализ
    ; write("Цель компании не определена"), nl. % иначе сообщить об ошибке

% анализ стратегической задачи (P02)
explain(strategy(X)):-
    strategy(X) -> % если стратегическая задача определена в базе знаний
    string(description, strategy(X)), % проверить, что задано описание
    string(horizon, strategy(X)), % проверить, что задан горизонт
    (
        realize(strategy(X), goal(Goal)) -> % если есть связь с целью
        explain(goal(Goal)), ! % перейти к анализу цели
        ; write("Ошибка: не задана цель компании"), nl % иначе сообщить об ошибке
    ), 
    ! % завершить анализ
    ; write("Стратегическая задача не определена"), nl. % иначе сообщить об ошибке

% анализ задачи и плана (P09)
explain(task(X)):-
    task(X) -> % если задача определена в базе знаний
    string(description, task(X)), % проверить, что задано описание
    string(deadline, task(X)),  % проверить, что задан срок
    list(status, task(X), task_status), % проверить, что задан статус из соотвествующего справочника
    (   % анализ стратегической задачи
        realize(task(X), strategy(Strategy)) -> % если задача связана со стратегической задачей
        explain(strategy(Strategy)), ! % перейти к анализу стратегической задачи
        ; write("Ошибка: не определена стратегическая задача"), nl % иначе сообщить об ошибке
    ), 
    ! % завершить анализ
    ; write("Задача не определена"), nl. % иначе сообщить об ошибке

% анализ клиента (P03)
explain(client(X)):-
    client(X) -> % если клиент определен в базе знаний
    string(description, client(X)), % проверить, что задано описание
    list(type, client(X), client_type), % проверить, что задан тип из соотвествующего справочника
    positive(count, client(X)), % проверить, что задано количество
    ! % завершить анализ
    ; write("Клиент не определен"), nl. % иначе сообщить об ошибке

% анализ продукта (P04)
explain(product(X)):-
    product(X) -> % если продукт определен в базе знаний
    string(name, product(X)), % проверить, что задано наименование
    string(description, product(X)), % проверить, что задано описание
    list(status, product(X), general_status), % проверить, что задан статус из соотвествующего справочника
    ! % завершить анализ
    ; write("Продукт не определен"), nl. % иначе сообщить об ошибке

% анализ канала (P05)
explain(channel(X)):-
    channel(X) -> % если клиент определен в базе знаний
    string(name, channel(X)), % проверить, что задано наименование
    string(description, channel(X)), % проверить, что задано описание
    list(type, channel(X), channel_type), % проверить, что задан тип из соотвествующего справочника
    list(status, channel(X), general_status), % проверить, что статус задан из соотвествующего справочника
    string(security, channel(X)), % проверить, что заданы средства защиты  
    (   % анализ размещения
        internal(channel(X)), ! % может быть внутренним
        ; external(channel(X)), ! % может быть внешним
        ; write("Ошибка: должно быть указано размещение канала"), nl % иначе сообщить об ошибке
    ),
    findall(Product, product(channel(X), product(Product)), Products), % выбрать указанные продукты
    (   % анализ поставляемых в канале продуктов
        many(Products) -> % если указан хотя бы один продукт
        forall(member(Product, Products), explain(product(Product))), ! % перейти к анализу указанных продуктов
        ; write("Ошибка: не указаны поставляемые в канале продукты"), nl % иначе сообщить об ошибке
    ),
    findall(Client, client(channel(X), client(Client)), Clients), % выбрать указанных клиентов
    (   % анализ обслуживаемых в канале клиентов
        many(Clients) -> % если указан хотя бы один клиент 
        forall(member(Client, Clients), explain(client(Client))), ! %  перейти к анализу указанных клиентов
        ; write("Ошибка: не указаны обслуживаемые в канале клиенты"), nl % иначе сообщить об ошибке
    ), 
    findall(System, system(channel(X), system(System)), Systems), % выбрать указанные системы
    (   % анализ доступных через канал систем
        many(Systems) -> % если указана хотя бы одна система
        forall(member(System, Systems), explain(system(System))), ! %  перейти к анализу указанных систем
        ; write("Ошибка: не указаны доступные через канал системы"), nl % иначе сообщить об ошибке
    ), 
    ! % завершить анализ
    ; write("Канал не определен"), nl. % иначе сообщить об ошибке

% анализ группы систем (P12)
explain(group(X)):-
    group(X) -> % если группа систем определена в базе знаний
    string(name, group(X)), % проверить, что задано наименование
    findall(Group, parent(group(X), group(Group)), Groups), any(Groups), % если указаны родительские группы систем
    forall(member(Group, Groups),         
        ( % анализ родительской группы
            X=Group -> % если группа ссылается сама на себя
            write("Ошибка: группа не может ссылаться сама на себя"), nl % сообщить об ошибке
            ; explain(group(Group)), ! % иначе перейти к анализу группы
        )
    ),
    ! % завершить анализ
    ; write("Группа систем не определена"), nl. % иначе сообщить об ошибке

% анализ системы (Р11)
explain(system(X)):-
    system(X) -> % если система определена в базе знаний
    string(name, system(X)), % проверить, что задано наименование
    string(description, system(X)), % проверить, что задано описание  
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
    (   % анализ родительской системы
        parent(system(X), system(Parent)) -> % если указана родительская система
        (   % проверка родительской системы
            X=Parent -> % если в качестве родительской системы указана эта же система
            write("Ошибка: система не может ссылаться сама на себя"), nl % сообщить об ошибке
            ;   parent(system(Parent), system(Parent2)), system(Parent2) -> % если родительской система является ФП
                write("Ошибка: родительская система не должна быть ФП"), nl % сообщить об ошибке
                ; explain(system(Parent)), ! % иначе перейти к анализу родительской системы
        ), ! % завершить анализ родительской системы
        ; ! % иначе завершить анализ родительской системы
    ), 
    findall(Group, group(system(X), group(Group)), Groups), % выбрать указанные группы систем
    (   % анализ групп систем
        many(Groups) -> % если указана хотя бы одна группа систем
        forall(member(Group, Groups), explain(group(Group))), ! % перейти к анализу указанных групп систем
        ; write("Ошибка: не указана группа систем"), nl % иначе сообщить об ошибке
    ),
    ! % завершить анализ
    ; write("Система не определена"), nl. % иначе сообщить об ошибке
 
% анализ функциональности (P10)
explain(function(X)):-
    function(X) -> % если функциональность определена в базе знаний
    string(name, function(X)), % проверить, что задано наименование
    string(description, function(X)), % проверить, что задано описание
    list(target, function(X), target_location), % проверить, что задано целевое размещение
    list(status, function(X), function_status), % проверить, что задан статус
    findall(System, system(function(X), system(System)), Systems), % выбрать указанные системы
    (   % анализ систем
        many(Systems) -> % если указана хотя бы одна система
        forall(member(System, Systems), explain(system(System))), ! % перейти к анализу указанных систем
        ; write("Ошибка: не указаны системы, в которых реализована функциональность"), nl % иначе сообщить об ошибке
    ), 
    ! % завершить анализ
    ; write("Функциональность не определена"), nl. % иначе сообщить об ошибке

% анализ бизнес объекта (P07)
explain(object(X)):-
    object(X) -> % если бизнес объект определен в базе знаний
    string(name, object(X)), % проверить, что задано наименование
    list(status, object(X), change_type), % проверить, что задан статус из соответсвующего справочника
    ! % завершить анализ
    ; write("Бизнес объект не определен"), nl. % иначе сообщить об ошибке

% анализ объекта данных (P08)
explain(data(X)):-
    data(X) -> % если объект данных определен в базе знаний
    string(name, data(X)), % проверить, что задано наименование
    list(status, data(X), change_type), % проверить, что задан статус из соответсвующего справочника
    list(category, data(X), data_category), % проверить, что задана категория данных из соотвествующего справочника
    (   % анализ систем
        system(data(X), system(System)) -> % если указана мастер система
        explain(system(System)), ! % перейти к анализу мастер системы
        ; write("Ошибка: не задана мастер система для объекта данных"), nl % иначе сообщить об ошибке
    ),
    (
        % анализ родительского бизнес объекта
        parent(data(X), object(Object)) -> % если указан родительский бизнес объект
        explain(object(Object)), ! % перейти к анализу родительского бизнес объекта
        ; write("Ошибка: для объекта данных должен быть указан родительский бизнес объект"), nl % иначе сообщить об ошибке
    ), 
    ! % завершить анализ
    ; write("Объект данных не определен"), nl. % иначе сообщить об ошибке

% анализ интеграционного потока (P14)
explain(integration(X)):-
    integration(X) -> % если интеграционный поток определен в базе знаний
    string(description, integration(X)), % проверить, что задано описание
    string(technology, integration(X)), % проверить, что задано описание
    list(mode, integration(X), integration_mode), % проверить, что задан механизм использования из соответсвующего справочника
    list(status, integration(X), integration_status), % проверить, что указан статус
    string(security, integration(X)), % проверить, что указаны средства защиты
    (   % анализ источника данных
        source(integration(X), system(Source)) -> % если указана система источник данных
        explain(system(Source)), ! % перейти к анализу системы
        ; write("Ошибка: не указана система источник данных для интеграционного потока"), nl % иначе сообщить об ошибке
    ),
    (
        % анализ потребителя данных
        destination(integration(X), system(Destination)) -> % если указана система потребитель данных
        explain(system(Destination)), ! % перейти к анализу системы
        ; write("Ошибка: не указана система потребитель данных для интеграционного потока"), nl % иначе сообщить об ошибке
    ),
    (   % анализ параметров нагрузки
        load(integration(X), max(MaximumLoad), avg(AverageLoad)) -> % если параметры нагрузки заданы
        string(MaximumLoad), string(AverageLoad), ! % завершить анализ параметров нагрузки
        ; write("Ошибка: должны быть заданы параметры максимальной и средней нагрузки для интеграционного потока"), nl % иначе сообщить об ошибке
    ),
    (   % проверка асинхронности интеграционного потока
        synch(integration(X)), ! % интеграционный поток может быть указан как синхронный
        ; asynch(integration(X)), ! % интеграционный поток может быть указан как асинхронный
        ; write("Ошибка: интеграционный поток должен быть опереден как синхронный или асинхронный"), nl % иначе сообщить об ошибке
    ),
    findall(DataObject, transmit(integration(X), data(DataObject)), DataObjects), % выбрать указанные объекты данных
    (   % проверка объектов данных
        many(DataObjects) -> % если указан хотя бы один объект данных
        forall(member(DataObject, DataObjects), explain(data(DataObject))), ! % перейти к анализу указанных объектов данных 
        ; write("Ошибка: не указаны передаваемые объекты данных для интеграционного потока"), nl % иначе сообщить об ошибке
    ),
    ! % завершить анализ
    ; write("Интеграционный поток не определен"), nl. % иначе сообщить об ошибке

% анализ технического компонента (Р16)
explain(component(X)):- 
    component(X) -> % если компонент определен в базе знаний
    list(type, component(X), component_type), % проверить, что задан тип компоненты из соответсвующего справочника
    string(software, component(X)), % проверить, что задано прикладное ПО
    string(vendor, component(X)), % проверить, что задан вендор
    list(scalability, component(X), component_scalability), % проверить, что задан тип масштабируемости из соответсвующего справочника
    string(monitoring, component(X)), % проверитЬ, что указан мониторинг
    (   % анализ системы
        system(component(X), system(System)) -> % если указана система
        explain(system(System)), ! % перейти к анализу системы
        ; write("Ошибка: должна быть указана система к которой относится компонент"), nl % иначе сообщить об ошибке
    ),
    (   % анализ параметров отказоустойчивости
        ha(component(X), false), ! % если отказоустойчивость отсутствует
        ; ha(component(X), type(HaType), level(HaLevel)), listed(HaType, capacity_type), listed(HaLevel, capacity_level), ! % если отказоустойчивость есть, то ее параметры должны быть указан из соответсвующих справочников
        ; write("Ошибка: неверно указаны параметры отказоустойчивости для компонента"), nl % иначе сообщить об ошибке
    ),         
    (   % анализ параметров катастрофоустойчивости
        dr(component(X), false), ! % если катастрофоустойчивость отсутсвует
        ; dr(component(X), type(DrType), level(DrLevel)), listed(DrType,  capacity_type), listed(DrLevel, capacity_level), !  % если катастрофоустойчивость есть, то ее параметры должны быть указан из соответсвующих справочников
        ; write("Ошибка: неверно указаны параметры катастрофоустойчивости для компонента"), nl % иначе сообщить об ошибке
    ),
    (   % анализ параметров бэкапирования
        backup(component(X), false), ! % если бэкапирование отсутсвует
        ; backup(component(X), location(Location), duplicate(Duplicate)), listed(Location, backup_location), listed(Duplicate, backup_location), ! % если бэкапирование есть, то его параметры должны быть указан из соответсвующих справочников
        ; write("Ошибка: неверно указаны параметры бэкапирования для компонента"), nl
    ),
    ! % завершить анализ
    ; write("Технический компонент не определен"), nl. % иначе сообщить об ошибке

% анализ бизнес процесса
explain(process(X)):-
    process(X) -> % если бизнес процесс определен в базе знаний
    string(name, process(X)), % проверить, что задано наименование
    string(description, process(X)), % проверить, что задано описание
    findall(System, use(process(X), system(System)), Systems), % выбрать указанные системы
    (   % анализ обеспечивающих систем
        many(Systems) -> % если указана хотя бы одна система
        forall(member(System, Systems), explain(system(System))), ! % перейти к анализу указанных систем
        ; write("Ошибка: не указаны системы, которые обеспечивают бизнес процесс"), nl % иначе сообщить об ошибке
    ),
    findall(Product, use(process(X), product(Product)), Products), % выбрать указанные продукты
    (   % анализ реализуемых продуктов
         many(Products) -> % если указан хотя бы один продукт
         forall(member(Product, Products), explain(product(Product))), ! % перейти к анализу указанных продуктов
        ; write("Ошибка: не указаны продукты, реализуемые бизнес процессом"), nl % иначе сообщить об ошибке
    ),
    findall(Integration, use(process(X), integration(Integration)), Integrations), % выбрать указанные интеграционные потоки
    (   % анализ обеспечивающих интеграционных потоков
         many(Integrations)  ->  % если указан хотя бы ожин интеграционный поток
         forall(member(Integration, Integrations), explain(integration(Integration))), ! % перейти к анализу указанных интеграционных потоков
        ; write("Ошибка: не указаны интеграционные потоки, которые обеспечивают бизнес процесс"), nl % иначе сообщить об ошибке
    ),
    findall(Object, use(process(X), object(Object)), Objects), % выбрать указанные бизнес объекты
    (   % анализ используемых бизнес объектов
        many(Objects) -> % если указан хотя бы один бизнес объект
        forall(member(Object, Objects), explain(object(Object))), ! % перейти к анализу указанных бизнес объектов
        ; write("Ошибка: не указаны бизнес объекты, которые использует бизнес процесс"), nl % иначе сообщить об ошибке
    ), 
    ! % завершить анализ
    ; write("Бизнес процесс не определен"), nl. % иначе сообщить об ошибке

% анализ системы КБ (P13)
explain(security(X)):-
    security(X) ->  % если системы КБ определена в базе знаний
    string(name, security(X)), % проверить, что задано наименование
    string(description, security(X)), % проверить, что задано описание
    list(class, security(X), security_class), % проверить, что задан класс системы КБ из соответствующего справочника
    list(status, security(X), general_status), % проверить, что задан статус 
    (   % анализ размещения
        internal(security(X)), ! % может быть внутренней
        ; external(security(X)), ! % может быть внешней
        ; write("Ошибка: должно быть указано размещение системы КБ"), nl % иначе сообщить об ошибке
    ),
    ! % завершить анализ
    ; write("Система КБ не определена"), nl. % иначе сообщить об ошибке

% анализ технологического сервиса (P15)
explain(service(X)):-
    service(X) ->  % если технологический сервис определен в базе знаний
    string(name, service(X)), % проверить, что задано наименование
    string(description, service(X)), % проверить, что задано описание
    list(class, service(X), service_class), % проверить, что задан класс технологического сервиса из соответствующего справочника
    list(status, service(X), general_status), % проверить, что задан статус 
    (   % анализ размещения
        internal(service(X)), ! % может быть внутренним
        ; external(service(X)), ! % может быть внешним
        ; write("Ошибка: должно быть указано размещение технологического сервиса"), nl % иначе сообщить об ошибке
    ),
    ! % завершить анализ
    ; write("Технологический сервис не определен"), nl. % иначе сообщить об ошибке

% список L содержит любое количество значений
any(L):-
    length(L, N), N>=0.

% список L содержит 1 или более значений
many(L):-
    length(L, N), N>0.

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
    call(T, X, V) ->
    %write("Обязательный параметр "), write(T), write(" найден"), nl,
    (
        string(V) ->
        %write("Тип обязательного параметра "), write(T), write(" ok"), nl, 
        (
            string_length(V, L), L>0 ->
            %write("Значение обязательного параметра "), write(T), write(" ok"), nl, !
            !
            ; write("Ошибка: длинна строки должна быть больше нуля"), nl
        ), !
        ; write("Ошибка: должно быть строковое значение "), write(V), nl
    ), !
    ; write("Ошибка: отсутствует обязательный параметр "), write(T), nl.

% Анализ параметра T, значение X которого должно быть положительным числом
positive(T, X):-
    call(T, X, V) ->
    %write("Обязательный параметр "), write(T), write(" найден"), nl,
    (
        number(V) ->
        %write("Тип обязательного параметра "), write(T), write(" ok"), nl, 
        (
            V>0 ->
            %write("Значение обязательного параметра "), write(T), write(" ok"), nl, !
            !
            ; write("Ошибка: значение должно быть положительным "), write(V), nl
        ), !
        ; write("Ошибка: должно быть численное значение "), write(V), nl
    ), !
    ; write("Ошибка: отсутствует обязательный параметр "), write(T), nl.

% Анализ параметра T, значение X которого должно быть из справочника L
list(T, X, L):-
    call(T, X, V) ->
    %write("Обязательный параметр "), write(T), write(" найден"), nl,
    (
        call(L, _, V) ->
        %write("Значение обязательного параметра "), write(T), write(" ok"), !
        !
        ; write("Ошибка: значение справочника задано неверно "), write(V), nl
    ), !
    ; write("Ошибка: отсутствует обязательный параметр "), write(T), nl.

