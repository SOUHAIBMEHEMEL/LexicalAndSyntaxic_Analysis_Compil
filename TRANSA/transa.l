%option noyywrap 
%{
#include <stdlib.h>
#include <stdio.h>
%}

%start INIT E1

entier_positive [0-9]+
entier_negative -[0-9]+
reel [0-9]+,[0-9]+

commentaire "/*"(.|\n)*"*/"


%%

 

^. { fprintf(yyout, "@");}
{entier_positive} { fprintf(yyout, "%d ",atoi(yytext)+3);}
{entier_negative} { fprintf(yyout, "%d ",atoi(yytext)-3);}
{reel} { fprintf(yyout, "%s ",yytext);}
{commentaire} { fprintf(yyout, "%s ",yytext);}

. {}

%%
int main()
{
  FILE *input = fopen("doc1.txt", "r");
  FILE *output = fopen("doc2.txt", "w");
  yyout = output;
  
		if(input)
		yyin = input;
		
  yylex();
  return 1;
}