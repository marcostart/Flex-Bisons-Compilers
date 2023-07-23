all:	int_lang

int_lang:	int_lang.l int_lang.y
	bison -dv int_lang.y -Wconflicts-sr -Wcounterexamples
	flex int_lang.l
	cc -o $@ int_lang.tab.c lex.yy.c -lfl