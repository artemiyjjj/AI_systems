% 1
male(evrart).
female(hardy).
works_for(joice, corporation).
character(name(garrie, debua), male, [organization('rgm', government)]).

%2
credible(soona); educated(soona); not(works_for(soona, buisness)).
afraids_of(kim, evrart), hates(evrart, kim).
not(works_for(measurehead, government); rich(hardy)), (educated(garrie); rich(evrart)).

%3
female(Who).
likes(garrie, X).
works_for(Y, buisness), hates(Y, kim).
character(X, female, Y).

%4
friend(X, kim).
% friend(X, character(name(kim, _), _, _)).
has_work(X), possible_rgm_target(X).
not(works_for(X, government)), possible_rgm_target(X), not(moralist(X)).
socialist(X), liberal(X), monarhist(X), moralist(X).