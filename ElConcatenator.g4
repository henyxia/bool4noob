grammar ElConcatenator;

//Boolean equations
equat : id '=' boolexpre ';' { System.out.println("\nSUGOI!!!"); };
WS : [ \t\r\n]+ -> skip;


//Boolean expressions
boolexpre : expr ;
expr : unaire oper;
oper : ET expr | OU expr | ;
unaire : id | LPAR expr RPAR | INV LPAR expr RPAR;
id : FIRSTCHAR (MORECHAR)*;

LPAR : '(' ; RPAR : ')' ;
ET : '&' ; OU : '|' ; INV : '!' ;
FIRSTCHAR : [a-z] | [A-Z];
MORECHAR : [a-z] | [A-Z] | [0-9];




