lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}


TK_class : 'class Program';


LCURLY : '{';
RCURLY : '}';

LPAR : '(';
RPAR : ')';

LCOL : '[';
RCOL : ']';

RESERVADA : ('boolean'|'break'|'callout'|'class'|'continue'|'else'|'for'|'int'|'return'|'void'|'if');

BOOLEANLITERAL : ('true'|'false');

ID : (ALF|'_')~'.'(ALF|NUM|'_')*~'.';

WS_ : ((' ')+|'\n'|'\t') -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ALF|NUM|ESC|EPC) '\'';

STRING: '"'(ALF|NUM|EPS)*'"';

INTLITERAL : (NUM(NUM)*|'0x'(NUM|HEX)+);

OP : ('+'|'-'|'*'|'<'|'<='|'!='|'&&'|'>'|'>='|'='|'!'|'||'|'=='|'%');

TIPO: ('int' | 'boolean');

END: ';';

VIR: ',';

fragment
BOL : ('true'|'false');
ESC : '\\' ('n'|'t'|'\\'|'"');
ALF : ('a'..'z' | 'A'..'Z');
NUM : ('0'..'9');
HEX : ('a'..'f'|'A'..'F');
EPC : (' '..'!'|'#'..'&'|'('..'/'|':'..'@'|'['|']'|'^'..'`'|'{'..'~');
EPS : (' '..'!'|'#'..'&'|'('..'/'|':'..'@'|'['|']'|'^'..'`'|'{'..'~'|'"'|'\\\''|'\t'|'\\'|'\"');
