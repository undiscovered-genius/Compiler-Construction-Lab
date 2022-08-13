/*lex program to identify capital string from the given iunput string and count the number of capital letters present in a given string*/

%{
int c=0,a;
%}
%%
[A-Z]+ {c+=yyleng;printf("the string %d = %s\n", ++a,yytext);}
%%
int main()
{
printf("enter the String\n");
yylex();
printf("the Captial string are= %d\n",c);
}
