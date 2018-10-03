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

field_decl:  tipo id (VIR tipo id)* PV | tipo id LCOL int_literal RCOL (VIR tipo id LCOL int_literal RCOL)* PV;

method_decl: (tipo | VOID) id LPAR (tipo id (VIR tipo id)*)* RPAR block;

sub_method_var: tipo id;

tipo: INT | BOOLEAN;

block: LCURLY var_decl* statement* RCURLY;

var_decl: tipo id (VIR id)* PV;

statement: location assign_op expr PV | method_call PV | IF (expr) block (ELSE block)* | FOR id assign_op expr VIR expr block | RETURN (expr)* PV | BREAK PV | CONTINUE PV | block;

method_call: method_name LPAR (expr (VIR expr)*)* RPAR | CALLOUT LPAR (STRING (VIR callout_arg (VIR callout_arg)*)*) RPAR;

method_name: id;

location: id | id LCOL expr RCOL;

expr: location | method_call | literal | expr bin_op expr | MENOS expr | EXCLA expr | LPAR expr RPAR;

callout_arg: expr | STRING;

bin_op: (ARITH_OP|REL_OP|EQ_OP|COND_OP);

literal: int_literal | CHAR | bool_literal;

assign_op: ASSIGN_OP | IGUAL;

int_literal: INTLITERAL;

bool_literal: TRUE | FALSE;

id: ID;

