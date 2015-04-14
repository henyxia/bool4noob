grammar Equation;

equat : ID '=' boolexpre ';';
WS : [ \t\r\n]+ -> skip;
