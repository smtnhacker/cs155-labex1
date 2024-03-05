/* CS 155 Lab 1     */
/* 23-Feb-2022 smtnhacker */
/* A lexical analyzer for the EASY-C language. */

%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

RESERVED_WORD  "PROCEDURE"|"VAR"|"INTEGER"|"REAL"|"BOOLEAN"|"STRING"|"WRITELN"|"NOT"|"OR"|"DIV"|"MOD"|"AND"|"IF"|"THEN"|"ELSE"|"WHILE"|"DO"|"FOR"|"TO"|"DOWNTO"|"BEGIN"|"END"
SEMICOLON      [;]
COLON          [:]
PLUS           [+]
MINUS          [-]
OP             ":="|"*"|"/"|"="|"<>"|"<"|"<="|">"|">="|","
PARENTHESIS    "("|")"
IDENT          [a-zA-Z]+[a-zA-Z0-9]*
STRING         ["][^"\n]*["]
US_DIGIT_SEQ   [0-9]+
DIGIT_SEQ      ({PLUS}|{MINUS})?{US_DIGIT_SEQ}
REAL           {DIGIT_SEQ}[.]{US_DIGIT_SEQ}?

%%
{RESERVED_WORD}   { ret_print("RESERVED_WORD"); }
{SEMICOLON}       { ret_print("SEMICOLON"); }
{COLON}           { ret_print("COLON"); }
{PLUS}            { ret_print("PLUS"); }
{MINUS}           { ret_print("MINUS"); }
{OP}              { ret_print("OP"); }
{PARENTHESIS}     { ret_print("PARENTHESIS"); }
{IDENT}           { ret_print("IDENT"); }
{STRING}          { ret_print("STRING"); }
{US_DIGIT_SEQ}    { ret_print("US_DIGIT_SEQ"); }
{DIGIT_SEQ}       { ret_print("DIGIT_SEQ"); }
{REAL}            { ret_print("REAL"); }
"\n"              { lineno++; }
[ \t\r\f]+	      /* eat up whitespace */
.	               { yyerror(); }
%%

void ret_print(char *token_type){
   printf("L%d: <%s, \"%s\">\n", lineno, token_type, yytext);
}

void yyerror(){
   printf("L%d: lexical error %s\n", lineno, yytext);
   exit(1);
}

int main(int argc, char *argv[]){
   yyin = fopen(argv[1], "r");
   yylex();
   fclose(yyin);
   return 0;
}