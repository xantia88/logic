
% Predicates needed for user interaction (input)
% -----------------------------------------------------

get_string(Value) :-
    write("Enter string value:"), nl,
    read(Y),
    Value = Y.

get_number(Value) :-
    repeat,
    write("Enter number value:"), nl,
    read(Y),
    (
        (integer(Y) ; float(Y)) ->
        Value = Y, !
        ; write("Error: not a number"), nl, fail
    ).

list(L) :-
    call(L, N, Name), write(N), write("="), write(Name), nl, fail.
list(_) :-
    true.

get_item(List, Id, Value) :-
    repeat,
    write("Select an item from the list"), nl,
    list(List),
    read(Y),
    (
        call(List, Y, L) ->
        Id = Y, Value = L, !
        ; write("Error: no such item"), nl, fail
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
    get_number(Id), 
    get_string(Name), 
    get_item(location, Location, _),
    (
        external(Location) ->
        get_string(Description),
        get_item(ownership, Ownership, _),
        dump(Id, Name, Location, Description, Ownership), !
        ; dump(Id, Name, Location)
    ).


