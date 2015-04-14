grammar BoolExpr;

boolexpre : EXPR { System.out.println("\nOK!"); } ;

EXPR : UNAIRE OPER;
OPER : ET EXPR | OU EXPR | ;
UNAIRE : IN | LPAR EXPR RPAR | INV LPAR EXPR RPAR;

LPAR : '(' ; RPAR : ')' ;
ET : '&' ; OU : '|' ; INV : '!' ;
IN : ([a-z][a-z]*[A-Z]*[0-9]*)+ ;

