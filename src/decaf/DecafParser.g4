parser grammar DecafParser;

@header {
package decaf;
}

options
{
  language=Java;
  tokenVocab=DecafLexer;
}

program: TK_class LCURLY field_decl* method_decl* RCURLY;

field_decl:  sub_method_var (VIR sub_method_var)* PV | sub_method_var LCOL integer_literal RCOL (VIR sub_method_var LCOL integer_literal RCOL)* PV;

method_decl: (type | VOID) ID LPAR (sub_method_var (VIR sub_method_var)*)* RPAR block;

sub_method_var: type ID;

type: INT | BOOLEAN;

block: LCURLY var_decl* statement* RCURLY;

var_decl: type ID (VIR ID)* PV;

statement: location assign_op expr PV | method_call PV | IF (expr) block (ELSE block)* | FOR ID assign_op expr VIR expr block | RETURN (expr)* PV | BREAK PV | CONTINUE PV | block;

method_call: method_name LPAR (expr (VIR expr)*)* RPAR | CALLOUT LPAR (STRING (VIR callout_arg (VIR callout_arg)*)*) RPAR;

method_name: ID;

location: ID | ID LCOL expr RCOL;

expr: location | method_call | literal | expr bin_op expr | MENOS expr | EXCLA expr | LPAR expr RPAR;

callout_arg: expr | STRING;

bin_op: (arith_op|REL_OP|EQ_OP|COND_OP);

arith_op: MAIS|MENOS|PORC|DIV|MULT;

literal: integer_literal | CHAR | bool_literal;

assign_op: ASSIGN_OP | IGUAL;

integer_literal: INTEGER_LITERAL;

bool_literal: TRUE | FALSE;
