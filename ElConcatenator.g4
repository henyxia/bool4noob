grammar ElConcatenator;

@header{import circuits.*;}
@members{CircuitParser myCircuit = new CircuitParser("AllMyCircuits");}

prog : circuit command;
WS : [ \t\r\n]+ -> skip;

circuit : 'eq_circuit' LPAR input RPAR 'returns' LPAR output RPAR listequat 'end';

command : descr command
| eval command {myCircuit.eval();}
| ;
descr : 'descr()';
eval : 'eval' LPAR testval RPAR ;

input : ID moreinput {myCircuit.addCmp("in", $ID.text);};
moreinput : ',' ID moreinput {myCircuit.addCmp("in", $ID.text);} | ;

output : ID moreoutput {myCircuit.addCmp("out", $ID.text);};
moreoutput : ',' ID moreoutput {myCircuit.addCmp("out", $ID.text);} | ;

listequat : equat listequat | ;

equat : ID '=' boolexpre ';' ;

boolexpre : expr ;
expr : unaire oper;
oper : AND expr {new And();} | OR expr {new Or();} | ; //création des portes AND/OR
unaire : ID | LPAR expr RPAR | INV LPAR expr RPAR;

ID : ([a-z][a-z]*[A-Z]*[0-9]*)+ ;
LPAR : '(';
RPAR : ')';
AND : '&';
OR : '|';
INV : '!';

testval : 'true' moretestval | 'false' moretestval ;
moretestval : ',' testval moretestval | ;

/*notes lel :
List <Inter> is = new ArrayList<Inter>(ins.values());
*/


