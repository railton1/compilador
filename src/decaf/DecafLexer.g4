lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

TK_class : 'class Program';

CHAR: '\''(ESC|ALF|NUM|' '|'!'|'#'|'$'|'%'|'&'|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~')'\'';

STRING: '"'(ALF|NUM|' '|'!'|'"'|'#'|'$'|'%'|'&'|'\\\''|'('|')'|'*'|'+'|','|'-'|'.'|'/'|':'|';'|'<'|'='|'>'|'?'|'@'|'['|']'|'^'|'_'|'´'|'`'|'{'|'|'|'}'|'~'|'\t'|'\\'|'\"')*'"';

LCURLY : '{';
RCURLY : '}';

LPAR : '(';
RPAR : ')';

LCOL : '[';
RCOL : ']';

BOOLEANLITERAL : ('true'|'false');

TRUE: 'true';

FALSE: 'false';

INT: 'int';

VIR: ',';

PV: ';';

VOID: 'void';

IF: 'if';

ELSE: 'else';

FOR: 'for';

RETURN: 'return';

BREAK: 'break';

IGUAL: '=';

CONTINUE: 'continue';

CALLOUT: 'callout';

ASSIGN_OP: ('+='|'-=');

EXCLA: '!' ;

MENOS: '-';

BOOLEAN: 'boolean';

MAIS: '+';

MULT: '*';

DIV: '/';

PORC: '%';

REL_OP: ('<'|'>'|'<='|'>=');

EQ_OP: ('=='|'!=');

COND_OP: ('&&'|'||');

NUMERO: NUM(NUM)*;

HEXA: '0x'(HEX|HEX)*;

ID : (ALF|'_')(ALF|NUM|'_')*;

WS : [ \t\r\n]+ -> skip;

SL_COMMENT : '//'(~'\n')*'\n' -> skip;

fragment ESC : '\\'('n'|'t'|'\\'|'"');
fragment ALF : ('a'..'z' | 'A'..'Z');
fragment NUM : ('0'..'9');
fragment HEX : ('0'..'9'|'a'..'f'|'A'..'F');

