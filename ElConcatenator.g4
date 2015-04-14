grammar ElConcatenator;

//Input
circuit : 'eq_circuit' LPAR input RPAR 'returns' LPAR output RPAR listequat 'end' { System.out.println("\nSUGOI!!!"); };
input : id moreinput ;
moreinput : ',' id moreinput | ;
output : id moreoutput ;
moreoutput : ',' id moreoutput | ;
WS : [ \t\r\n]+ -> skip;


//List of equations
listequat : equat listequat | ;


//Boolean equations
equat : id '=' boolexpre ';' ;


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




