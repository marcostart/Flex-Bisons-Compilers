
%{
    # include "int_lang.tab.h"    
%}
ident   [a-zA-Z_][0-9a-zA-Z_]*
%%
"+"     {return ADD;}
"-"     {return SUB;}
"="     {return EG;}
"def"   {return DEF;}
"if"     {return IF;}
"then"     {return THEN;}
"else"   {return ELSE;}
";"     {return SMC;}
","     {return CM;}
"("     { return OP; }
")"     { return CP; }
[0-9]+	{ yylval.numval = atoi(yytext); return INT; }
{ident} {yylval.strval = strdup(yytext); return ID;}
\n      { return EOL; } 
[ \t]   { /* ignore white space */ }
.	{ yyerror("Mystery character %c\n", *yytext); }
%%
