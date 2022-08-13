%{
int COMMENT=0;
int keywords=0;
int identifiers=0;
int spaces=0;
int lines=0;
int comments=0;
int words=0;
int stringLiterals=0;
int numericLiterals=0;
int preprocessorDirectives=0;
%}

identifier [a-zA-Z][a-zA-Z0-9]*
spaces[\t]
commentstart"/*"
commentend"*/"
digits[0-9]
sign[+-]

%%

#.* {printf("%s is a preprocessor directive\n", yytext);preprocessorDirectives++;}

auto |
break |
case |
char |
const |
continue |
default |
do |
double |
else |
enum |
extern |
short |
for |
goto |
if |
int |
long |
register |
return |
float |
signed |
sizeof |
static |
switch |
typedef |
union |
unsigned |
void |
volatile |
while {
    if(!COMMENT)
        {
            printf("%s is a KEYWORD\n", yytext);
            keywords++;
        }
}
({sign}?({digits}+)("."?)({digits}*)) {
    if(!COMMENT) {
        printf("%s is a NUMERIC LITERAL\n", yytext);
        numericLiterals++;
    }
}

\".*\" {
    if(!COMMENT) {
        printf("%s is a STRING LITERAL\n", yytext);
        stringLiterals++;
    }
}

{identifier} {
    if(!COMMENT) {
        printf("%s is an IDENTIFIER\n", yytext);
        identifiers++;
    }
    else {
        printf("%s is an IDENTIFIER\n", yytext);
        words++;
    }
}

{commentstart} {COMMENT = 1; printf("Comment Started...\n");}
{commentend} {COMMENT = 0; comments++; printf("Comment Ended...\n");}

{spaces} {spaces++;}

\n {printf("endline\n");lines++;}

.;

%%
int main() {
    yylex();
    printf("\n\n--------------RESULTS--------------");
    printf("\nInput program has %d preprocessor directives", preprocessorDirectives);
    printf("\nInput program has %d keywords", keywords);
    printf("\nInput program has %d identifiers", identifiers);
    printf("\nInput program has %d comments", comments);
    printf("\nInput program has %d lines", lines);
    printf("\nInput program has %d spaces", spaces);
    printf("\nInput program has %d words", words);
    printf("\nInput program has %d int literals", numericLiterals);
    printf("\nInput program has %d string literals", stringLiterals);
    printf("\n");
    return 0;
}