# Логическое программирование

Логическое программирование - одна из парадигм программирования, которая применяется для узкоспециализированных задач. Логические задачи сложно и неэффективно решать с помощью широко известных инструментов и подходов к разработке ПО, таких как ООП или процедурное программирование. При этом задачи, которые легко решаются с помощью широко известных подходов даже не стоит пытаться решать с помощью логического программирования. Для каждой задачи - свой инструмент. Логическое программирование - одна из дисциплин теории искусственного интеллекта, т.к. задачей искусственного интеллекта является принятие решений, а решения принимаются на основе логики (Машинное обучение так же являетя одной из дисциплин искусственного интелекта). 

При использовании процедурного и ООП подхода возникает естественное разделение между данными и кодом их обработки, запросы к данным так же реализуются отдельным кодом. При использование логического программирования код программы является одновременно и данными, программа может генерировать саму себя, запросы к данным и программе осуществляются с помощью такого же кода как и сама программа. Системы логического программирования часто называют базами знаний, с которыми можно взаимодействовать ввиде вопроса и ответа. Системы логического программирования широко применяются при построении экспертных систем в медицине, транспорте и промышленности и военной сфере. 

В основе логики лежит понятие факта и отношений между ними. Мышление - это способность искать нужные знания (факты), связывать их между собой (отношения) и принимать решения на основе их взаимосвязей. Архитектурное мышление основано прежде всего на логике, все структуры (и динамические и статические), которыми оперирует архитектов - это набор фактов и отношений (например: диаграммы, шаблоны проектирования, шаблоны интеграции, стандарты). 

Один из основных языков визуального проектирования архитектуры предприятия ArchiMate, использующийся в методологии Togaf полностью состоит из сущностей, аттрибутов и отношений.

https://pubs.opengroup.org/architecture/togaf9-doc/arch/chap30.html  
30.5 Content Metamodel Entities
30.6 Content Metamodel Attributes
30.7 Metamodel Relationships

Задачами данного проекта являются:

1. Описание архитектурной модели SEAF / SEAF ДЗО ввиде логической системы (факты, отношения, правила проверки)
2. Создание диалоговых систем, взаимодействующих с пользователем для уточнения и создания описания архитектуры в рамках выбранной логической модели и в выбранном формате (YAML, SQL, ArchiMate)
3. Автоматическое формирование архитектурных решений и рекомендаций (модель, шаблоны проектирования, известные и неизвестные архитектурные объекты)

# Установка Prolog

## Windows
  - скачать дистрибутив https://www.swi-prolog.org/download/stable/bin/swipl-9.2.5-1.x64.exe.envelope
  - (рекомендуется) установить WSL (Windows Subsystem for Linux) и следовать инструкциям установки для Linux

## Linux
  - sudo apt-add-repository ppa:swi-prolog/stable
  - sudo apt-get update
  - sudo apt-get install swi-prolog

## MacOS
  - brew install swi-prolog

### Ссылки 
  
  Основной сайт  
  https://www.swi-prolog.org/

  Среда для web  
  https://swish.swi-prolog.org/

  Хорошая книга:  
  Язык PROLOG (Пролог): алгоритмы искусственного интеллекта, Иван Братко  
  https://www.williamspublishing.com/Books/978-5-8459-0664-9.html
  
  
  
