grammar ElConcatenator;

prog : expr { System.out.println("\nSUGOI!!!"); } ;

expr : unaire oper;
oper : ET expr | OU expr | ;
unaire : id | LPAR expr RPAR | INV LPAR expr RPAR;
id : FIRSTCHAR (MORECHAR)*;


LPAR : '(' ; RPAR : ')' ;
ET : '&' ; OU : '|' ; INV : '!' ;
FIRSTCHAR : [a-z] | [A-Z];
MORECHAR : [a-z] | [A-Z] | [0-9];


