all:	find_token

find_token:	find_token.l
	flex find_token.l
	cc -o $@ lex.yy.c -lfl