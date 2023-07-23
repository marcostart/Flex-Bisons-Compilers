%{
#  include <stdio.h>
void yyerror(char *s)
{
  fprintf(stderr, "Erreur syntaxique : %s\n", s);
}
%}

%union {
    char* strval;
    int numval;
}

/* declaration des tokens */

//entier
%token <numval> INT

//Opérateur
%token <strval> ADD SUB EG

//Mots clés
%token <strval> DEF IF ELSE THEN

//Ponctuation
%token <strval> ID SMC CM
%token <strval> OP CP

//Saut de ligne
%token <strval> EOL

//Symbole de départ
%start program

%%

program: program program_def EOL {printf("Analyse réussie avec succès !\n> ");}
      | program EOL {printf("> ");}
      | 
     ;

program_def: definition SMC program_def
          | definition
           ;

definition: DEF ID OP args CP EG expression SMC
          ;

args: ID
    | ID CM args
    ;

expression: INT
          | ID
          | if_expression
          | function_call
          | number ADD expression
          | number SUB expression
          ;

number: ID
    | INT
    ;

if_expression: IF compar THEN expression ELSE expression
              ;

compar: expression EG expression
    ;

function_call: ID OP expression_list CP
             ;

expression_list: expression
                | expression CM expression_list 
                ;
%%
int main()
{
  printf("> "); 
  yyparse();
  printf("Fin de l'analyse syntaxique !\n");
}

