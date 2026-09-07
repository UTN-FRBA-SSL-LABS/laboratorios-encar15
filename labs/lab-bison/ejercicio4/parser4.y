%{
#include <stdio.h>
#include <stdlib.h>

int  yylex(void);
void yyerror(const char *msg) { (void)msg; }
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%

input:
    /* vacío */
  | input linea
  ;

linea:
    exp '\n'          { printf("= %d\n", $1); }
  | error '\n'        { yyerrok; printf("Error: sintaxis invalida\n"); }
  ;

exp:
    exp '+' exp   { $$ = $1 + $3; }
  | exp '-' exp   { $$ = $1 - $3; }
  | exp '*' exp   { $$ = $1 * $3; }
  | exp '/' exp   { $$ = $1 / $3; }
  | '(' exp ')'   { $$ = $2; }
  | NUM           { $$ = $1; }
  ;

%%

int main(void) {
    return yyparse();
}
