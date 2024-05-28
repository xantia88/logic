:-consult("parent.pl").

goal(goal1).
description(goal1, "goal 1 description here").
horizon(goal1, "2024Q4").

strategy(strategy1).
description(strategy1, "strategy 1 description here").
horizon(strategy1, "2025Q1").
realize(strategy1, goal1).

strategy(strategy2).
description(strategy2, "strategy 2 description here").
horizon(strategy2, "2024Q3").
realize(strategy2, goal1).

task(task1).
description(task1, "task 1 description here").
deadline(task1, "2024Q1").
%realize(task1, strategy1).

task(task2).
description(task2, "task 2 description here").
deadline(task2, "2023Q3").
status(task2, "Запланировано").
realize(task2, strategy2).

