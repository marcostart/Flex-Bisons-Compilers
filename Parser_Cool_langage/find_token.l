/* This program identifies tokens (identifiers, integers, keywords, operators, string) in another program written in cool language */

%{
    int nb_id = 0, nb_ent = 0, nb_ch = 0, nb_op = 0, nb_mc = 0;
%}
ident   [a-zA-Z_][0-9a-zA-Z_]*
entier  [+-]?[1-9][0-9]*|0
keywords    (class|else|false|fi|if|in|inherits|isvoid|let|loop|pool|then|while|case|esac|new|of|not|true|Int|String|Bool)
operateur   (<=|>=|<-|[-+=/*<>:,;\(\)\{\}.])
%%
"--".*\n    
"(*".*"*)"  
{keywords}  {printf("Mots clés :\t %s\n\n", yytext);
            ++nb_mc;}
{ident}     {printf("Identifiant :\t %s\n\n", yytext);nb_id++;}
{entier}    {printf("Entier :\t %s\n\n", yytext);
            ++nb_ent;}
{operateur}  {printf("Opérateurs/séparateurs :\t %s\n\n", yytext);
            ++nb_op;}
"\""[^"]*"\""    {printf("Constante chaine de caractère :\t %s\n\n", yytext);
            ++nb_ch;}
.|\n       
%%
main(){
	yylex();
	printf("Nombre d'identifiants :\t %d;\n\nNombre d'entiers :\t %d;\n\nNombre d'opérateurs/séparateurs :\t %d\n\nNbre de mots clés :\t %d\nNombre de constantes chaine de caractères :\t %d\n", nb_id, nb_ent, nb_op, nb_mc, nb_ch);
}
