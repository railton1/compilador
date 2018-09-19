parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class LCURLY field_decl RCURLY;

field_decl:  test (VIR test)*;

test: TIPO ID | TIPO ID LCOL INTLITERAL RCOL;

