## Термины

Модель - содержит все необходимое что-бы описать предметную область. Она содержит общий язык предметной области, справочники, сложные структуры, их взаимосвязи и правила их валидации. Используя модель можно создать базу знаний, которая полностью ей соотвествует. 

База знаний - это реализация модели, а именно - знания переложенные из головы человека или системы в цифровой вид. Знания могут быть проверены на целостность и непротиворечивость модели. Базу знаний можно использовать, что бы задавать ей вопросы, используя язык предметной области.

Prolog - язык программирования и технология, позволяющая работать с базами знаний, делать к ним запросы, обогащать данными, проверять на корректность и непротиворечивость, делать сложные реурсивные логические выводы. Используется из командной строки и имеет CLI (Command Line Interface).

Осноные вопросы к базе знаний:

1. Правильно ли определена сложная сущность?
2. Если нет, то почему?
3. Что нужно сделать, что бы было правильно?

В области архитектуры, данные вопросы могут быть транслированы в:

1. Это правильная архитектура или архитектурное решение?
2. Объясни почему неправильная?
3. Как сделать правильную архитектуру или архитектурное решение?

Можно привести следующие аналогии: модель - это класс, а база знаний - это объект, который создан на основе этого класса и наполнен данными. Данные в объект попадают через методы, а данные в базу знаний попадают через диалоги, запущенные Prolog или загружаются напрямую из текстового файла. Работать с объектом можно если есть среда исполнения, определяющая жизненный цикл и правила работы с объектами, например - JVM. Работать с базой знаний можно с помощью Prolog, который является средой для управления базами знаний. Класс описывается в текстовом файле и модель описывается в текстовом файле. База знаний может быть выгружена в текстовый файл и загружена из него, объект может быть сериализован и десериализован.

Модель предметной области определяет связанные между собой абстракции. База знаний работает с данными на уровне абстракций, но данные можно экспортировать ввиде текстовых файлов в нужном формате. Такой подход позволяет отделить описание и формат данных от логических структур предметной области, что бы выстроить процесс архитектурного моделирования с использованием сторонних инструментов.

## Задачи проекта

|Номер|Задача|Польза|Подход|
|-----|------|------|------|
|1|Формализация архитектурной модели дочернего общества ввиде логической модели|Задание единого языка, структур и правил работы с ними|Логическая модель на языке Prolog|
|2|Создание базы знаний с описанием архитектуры дочернего общества|Цифровизация знаний, возможность делать логические выводы на их основе|База знаний на языке Prolog|
|2.1|Вручную, с помощью текстового описания на языке предметной области|Статическое представление знаний, используя модель предметной области, пригодное для чтения и анализа как человеком, так и машиной|В текстовом файле, на языке, заложенным в модели предметной области|
|2.2|Автоматически, с помощью диалоговых систем, построенных на базе логической модели|Быстрый и удобный способ работы со знаниями|Используя диалоговые системы, построенные на базе модели знаний на языке Prolog|
|3|Реализация функциональности версионирования архитектурной модели с возможностью вернуться к любой ранее сохраненной версии|В любой момент времени вернуться назад и посмотреть состояние базы знаний на тот момент|Любое изменение база знаний приводит к созданию полной копии базы знаний и ее сохранении в отдельном файле|
|4|Реализация функциональности сравнения двух разных версий архитектурных моделей|Найти что изменилось и проанализировать разницу между двумя состояниями базы знаний (двумя версиями архитектуры)|Сравнить все факты и отношения в двух версиях баз знаний|
|5|Формирование и экспорт описания архитектуры дочернего общества в выбранном текстовом формате - YAML (DocHub), SQL, XML(ArchiMate)|Возможность работы с представлением знаний в сторонних инструментах|Преобразовать базу знаний в набор текстовых файлов|
|6|Автоматическое формирование архитектурных решений и рекомендаций с использований логических моделей, предоставленных родительской компанией или разработанных дочерней компанией|Применение лучших практик, шаблонов проектирование, шаблонов интеграции и проверки стандартов к базе знаний|Описание "что правильно" ввиде логической модели на языке Prolog, с целью применить эту модель к базе знаний и получить ответы - "что неправильно" и "как исправить"|

## Структура проекта

Файл model.pl содержит модель архитектуры дочерней компании. Файл knowledgebase.pl содержит базу знаний, описанную вручную и используемую для тестирования модели. 

Ниже приведен список сущностей предметной области, используемый для описания архитектуры дочернего общества:

|Сущность|Название на языке предметной области|Проверить, что сущность определена корректно (True / False)|Объяснить, где ошибки, если сущность определена некорректно|Запустить диалог для работы и исправления|
|--------|------------------------------------|---------------------------------------|---------------------|----------------|
|Цель компании|goal|valid_goal(X)|explain_goal(X)|goal(X)|
|Стратегическая задача|strategy|valid_strategy(X)|explain_strategy(X)|strategy(X)|
|Задачи и планы|task|valid_task(X)|explain_task(X)|task(X)|
|Клиент|client|valid_client(X)|explain_client(X)||
|Продукт|product|valid_product(X)|explain_product(X)||
|Канал|channel|valid_channel(X)|explain_channel(X)||
|Группа систем|group|valid_group(X)|explain_group(X)||
|Система|system|valid_system(X)|explain_system(X)||
|Бизнес процесс|||||
|Бизнес объект|||||
|Объект данных|||||
|Интеграционный поток|||||
|Технический компонент|||||
|Функциональность|function|valid_function(X)|explain_function(X)||
|Технический сервис|||||
|Система кибербезопасности|||||

## Оглавление

[01. Логическое программирование и управление архитектурой](https://github.com/xantia88/logic/wiki/%D0%9B%D0%BE%D0%B3%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5-%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)

[02. Установка Prolog](https://github.com/xantia88/logic/wiki/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Prolog)

[03. Попробовать Prolog без установки (Web)](https://github.com/xantia88/logic/wiki/%D0%9F%D0%BE%D0%BF%D1%80%D0%BE%D0%B1%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-Prolog-%D0%B1%D0%B5%D0%B7-%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8-(Web))


  
  
  
