%{
    #include <stdio.h>
    #include <ctype.h>
    #define YYSTYPE double
    int yylex();
    #pragma GCC diagnostic ignored "-Wimplicit-function-declaration"
%}
%start line
%token NUMBER
%left '+' '-'
%left '*' '/'

%%
line : expr'\n'        { printf("\033[0;31m [Result] : %f\033[0m\n", $1); }
    ;
expr : expr'+'term     { $$ = $1 + $3 ; printf("\033[01;34m Reduce : E -> E + T\033[0m\n");}
    | expr'-'term      { $$ = $1 - $3 ; printf("\033[01;34m Reduce : E -> E - T\033[0m\n");}
    | term             { $$ = $1 ; printf("\033[01;34m Reduce : E -> T\n");}
    ;
term : term'*'factor   { $$ = $1 * $3 ; printf("\033[01;34m Reduce : T -> T * F\033[0m\n");}
    | term'/'factor    { $$ = $1 / $3 ; printf("\033[01;34m Reduce : T -> T / F\033[0m\n");}
    | factor           { $$ = $1 ; printf("\033[01;34m Reduce : T -> F\033[0m\n");}
    ;
factor : '('expr')'    { $$ = $2 ; printf("\033[01;34m Reduce : F -> (E)\033[0m\n");}
    | NUMBER           { $$ = $1 ; printf("\033[01;34m Reduce : F -> NUMBER\033[0m\n");}
    ;
%%
int main()
{
    freopen("in.txt", "r", stdin);
    return yyparse();
}

int yylex()
{
    static int done = 0;    // flag to end parse.
    if(done) return 0;
    int c = 0, is_num = 0;
    double Decimal = 0, base = 10;
    while((c=getchar())==' ');
    yylval = 0;
    if(isdigit(c)) is_num = 1;
    while(is_num && isdigit(c))
    {
        yylval = yylval * 10 + (c-'0');
        c = getchar();
    }
    if(c == '.')
    {
        c = getchar();
        while(isdigit(c))
        {
            Decimal += (c-'0') / base;
            base *= 10;
            c = getchar();
        }
        yylval += Decimal;
    }
    if(is_num)
    {
        ungetc(c, stdin); // we must reput the last charactor into our stdin.
        printf("\033[0;32m Shift  : Get a number token, its value is %f\033[0m\n", yylval); 
        return NUMBER;
    }
    else if(c == '\n')
    {
        done = 1;
        printf("\033[0;32m Shift  : Get the end of the expression $\033[0m\n");
    }
    else
    {
        printf("\033[0;32m Shift  : Get the operator\t%c\033[0m\n", c);
    }
    return c;
}
