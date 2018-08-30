lexer grammar DecafLexer;

@header {
package decaf;
}

options
{
  language=Java;
}

tokens
{
  TK_class
}

LCURLY : '{';
RCURLY : '}';


ID  :(ALF|'_')(ALF|NUM|'_')*;

WS_ : (' ' | '\n' ) -> skip;

SL_COMMENT : '//' (~'\n')* '\n' -> skip;

CHAR : '\'' (ASCII) '\'';

STRING : '"' (ASCII2)* '"';

fragment
ESC :  '\\' ('n'|'"');
ALF : ('a'..'z' | 'A'..'Z');
NUM : ('0'..'9');
ASCII: ( ' '| '!' | '#'..'&' | '('..'/' | ':'..'@' | '[' | ']'..'`' | '{'..'~'|'a'..'z' | 'A'..'Z' | '0'..'9' | '\\n' | '\\t' | '\\'('\\') | '\\" | ');
ASCII2: ( ' '| '!' | '#'..'&' | '('..'/' | ':'..'@' | '[' | ']'..'`' | '{'..'~'|'a'..'z' | 'A'..'Z' | '0'..'9' | '\\t' | '\\'('\\') | '\\" | '\\\'');
