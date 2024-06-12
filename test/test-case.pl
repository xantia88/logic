:-consult("knowledgebase.pl").

loadTestValid:-
    findall(I, integration(I), LI), forall(member(I, LI), svalid(integration(I))).

loadTestExplain:-
    findall(I, integration(I), LI), forall(member(I, LI), explain(integration(I))).

svalid(integration(X)):-
    (
        valid(integration)->
        Z=1, !
        ; Z=0
    ),
    write(X), write(=), write(Z), nl.

