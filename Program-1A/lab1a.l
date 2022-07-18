%{
	#include<stdlib.h>
	#include<stdio.h>
	int a[]={0,0,0,0},i,valid=1,opnd=0;
	int done();
%}

%x OPER

%%
[0-9]+ { BEGIN OPER; opnd++;}
<OPER>"+" { if(valid) { valid=0;i=0;} else {done();}}
<OPER>"-" { if(valid) { valid=0;i=1;} else {done();}}
<OPER>"*" { if(valid) { valid=0;i=2;} else {done();}}
<OPER>"/" { if(valid) { valid=0;i=3;} else {done();}}
<OPER>[a-zA-Z0-9]+ { opnd++; if(valid==0){ valid=1; a[i]++;} else{ done(); }}	
<OPER>"\n" { if(valid==0){ done();} else {return 0;}}
.\n done();
%%

int done()
{
	
	printf("Invalid Expression \n");
	exit(0);
}

void main()
{
	printf("Type the arithmetic Expression \n");
	yylex();
	printf("Valid Arithmetic Expression \n");
	printf("No. of Operands/Identifiers : %d \n",opnd);
	printf("No. of Additions : %d \nNo. of Subtractions : %d \n",a[0],a[1]); 
	printf("No. of Multiplications : %d \nNo. of Divisions : %d \n",a[2],a[3]);
}
