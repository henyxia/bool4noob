grammar ElConcatenator;

//Program
prog : circuit command { System.out.println("\nSUGOI!!!"); };
WS : [ \t\r\n]+ -> skip;


//Circuit
circuit : 'eq_circuit' LPAR input RPAR 'returns' LPAR output RPAR listequat 'end' ;


//Command
command : descr command | eval command | ;
descr : 'descr()';
eval : 'eval' LPAR testval RPAR ;


//Input
input : id moreinput ;
moreinput : ',' id moreinput | ;


//Output
output : id moreoutput ;
moreoutput : ',' id moreoutput | ;


//List of equations
listequat : equat listequat | ;


//Boolean equations
equat : id '=' boolexpre ';' ;


//Boolean expressions
boolexpre : expr ;
expr : unaire oper;
oper : AND expr | OR expr | ;
unaire : id | LPAR expr RPAR | INV LPAR expr RPAR;
id : FIRSTCHAR (MORECHAR)*;

LPAR : '(' ; RPAR : ')' ;
AND : '&' ; OR : '|' ; INV : '!' ;
FIRSTCHAR : [a-z] | [A-Z];
MORECHAR : [a-z] | [A-Z] | [0-9];

//Test value for eval function
testval : 'true' moretestval | 'false' moretestval ;
moretestval : ',' testval moretestval | ;




