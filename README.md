# Логическое программирование

Логическое программирование - одна из парадигм программирования, которая применяется для решения узкоспециализированных задач. Логические задачи сложно и неэффективно решать с помощью широко известных инструментов и подходов к разработке ПО, таких как ООП или процедурное программирование. При этом задачи, которые легко решаются с помощью широко известных подходов даже не стоит пытаться решать с помощью логического программирования (например: системная интеграция, обработка данных). Для каждой задачи - свой инструмент. Логическое программирование - одна из дисциплин теории искусственного интеллекта, т.к. задачей искусственного интеллекта является принятие решений, а решения принимаются на основе логики. Машинное обучение так же являетя одной из дисциплин искусственного интелекта, но специализируется не на логике, а на данных. 

При использовании стандартного к разработке ПО возникает естественное разделение между данными и кодом для их обработки. Данные, код обработки данных и код интерпретации данных становятся разными частями программы. При использование логического программирования код программы (а вернее сказать - логическая модель) является одновременно и данными и методом запросов. Такой подход известен как "data as code" и присущ только системам логического программирования, построенным на математическом аппарате известном как логика предикатов.

Если рассмотреть задачу "Архитектура как код", то возникает резонный вопрос - почему как код и в чем отличие от очевидного подхода "Архитектура как данные" ? Управление архитектурой как данными - задача уже решенная, достаточо выбрать решение и настроить сбор данных внутри компании, или создать свое решение. Код - это набор инструкций, которые можно выполнить и получить что-то полезное для себя. Данные - это информация, которую можно обрабаотать с помощью внешних средств и получить что-то полезное для себя. Подход к архитектуре как к данным как правило превращается в сложные и сильно кастомизированные под конкретную организацию и ее процессы системы с хранилищем данных, обработчиками данных, аналилитечскими отчетами и визуальными формами ввода, Применение же технологий, основанных на логике, позволяет отделить данные от кода, более того изначально заложенный в логическое программирование принцип "данные как код' приводит к тому, что архитектура описывается декларативно как данные, но эти данные можно выполнять как код и получать полезнные для себя результаты, ввиде ответов на вопросы:
  - это правильная архитектура ?
  - если нет, почему ?
  - как сделать, что бы была правильная ?


Именно эта особенность позволяет разрабатывать саммообучающиеся системы, т.к. логическая модель может порождать другую логическую модель и т.д. Интеллектуальные диалоговые системы, сбор фактов, обучение (выстраивание фактов и отношений) - это именно та область где логическое программирование максимально эффективно. Системы логического программирования часто называют базами знаний, с которыми можно взаимодействовать в форме вопрос-ответ и диалогов. Они широко применяются при построении экспертных систем в медицине, транспорте, промышленности и военной сфере (например: диагностика двигателя самолета, постановка диагноза по анализам и симптомам, оптимизация маршрутов, проектирование здания с учетом особенностей среды и материалов).

В основе логики лежит понятие факта и отношений между ними. Мышление - это способность искать нужные знания (факты), связывать их между собой (отношения) и принимать решения на основе их взаимосвязей. Архитектурное мышление основано прежде всего на логике, все структуры (и динамические и статические), которыми оперирует архитектор - это набор фактов и отношений (например: диаграммы, шаблоны проектирования, шаблоны интеграции, стандарты). Архитектор - это эксперт, который работает со знаниями, структурами и логикой. Аналогично тому, как юрист и доктор работаю со знаниями, фактами и выводами. Архитектор должен использовать в своей работе подходящие профессиональные инструменты. Один из основных языков визуального проектирования архитектуры предприятия ArchiMate, использующийся в методологии Togaf полностью состоит из сущностей, аттрибутов и отношений.

https://pubs.opengroup.org/architecture/togaf9-doc/arch/chap30.html  

30.5 Content Metamodel Entities  
30.6 Content Metamodel Attributes  
30.7 Metamodel Relationships  

Логика и логическое программирование являются основой Computer Science и изучаются во всех технических вузах (ввиде языка Lisp или Scheme), но эпоха в которую мы живем - это эпоха автоматизации, т.е. сбора, передачи и анализа данных. Студенту гораздо проще начать уже на первом курсе писать мобильные приложения на Swift и Kotlin или интернет сайты на JavaScript и Python, чем применять на практике логическое программирование. Логических задач меньше чем задач по обработке данных, но они есть - и архитектурное проктирование одна из них, т.к. включает в себя и самообучающиеся диалоговые системы и логические выводы и автоматическое построение корректных структур (архитектурных решений). 

Не стоит обманываться, логическое программирование - не устаревший подход и не наукообразный, он очень прикладной и эффективный для определенных задач.

Задачами данного проекта являются:

1. Описание архитектурной метамодели SEAF и SEAF ДЗО ввиде логической системы (факты, отношения, правила).
2. Создание диалоговых систем для взаимодействующих с пользователем с целью построения модели ахитектуры дочернего общества на базе метамодели родительской компании.
3. Формирование описание архитектуры на базе построенной модели дочернего общества в выбранном формате (YAML, SQL, ArchiMate).
4. Автоматическое формирование архитектурных решений и рекомендаций (модель, шаблоны проектирования, известные и неизвестные архитектурные объекты).

# Установка Prolog

## Windows
  - скачать дистрибутив https://www.swi-prolog.org/download/stable/bin/swipl-9.2.5-1.x64.exe.envelope
  - (рекомендуется) установить WSL (Windows Subsystem for Linux) и следовать инструкциям установки для Linux

## Linux
```
  sudo apt-add-repository ppa:swi-prolog/stable
  sudo apt-get update
  sudo apt-get install swi-prolog
```
## MacOS
```
  brew install swi-prolog
```
После установки не требуется дополнительной настройки. 

# Запуск Prolog

Из командной строки или терминала, в том числе в любой IDE:  
```
  swipl
```
Или:
```
  swipl -f filename
```
где filename - текстовый файл с инструкциями Prolog, содержащий базу знаний

Для выхода из Prolog введите команду halt. (Каждая команда заканчивается точкой) 
```
  halt.
```

### Ссылки 
  
  Основной сайт  
  https://www.swi-prolog.org/

  Среда для web  
  https://swish.swi-prolog.org/

  Хорошая книга:  
  Язык PROLOG (Пролог): алгоритмы искусственного интеллекта, Иван Братко  
  https://www.williamspublishing.com/Books/978-5-8459-0664-9.html
  
  
  
