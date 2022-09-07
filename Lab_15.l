%{

//Flex program to implement START condition

%}

%option noyywrap
%s SM SMBG

%%

# BEGIN(SM);
## BEGIN(SMBG);

[0-9]+ {	//Rule 3: Match digits
		printf("\nIt's a digit");
	}

<SMBG>[A-Z]+ {	
		//Rule 4: Match lower and upper case
		printf("\nString contains upper case letters");
	  }
<SM>. {
	//Rule 5 
	printf("\nExiting from # start condition");
	BEGIN(INITIAL);
      }

<SM,SMBG>[a-z]+ {
		//Rule 6
		printf("\nString contains lower case letters");
		}
<SMBG>.+ {
	//Rule 7
	printf("\nExiting from ## start conditions");
	}
.+ {
	//Rule 8
	printf("\nNo Action to execute");
   }

%%

void main()
{
	printf("\nEnter # when expecting digits & small case");
	printf("\nEnter ## when expecting big & small case\n\n");
	yylex();
}
