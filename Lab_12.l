%{
%}

%%
[a-z]+ {
    printf("\nString contains only lower case letters = ");
    ECHO;
}

[a-zA-Z]+ {
    printf("\nString contains both lower and upper case letters = ");
    ECHO;REJECT;
}
. {
    printf("\nString contains mixed letters = ");
    ECHO;
}

%%

int main() {
    yylex();
    return 0;
}
