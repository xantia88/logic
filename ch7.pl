
start:-
    dialog(security), % выяснить про политику информационной безопасности в компании
    dialog(business), % выяснить как бизнес подразделение использует систему 
    dialog(clients), % выяснить как клиенты взаимодействуют с системой
    dialog(employees), % выяснить как сотрудники взаимодействуют с системой
    dialog(it), % выяснить подключена ли система к централизованным ИТ сервисам или использует их локально
    dialog(admins). % выяснить как осуществляется администрирование системы

% практика киберберзопасности в компании
dialog(security):-
    ask("В компании есть собственное подразделение, выполняющее функции кибербезопасности", Local),
    (
        not(true(Local)) ->
        ask("Компания привлекает стороннюю организацию для обеспечения функции кибербезопасности")
    ;   !    
    ),
    ask("В компании есть задокументированная политика информационной безопасности", Policy),
    ( 
        true(Policy) ->
        ask("Политика определяет конфиденциальную информацию и требования для работы с ней"),
        dialog(document)
    ;   !
    ),
    ask("Система хранит конфиденциальные данные"),
    ask("Система обрабатывает конфиденциальные данные"),
    ask("В компании есть задокументированные требованиями к журналу аудита", Audit),
    (
        true(Audit) ->
        ask("Требования определяют сроки хранения журнала аудита"),
        ask("Требования определяют содержимое, объем и полноту данных в журнале аудита"),
        ask("Ведение журнала аудита осуществляется централизовано на уровне компании"),
        dialog(document)
    ;   !
    ),
    ask("Система осуществляет журналирования событий аудита"),
    ask("В компании есть задокументированные требования к протоколу системных событий", Protocol),
    (
        true(Protocol) ->
        ask("Требования определяют содержимое, объем и полноту данных в протоколе системных событий"),
        ask("Ведение прокола системных событий осуществляется централизовано на уровне компании"),
        dialog(document)
    ;   !
    ),
    ask("Система осуществляет протоколирования событий безопасности"),
    ask("Система осуществляет протоколирования действий пользователей").

% информация о формальном утверждении документа
dialog(document):-
    ask("Документ формально утвержден на уровне компании", Approval),
    (
        true(Approval) ->
        text("Название и номер документа"),
        text("Дата утверждения")
    ).

% основные бизнес параметры системы
dialog(business):-
    ask("Владельцем системы является бизнес подразделение компании"),
    ask("Владелец системы формально закреплен", Owner),
    (   % если задан владелец системы
        true(Owner) ->
        dialog(document)
    ;   !
    ),
    ask("Есть заполненный калькулятор критичности", Calculator),
    (   % если есть заполненный калькулятор
        true(Calculator) ->
        options("Рассчитанное значение уровня критичности системы", [mc, bc, bo, op]),
        text("Дата расчета уровня критичности")
    ;   !
    ),
    ask("У системы есть заданные требования по производительности", Performance),
    (   % если есть требования по производительности
        true(Performance) ->
        dialog(sla)
    ;   !
    ),
    ask("У системы есть заданные требования по масштабируемости", Scalability),
    (   % если есть требования по масштабируемости
        true(Scalability) ->
        dialog(sla)
    ;   !
    ),
    ask("У системы есть заданные требования по отказоустойчивости", Tolerance),
    (   % если есть требования по отказоустойчивости
        true(Tolerance) ->
        dialog(sla)
    ;   !
    ),
    ask("У системы есть заданные требования по доступности", Availability),
    (   % если есть требования по доступности
        true(Availability) ->
        dialog(sla)
    ;   !
    ),
    ask("У системы есть заданные требования по катастрофоустойчивости", Disaster),
    (   % если есть требования по катастрофоустойчивости
        true(Disaster) ->
        dialog(sla)
    ;   !
    ).

% пользовательские сценарии (use cases)
dialog(scenarios):-
    repeat,
    ask("Добавить описание пользовательского сценария взаимодействия с системой", Scenario),
    (   % если нужно описать сценарий
        true(Scenario) ->
        text("Для чего пользователь взаимодействует с системой"), fail
    ;   !
    ).

