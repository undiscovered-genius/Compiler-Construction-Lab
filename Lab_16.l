%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
[a-z]+ {
    printf("\nIts a lower case letter=");
    ECHO;printf("\nBeginning of the 1st yymore");
    yymore();printf("\nEnd of the 1st yymore\n");
}

[A-Z]+ {
    printf("\nIts a upper case letter=");
    ECHO;printf("\nBeginning of the 2nd yymore");
    yymore();printf("\nEnd of the 2nd yymore\n");
}
%%

int main() {
    yylex();
    return 0;
}
