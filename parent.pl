
:-discontiguous(goal/1).
:-discontiguous(description/2).
:-discontiguous(horizon/2).
:-discontiguous(strategy/1).
:-discontiguous(realize/2).
:-discontiguous(task/1).
:-discontiguous(deadline/2).

valid_goal(X):-
    goal(X),
    description(X, _),
    horizon(X, _).

valid_strategy(X):-
    strategy(X),
    description(X, _),
    horizon(X, _),
    realize(X, G), valid_goal(G).

valid_task(X):-
    task(X),
    description(X, _),
    deadline(X, _),
    realize(X, S), valid_strategy(S).