% основные параметры SLA
dialog(sla):-
    ask("Целевые параметры заданы ввиде соглашения об уровне сервиса (SLA)", Sla),
    (   % если для системы заданы параменты SLA
        true(Sla)->
        ask("Соглашение утверждено владельцем системы"),
        ask("Выстроен регулярный процесс сравнения текущих значений параметров с целевыми", Process),
        (
            true(Process) ->
            options("Периодичность сравнения", [wk, mn, qt, yr])
        ;   !
        ),
        dialog(document)
    ).

% пользовательское взаимодействие сотрудников с системой
dialog(employees):-
    ask("Сотрудники взаимодействуют с системой для выполнения бизнес задач", Employees),
    (   % если сотрудники взаимодействуют с системой
        true(Employees) ->
        dialog(scenarios),
        positive("Сколько сотрудников взаимодействуют с системой"), % уточнить примерное количество
        dialog(roles), % уточнить параметры ролевой модели сотрудников
        ask("Сотрудники взаимодействуют с системой из внутренней сети компании"),
        ask("Сотрудники взаимодействуют с системой из внешней сети через интернет"),
        ask("Пользователи взаимодействуют с системой из внешней сети через выделенный канал"),
        dialog(equipment), % уточнить оборудование, которое используют сотрудники
        dialog(frontend)% уточнить фронтальные компоненты системы, которые используют сотрудники
    ;   !
    ).

% пользовательское взаимодействие клиентов с системой
dialog(clients):-
    ask("У системы есть пользователи, которые не являются сотрудниками", Clients),
    (   % если клиенты взаимодействуют с системой
        true(Clients) ->
        dialog(scenarios),
        positive("Сколько клиентов взаимодействуют с системой"), % уточнить примерное количество
        dialog(roles), % уточнить параметры ролевой модели клиентов
        ask("Пользователи взаимодействуют с системой из внутренней сети компании"),
        ask("Пользователи взаимодействуют с системой из внешней сети через интернет"),
        ask("Пользователи взаимодействуют с системой из внешней сети через выделенный канал"),
        dialog(frontend) % уточнить фронтальные компоненты системы, которые используют клиенты
    ;   !
    ).

% централизованные ИТ сервисы компании
dialog(it):-
    ask("В компании есть централизованное решение по управлению доступом пользователей", Access),
    (
        true(Access) ->
        ask("Система подключена к централизованному решению по управлению доступом пользователей")
    ;   !
    ),
    ask("В системе реализовано локальное управление доступом пользователей"),
    ask("В компании есть централизованное ITSM решение", Itsm),
    (   % если есть централизованное решение
        true(Itsm) ->
        ask("Система подключена к ITSM решению")
    ;   !
    ),
    ask("В компании есть централизованное решение по инфраструктурному мониторингу", Infrastructure),
    (
        true(Infrastructure) ->
        ask("Система подключена к централизованному решению по инфраструктурному мониторингу")
    ;   !
    ),
    ask("В составе системы есть локальное решение по инфраструктурному мониторингу"),
    ask("В компании есть централизованное решение по прикладному мониторингу", Applications),
    (
        true(Applications) ->
        ask("Система подключена к централизованному решению по прикладному мониторингу")
    ;   !
    ), 
    ask("В составе системы есть локальное решение по прикладному мониторингу"), 
    ask("В компании есть централизованное решение по сбору и анализу логов", Logs),
    (
        true(Logs) ->
        ask("Система подключена к централизованному решению по сбору и анализу логов")
    ;   !
    ), 
    ask("В составе системы есть локальное решение по сбору и анализу логов").

% взаимодействие администраторов с системой
dialog(admins):-
    ask("Сотрудники компании администрируют систему", Admin),
    (   % если осуществляется администрирование
        true(Admin) ->
        ask("Администрирование осуществляет IT служба компании"),
        ask("Администрирование осуществляет владелец системы"),
        ask("Администрирование системы осуществляется из внутренней сети компании"),
        ask("Администрирование системы осуществляется из внешней сети через интернет"),
        ask("Администрирование системы осуществляется из внешней сети через выделенный канал"),
        positive("Сколько сотрудников администрируют системой"),
        dialog(equipment),  
        ask("Доступ к системе осуществляется через PAM")
    ;   !
    ).

