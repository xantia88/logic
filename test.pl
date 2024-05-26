
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

dump(Id, Name, Location, Description, Ownership) :-
    dump(Id, Name, Location),
    write("Description="), write(Description), nl,
    write("Ownership="), write(Ownership), nl.

% Model configuration
% -----------------------------------------------------

location(1, "internal").
location(2, "external").

ownership(1, "source code").
ownership(2, "instance").
ownership(3, "SaaS").
ownership(4, "Partner's system").

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
        dump(Id, Name, Location, Description, Ownership), !
        ; dump(Id, Name, Location)
    ).

