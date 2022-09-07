%{
#include<stdio.h>
#include<stdlib.h>
%}

%s SM SMBG
%%
# BEGIN(SM);
## BEGIN(SMBG);
[0-9]+ {
    PRINTF("\nIts a digit");
}

<SMBG>[A-Z]+ {
    printf("\nGiven string contains big letter(s)");
}

<SM>. {
    printf("\nExiting from # start condition");
    BEGIN(INITIAL);
}

<SM, SMBG>[a-z]+ {
    printf("\nGiven string contains small letters(s)");
}

<SMBG>.+ {
    printf("\nExiting from ## start conditions");
}

.+ {
    printf("\nNO action to execute");
}
%%

int main() {
    printf("Enter # when u r expecting digits and small case letters string");
    printf("Enter ## when u r expecting only big and small case letters string");
    yylex();
    return 0;
}