% компоненты пользовательского взаимодействия
dialog(frontend):-
    ask("Для пользовательского взаимодействия используется мобильное приложение", Mobile), 
    (   % если используется мобильное приложение
        true(Mobile) ->
        dialog(mobile), % уточнить платформу мобильного приложения 
        dialog(api) % уточнить архитектуру API
    ;   !
    ),
    ask("Для пользовательского взаимодействия используется вэб приложение", Web),
    (   % если используется вэб приложение
        true(Web) ->
        dialog(api) % уточнить архитектуру API
    ;   !
    ),
    ask("Для пользовательского взаимодействия используется десктопное приложение", Desktop),
    (   % если используется десктопное приложение
        true(Desktop) ->
        dialog(os), % уточнить операционную систему
        dialog(api) % уточнить архитектуру API
    ;   !
    ),
    ask("Для пользовательского взаимодействия используется консольное приложение", Console),
    (   % если используется консольное приложение
        true(Console) ->
        dialog(os), % уточнить операционную систему
        dialog(api) % уточнить архитектуру API
    ;   !
    ),
    ask("Пользователи могут вызывать API системы из собственных скриптов", Api),
    (   % если используюся API напрямую
        true(Api) ->
        dialog(api) % уточнить архитектуру API
    ;   !
    ).

% управление ролевой моделью    
dialog(roles):-
    ask("В системе реализована ролевая модель для пользователей", Roles),
    (   % если в системе есть ролевая модель
        true(Roles) ->
        ask("Управление ролевой моделью осуществляется централизовано на уровне компании"), !
    ;   ask("Управление полномочиями пользователей осуществляется локально в системе", Privileges),
        (   % если в системе есть права пользователей
            true(Privileges) ->
            ask("Управление полномочиями осуществляется централизовано на уровне компании")
        ;   !
        )
    ).

% мобильные платформы
dialog(mobile):-
    ask("На платформе Google Android"),
    ask("На платформе Apple iOS").

% архитектура API
dialog(api):-
    ask("Используется API на базе REST"),
    ask("Используется API на базе SOAP"),
    ask("Используется API на базе RPC").

% операционные системы
dialog(os):-
    ask("На Windows"),
    ask("На Linux"),
    ask("На MacOS").

% оборудование
dialog(equipment):-
    ask("Для доступа к системе используется корпоративное оборудование", Equipment),
    (   % если используется корпоративное оборудование
        true(Equipment) ->
        ask("Персональный компьютер"),
        ask("Ноутбук"),
        ask("Смартфон"),
        ask("Планшет")
    ;   !
    ),
    ask("Для доступа к системе используется ВАРМ"),
    ask("Для доступа к системе используется личное устройство (BYOD)").

options(S, L):-
    repeat,
    question(S, L),
    read(Ans),
    (
        member(Ans, L) ->
        true, !
    ;   write("Ошибка ввода: введите значение из списка:"), write(L), nl, fail
    ).

% пользователь должен ввести текст
text(S):-
    repeat,
    question(S),
    read(Ans),
    (
        string_length(Ans, N), N>0 ->
        true, !
    ;   write("Ошибка ввода: текстовое значение не может быть пустым, попробуйте еще раз"), nl, fail
    ).

% пользователь должен ввести целое положительное число
positive(S):-
    repeat,
    question(S),
    read(Ans),
    (
        integer(Ans), Ans>0 ->
        true, !
    ;   write("Ошибка ввода: введите целое положительное число, попробуйте еще раз"), nl, fail
    ).

% пользователь должет ответить да или нет
ask(S, Value):-
    repeat,
    question(S),
    read(Ans), 
    (
        member(Ans, ['y', 'n']) ->
        Value = Ans, !
    ;   write("Ошибка ввода: введите y (да) или n (нет), попробуйте еще раз"), nl, fail
    ).

% если пользователь ответил да
true(Value):-
    Value = 'y'.

% обертка, убрать после отладки 
ask(S):-
    ask(S, _).

% отобразить строку со знаком вопроса
mark(S):-
    write(S), write("?").

% отобразить вопрос
question(S):-
    mark(S), nl.

% отобразить вопрос и список возможных ответов
question(S, L):-
    mark(S), tab(4), write("Возможные значения:"), write(L), nl. 

