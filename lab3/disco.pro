% :- dynamic organization/2.
% :- dynamic character/3.

%факты
%%пол
male(garrie).
male(kim).
male(evrart).
male(measurehead).
male(hardy).
female(soona).
female(joice).

%%надежность
credible(kim).
credible(soona).
credible(hardy).

%%уровень жизни
rich(evrart).
rich(joice).
wealthy(kim).
wealthy(soona).
poor(hardy).
poor(garrie).
poor(measurehead).

%%наличие образования
educated(joice).
educated(evrart).
educated(soona).

%предикаты
%%тип работы по работодателю
works_for(garrie, government).
works_for(kim, government).
works_for(evrart, buisness).
works_for(hardy, buisness).
works_for(measurehead, buisness).
works_for(soona, corporation).
works_for(joice, corporation).

%%кто кому нравится
likes(garrie, kim).
likes(kim, garrie).
likes(garrie, soona).
likes(hardy, evrart).

%%кто кого ненавидит
hates(measurehead, kim).
hates(joice, evrart).
hates(evrart, joice).
hates(hardy, garrie).
hates(hardy, kim).

%%кто кого боится
afraids_of(kim, garrie).
afraids_of(garrie, evrart).
afraids_of(garrie, measurehead).
afraids_of(joice, evrart).
afraids_of(kim, joice).

%%составные объекты
%%домены
domains 
    name=name(first_name, last_name)
    organization=organization(naming, type)
% name, type, sex, first_name, last_name=symbol

%%определения составных объектов
predicates 
    character(full_name, sex, organization*).

    % organization(naming, type).

% RGM=organization('rgm', government).
% Trade_union=organization('trade union', buisness).
% Fortress_Accident=organization('fortress accident', corporation).
% Rsa_radios=organization('rsa radios', corporation).
% Wild_pines=organization('wild pines', buisness).

%%описания персонажей в одном объекте
character(name(garrie, debua), male, [organization('rgm', government)]).
character(name(kim, kitsuragi), male, [organization('rgm', government)]).
character(name(soona, luukanen), female, [organization('fortress accident', corporation), organization('rsa radios', corporation)]).
character(name(joice, messier), female, [organization('wild pines', buisness)]).
character(name(tit, hardy), male, [organization('trade union', buisness)]).
character(name(evrart, claire), male, [organization('trade union', buisness)]).
character(name(jean_luc, measurehead), male, [organization('trade union', buisness)]).

%правила
%%кто кому друг
friend(X, Y) :- likes(X, Y), likes(Y, X).
%%есть ли друзья
has_friends(X) :- friend(X, _).

%%кто ктому враг
enemies(X, Y) :- hates(X, Y), hates(Y, X).
%%есть ли враги
has_enemies(X) :- enemies(X, _).
%%есть ли работа
has_work(X) :- works_for(X, _).
%%может ли быть интересен полиции
possible_rgm_target(X) :- not(credible(X)).

%%принадлежность к определенным политическим взглядам 
socialist(X) :- (poor(X); wealthy(X)), has_work(X), (works_for(X, government); works_for(X, buisness)), has_friends(X).
liberal(X) :- (wealthy(X); rich(X)), has_work(X).
supremasist(X) :- poor(X), not(has_friends(X)), not(has_work(X)).
monarhist(X) :- (wealthy(X); rich(X)), educated(X).
moralist(X) :- likes(X, _), not(has_enemies(X)).
