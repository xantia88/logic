
:- discontiguous(goal/1).
:- discontiguous(description/2).
:- discontiguous(horizon/1).
:- discontiguous(plan/2).

% Predicates needed to validate model
% -----------------------------------------------------

validate(T, ID):-
    (
        call(T, ID, _) ->
        write(T), write(" ok"), nl, !
        ; write("no "), write(T), nl
    ).

valid_goal(X):-
    goal(X),
    (
        validate_goal(X) ->
        write("all ok"), !
        ; log_goal(X), fail
    ).

validate_goal(X):-
    goal(X),
    description(X, _),
    horizon(X, _),
    plan(X, _).

log_goal(X):-
    write("goal "), write(X), 
    (
        goal(X) ->
        write(" defined"), nl,
        validate(description, X),
        validate(horizon, X),
        validate(plan, X), !
        ; write(" not defined")
    ).

% Predicates needed for user interaction (input)
% -----------------------------------------------------

read_string(Message, Value) :-
    write(Message), nl,
    read(Y),
    Value = Y.

read_number(Message, Value) :-
    repeat,
    write(Message), nl,
    read(Y),
    (
        (integer(Y) ; float(Y)) ->
        Value = Y, !
        ; write("Error: not a number. Try again."), nl, fail
    ).

list(L) :-
    call(L, N, Name), write(N), write("="), write(Name), nl, fail.
list(_) :-
    true.

select_item(Message, List, Id) :-
    repeat,
    write(Message), nl,
    list(List),
    read(Y),
    (
        call(List, Y, _) ->
        Id = Y, !
        ; write("Error: no such item. Try again."), nl, fail
    ).

% Predicates needed for user interaction (output)
% -----------------------------------------------------

dump(Id, Name, Location) :-
    write("id="), write(Id), nl,
    write("Name="), write(Name), nl,
    write("Location="), write(Location), nl.

dump(Id, Name, Location, Description, Ownership, Lifecycle) :-
    dump(Id, Name, Location),
    write("Description="), write(Description), nl,
    write("Ownership="), write(Ownership), nl,
    write("Lifecycle="), write(Lifecycle), nl.

% Model configuration
% -----------------------------------------------------

location(1, "internal").
location(2, "external").

ownership(1, "source code").
ownership(2, "instance").
ownership(3, "SaaS").
ownership(4, "Partner's system").

lifecycle(1, "draft").
lifecycle(2, "development").
lifecycle(3, "deployment").
lifecycle(4, "test").
lifecycle(5, "production").
lifecycle(6, "archive").

external(Id) :-
    Id = 2.    

% Model implementation (user dialog)
% -----------------------------------------------------

system :-
    read_number("ID", Id), 
    read_string("Name", Name), 
    select_item("Location", location, Location),
    (
        external(Location) ->
        read_string("Description", Description),
        select_item("Ownership", ownership, Ownership),
        select_item("Lifecycle", lifecycle, Lifecycle),
        dump(Id, Name, Location, Description, Ownership, Lifecycle), !
        ; dump(Id, Name, Location)
    ).

goal(z).
description(z, "description here").
horizon(z, "2024Q4").
%plan(z, "2024Q3").



