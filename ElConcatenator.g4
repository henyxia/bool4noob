grammar ElConcatenator;

@header{import circuits.*;}
@members{CircuitParser myCircuit = new CircuitParser("AllMyCircuits");}

prog : circuit command;
WS : [ \t\r\n]+ -> skip;

circuit : 'eq_circuit' LPAR input RPAR 'returns' LPAR output RPAR listequat 'end';

command : descr command {myCircuit.description();}
	| eval command {myCircuit.eval();}
	| ;
descr : 'descr()';
eval : 'eval' LPAR testval RPAR ;

input : ID moreinput {myCircuit.addCmp("in", $ID.text);};
moreinput : ',' ID moreinput {myCircuit.addCmp("in", $ID.text);} | ;

output : ID moreoutput {myCircuit.addCmp("out", $ID.text);};
moreoutput : ',' ID moreoutput {myCircuit.addCmp("out", $ID.text);} | ;

listequat : equat listequat | ;

equat : ID '=' expr ';'
{
	System.out.println("Setting expression for " + $ID.text);
	myCircuit.outputs.get($ID.text).setIn($expr.e);
};

expr returns [Composant e]:
	ID
	{
		$e=myCircuit.intNames.get($ID.text);
	}
	| LPAR expr RPAR
	{
		$e=$expr.e;
	}
	| INV LPAR var=expr RPAR
	{
		Not tmp = new Not();
		tmp.setIn($var.e);
		myCircuit.addCmp("not", tmp);
		$e=tmp;
	}
	| e1=expr AND e2=expr {new And();}
	{
		And tmp = new And();
		tmp.setIn1($e1.e);
		tmp.setIn2($e2.e);
		myCircuit.addCmp("and", tmp);
		$e=tmp;

	}
	| e1=expr OR e2=expr {new Or();}
	{
		Or tmp = new Or();
		tmp.setIn1($e1.e);
		tmp.setIn2($e2.e);
		myCircuit.addCmp("or", tmp);
		$e=tmp;
	};

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


