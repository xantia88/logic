## Термины

Знания - суждения об объектах и процессах реального мира, их структуре и взаимосвязях. Так или иначе сводятся к суждению "правда или ложь".

Данные - следы проявления объектов и процессов в реальном мире. Эти следы можно использовать для сравнения с известными знаниями (дисциплина Data Analysis) или поиска новых знаний (дисциплины Data Mining, Knowledge Discovery).  

Модель - представление знаний, содержит все необходимое что-бы описать предметную область реального мира. Она содержит общий язык предметной области, справочники, сложные структуры, их взаимосвязи и правила их валидации. Используя модель можно создать базу знаний, которая полностью ей соотвествует. 

База знаний - это реализация модели, а именно - знания переложенные из головы человека или системы в цифровой вид. Они могут быть проверены на целостность и непротиворечивость модели. Базу знаний можно использовать, что бы задавать ей вопросы, используя язык предметной области.
 
Prolog - технология логического программирования, которая позволяет создавать базы знаний, делать к ним запросы, обогащать данными, проверять на корректность и непротиворечивость, делать сложные реурсивные логические выводы. 

Термин "программирование" используется в математическом смысле. Логическое программирование - это математическая дисциплина, есть и другие "программирования" - динамическое программирование и вероятностное программирование. Людям, которые хорошо знакомы с компьютерным программированием, следуюет воспринимать этот термин как проектирование или моделирование. Т.е. логическое программирование эквивалентно логическому проектированию или моделированию.

Осноные вопросы к базе знаний:

1. Правильно ли определена сложная сущность?
2. Если нет, то почему?
3. Что нужно сделать, что бы было правильно?

В области архитектуры, данные вопросы могут быть транслированы в:

1. Это правильная архитектура или архитектурное решение?
2. Объясни почему неправильная?
3. Как сделать правильную архитектуру или архитектурное решение?

## Знания и данные

Базу знаний можно представить как базу данных, но в отличии от базы данных, взаимодействие со знаниями (запросы) осуществляется на языке предметной области и нет необходимости разрабатывать структуры хранения данных, процедуры извлечения данных, заботиться о транзакционной согласованности. Это позволяет полностью сосредоточиться на процессе моделирования интеллектуальной экспертизы. 

Важно понимать разницу между **данными** и **знаниями**. Для работы с данными есть свой специализированный инструмент - база данных (+ таблицы, + язык запросов, + теория нормальных форм, + транзакционность), а для работы со знаниями свой - база знаний (+ логика предикатов, + логические модели). **Данные обрабатывают**, а **знания моделируют**. 

Базы данных использует для обработки данных и построения аналитики, базы знаний используют для разработки систем принятия решений. Обрабатывая данные, аналитические системы обогащают базу знаний новыми фактами, эти факты используются в разработанной логической модели, что бы принять решение.

Если процесс управления знаниями в организации находится в сотоянии undefined, то он все равно эмулируется через сложные системы отчетов и многичесленные чек-листы и документы. Проблема в таком подходе заключается в том, что модели принятия решений реализуются в инструментах, которые устаревают и организации нужно повторно тратить средства на реализацию логики принятия решений в новых системах. Разные люди могут по-разному понимать и применять описанные в тексте инструкции, что создает дополнительные операционные риски. 

