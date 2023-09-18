% comp(a, b, c).
domains
    name=person(symbol First,symbol Last)
    birthday = b_date(symbol Month, integer Day, integer Year)
    ph_num = symbol % Phone_number
predicates
    phone_list(name, ph_num, birthday)
clauses
    phone_list(person(ed,willis),"422-02-08",b_date(aug,3,1955)).
    phone_list(person(chris,grahm),"433-99-06",b_date(may,12,1962)).