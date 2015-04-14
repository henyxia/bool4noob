grammar Vars;

r : ID;

ID : FIRSTCHAR (MORECHAR)*;
FIRSTCHAR : [a-z] | [A-Z];
MORECHAR : [a-z] | [A-Z] | [0-9];
//WS : [ \t\r\n]+ -> skip;
