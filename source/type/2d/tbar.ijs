NB. bar test

NB. dat=. 0.6 0.8 1* >:?.3#,:3 3 4 7 7
NB. xlab=. '"2001" "2002" "2003" "2004" "2005"'
NB. pd 'reset'
NB. pd 'type fbarv'
NB. pd 'title Stacked Bars'
NB. pd 'key one two three four five'
NB. pd dat
NB. pd 'show'


pd 'reset'
pd 'type bar'
pd 'axes 1 0'
pd 'xlabel ',":2001+i.4
pd 'title Bar Chart'
pd 'barwidth 0.25'
pd 0.6 0.8 1* _0.5+?.3#,:3 4 7 4
pd dat
pd 'show'
