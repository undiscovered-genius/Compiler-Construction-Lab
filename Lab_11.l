%{
#include<stdio.h>
#include<stdlib.h>
int flag,c,j,rev=0;
%}

%%
[0-9]+ {c=atoi(yytext);
		j=c;
		rev=0;
		flag=0;
		while(j > 0){
			rev = (rev*10)+(j%10);
			j = j/10;
		}
		if (rev == c){
			flag=1;
		}
		if(flag == 1){
			printf("\n Palin number");
		}else{
			printf("\n Not a Palindrome");
		}
		
		
		
	}
%%

int main()
{
yylex();
return 0;
}