Применение технологий логического программирования позволяет обеспечить **переносимость** знаний, а так же **повторяемость** и **однозначность** логики принятия решений. Переносимость и повторяемость достигается за счет стандартизации ISO (номер стандарта [ISO/IEC 13211-1:1995](https://www.iso.org/standard/21413.html)), повторяемость и однозначность обеспечивается математическим аппаратом - логикой предикатов.

База знаний работает на уровне логических абстракций. База знаний обогащается после анализа данных, а для работы в сторонних инструментах знания превращаются в данные и экспортируются в нужном формате. Это позволяет разделить логику и данные, что бы выстроить процесс архитектурного моделирования с использованием различных инструментов.

## Цели

Процесс моделирования - это создание сложных сущностей из простых, таким образом, что бы было правильно по мнению эксперта, который занимается моделированием. Кстати, в системах логического программирования самая маленькая сущность называется **atom** и это не совпадение.

Хорошо когда архитектор занимается моделированием и развивает базу знаний, перекладывая в нее свой интеллект и экспертизу. Этой экспертизой могут воспользоваться другие люди и организации, знания не теряются и они могут быть применены повторно (в отличии от документов, которые могут быть хорошо написаны, а могут быть плохо. При этом два человека могут трактовать один и тот же документ по-разному, что приводит к двум разным результам применения знаний). Поэтому, работа со знаниями - ценность для организации.

Основная цель данного проекта - применить стандартные инструменты логического программирования для работы со знаниями о корпоративной архитектуре организации. 

## Задачи проекта

|Номер|Задача|Польза|Подход|
|-----|------|------|------|
|1|Разработать логическую модель архитектуры дочернего общества|Единый язык предметной области, структуры, правила валидации и анализа|Логическая модель на языке Prolog|
|2|Описать архитектуру дочернего общества ввиде базы знаний согласно разработанной модели|Цифровизация знаний, работа со знаниями на языке предметной области, повторяемые логические выводы и запросы к базе знаний|База знаний на языке Prolog|
|3|Реализовать диалоговые системы для взаимодействия с базой знаний|Быстрый и удобный способ работы со знаниями|Диалоги с пользователем на языке предметной области с использованием стандартных средств Prolog|
|4|Реализовать интеллектуального помощника, знакомого с языком предметной области разработанной логической модели|Быстрый и удобный способ работы со знаниями|Применить GigaChat для перевода с русского на язык предметной области и обратно|
|5|Экспортировать данные из базы знаний в форматы - YAML (DocHub), SQL (PostgreSQL), XML (ArchiMate)|Возможность работы с данными в сторонних инструментах|Создать текстовые файлы, содержащие данные из базы знаний|
|6|Разработать библиотеку моделей для лучших практик, шаблонов проектирования, шаблонов интеграций|Рекомендации по развитию ИТ ландшафта, автоматическая проверка стандартров, поддержка принятия решений| Дополнительые логические модели на языке Prolog|

## Структура проекта

Файл **model.pl** содержит модель архитектуры дочерней компании. Файл **knowledgebase.pl** содержит базу знаний, описанную вручную и используемую для тестирования модели. 

Ниже приведен писок сущностей предметной области, используемый для описания архитектуры дочернего общества. Для каждой сущности определены правила валидации ее логической структуры (**valid**) и правила анализа этой структуры с выводом сообщений об ошибках (**explain**). Обе операции применяют механизм **зацепления** определенный в логической модели, что позволяет перейти к валидации или анализу связанных сущностей (например: интеграционный поток валидный, если объекты данных которые он передает валиданы и система источник валидна и система потребитель валидна). При этом длинная цепочка валидации останавливается на первом False, а анализ ошибок продолжается пока все связанные структуры не будут проанализированы (этот факт хорошо виден в результатах нагрузочного тестирования в разделе "Производительность").

 |Сущность|Название на языке предметной области|Проверить, что сущность валидна |Объяснить, где ошибки, если сущность невалидна|
|--------|------------------------------------|---------------------------------------|---------------------|
|Цель компании|goal|valid(goal(X))|explain(goal(X))|
|Стратегическая задача|strategy|valid(strategy(X))|explain(strategy(X))|
|Задачи и планы|task|valid(task(X))|explain(task(X))|
|Клиент|client|valid(client(X))|explain(client(X))|
|Продукт|product|valid(product(X))|explain(product(X))|
|Канал|channel|valid(channel(X))|explain(channel(X))|
|Группа систем|group|valid(group(X))|explain(group(X))|
|Система|system|valid(system(X))|explain(system(X))|
|Бизнес процесс|process|valid(process(X))|explain(process(X))|
|Бизнес объект|object|valid(object(X))|explain(object(X))|
|Объект данных|data|valid(data(X))|explain(data(X))|
|Интеграционный поток|integration|valid(integration(X))|explain(integration(X))|
|Технический компонент|component|valid(component(X))|explain(component(X))|
|Функциональность|function|valid(function(X))|explain(function(X))|
|Технологический сервис|service|valid(service(X))|explain(service(X))|
|Система кибербезопасности|security|valid(security(X))|explain(security(X))|

## Производительность

Для оценки произволительности в базу знаний добавлялись интеграционные потоки, связанные с другими сущностями (системами, объектами данных). Для валидации структуры использовалась цель **valid(integration(X))** последовательно для каждого интеграционного потока. Для анализа ошибок использовалась цель **explain(integration(X))** последовательно для каждого интеграционного потока. Никакие методы параллельного выполнения задач не применялись.

Команда ниже создаст 1000 интеграционных потоков и запустит тестирование.

```
cd test
./load-test.sh 1000
```

Окружение:

Intel N100 Processor, RAM 16 GB, SSD 500 GB, Ubuntu 24.04

Выводы:

 - Рост времени, требующийся на загрузку файла с базой знаний в память, линейный. В среднем, 15 секунд на 100 000 интеграционных потоков.
 - При загрузки данных в память база знаний размещается оптимально, таким образом, что валидация логической модели не зависит от объема данных и занимает не более 1 секунды.
 - Рост времени для анализа ошибок линейный. В среднем, 8 секунд на 100 000 интеграционных потоков.
 - SWI Prolog подходит для работы с базами знаний больших объемов.


|Количество интеграционных потоков в базе знаний (шт.) |Размер файла базы знаний (Мб.) |Время загрузки файла базы знаний (сек.) |Последовательная валидация всех интеграционных потоков (сек.) |Последовательный анализ всех интеграционных потоков (сек.) |
|--------|------------------------------------|---------------------------------------|---------------------|---------------------|
|100 000|72|15|1|8|
|200 000|145|29|1|16|
|300 000|218|40|1|28|
|400 000|291|62|1|31|
|500 000|364|78|1|36|
|600 000|437|92|1|43|
|700 000|510|109|1|50|
|800 000|583|122|1|59|
|900 000|656|140|1|64|
|1 000 000|729|154|1|73|

## Оглавление

[01. Логическое программирование и управление архитектурой](https://github.com/xantia88/logic/wiki/%D0%9B%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5-%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)

[02. Установка Prolog](https://github.com/xantia88/logic/wiki/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Prolog)

[03. Попробовать Prolog без установки (Web)](https://github.com/xantia88/logic/wiki/%D0%9F%D0%BE%D0%BF%D1%80%D0%BE%D0%B1%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-Prolog-%D0%B1%D0%B5%D0%B7-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8-(Web))


  
  
  
