grammar ElConcatenator;

@header{import circuits.*;}

//Program
prog : circuit command;
WS : [ \t\r\n]+ -> skip;


//Circuit
circuit : 'eq_circuit' LPAR input RPAR 'returns' LPAR output RPAR listequat 'end';


//Command
command : descr command | eval command | ;
descr : 'descr()';
eval : 'eval' LPAR testval RPAR ;


//Input
input : ID moreinput ;
moreinput : ',' ID moreinput | ;


//Output
output : ID moreoutput;
moreoutput : ',' ID moreoutput | ;


//List of equations
listequat : equat listequat | ;


//Boolean equations
equat : ID '=' boolexpre ';' ;


//Boolean expressions
boolexpre : expr ;
expr : unaire oper;
oper : AND expr {new And();} | OR expr {new Or();} | ; //création des portes AND/OR
unaire : ID | LPAR expr RPAR | INV LPAR expr RPAR;

ID : ([a-z][a-z]*[A-Z]*[0-9]*)+ ;
LPAR : '(' ; RPAR : ')' ;
AND : '&' ; OR : '|' ; INV : '!' ;

//Test value for eval function
testval : 'true' moretestval | 'false' moretestval ;
moretestval : ',' testval moretestval | ;




