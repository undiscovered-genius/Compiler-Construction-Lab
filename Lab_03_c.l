%option noyywrap
%{
	#include<stdio.h>
%}

%%
[aeiouAEIOU] {printf("%s Vowel \n",yytext);}
[A-Za-z] {printf("%s Consonent \n",yytext);}
%%

int main(){
	printf("Enter the string : ");
	yylex();
}
