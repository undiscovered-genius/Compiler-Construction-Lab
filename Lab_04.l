%{
%}
%%name lex


[0] {printf("Found 0\n");}
%%

void main(int argc, char* argv[])
{
if (yyin=fopen(argv[1], "r"))
{
printf("The text file is opened successfully\n");
}
else
{
printf("error in opening");
}
yylex();
fclose(yyin);
}
