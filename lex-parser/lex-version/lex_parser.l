%option noyywrap
%{
    #include <stdio.h>
    #include <string.h>
    // int yywrap();
    int word_count = 0;
    int char_count = 0;
    int line = 1;
    int col = 0;
    void add_line(int cnt);
    void add_col(int cnt);
    void clear_col();
    void add_char(int cnt);
    void add_word(int cnt);
    int count[15] = {0};
    FILE *input_file;
    FILE *output_file;
%}

line_comment           (\/\/([^\n]*(\\+\n)*)*\n)
block_comment          (\/\*(.*\n*)*\*\/)
char                   ('([^\\'\n]|\\.)*')
string                 (\"([^\\\"\n]|\\.)*\")
letter                 ([a-zA-Z_])
digit                  ([0-9])
reserved_word          "auto"|"double"|"int"|"struct"|"break"|"else"|"long"|"switch"|"case"|"enum"|"register"|"typedef"|"char"|"extern"|"return"|"union"|"const"|"float"|"short"|"unsigned"|"continue"|"for"|"signed"|"void"|"default"|"goto"|"sizeof"|"volatile"|"do"|"while"|"static"|"if"|"inline"|"restrict"|"_Alignas"|"_alignof"|"_Atomic"|"_Bool"|"_Complex"|"_Generic"|"_Imaginary"|"_Noreturn"|"_Static_assert"|"_Thread_local"
identifier             ({letter}({letter}|{digit})*)
bin_number             (0[bB][01]+)
oct_number             (0[0-7]+)
hex_number             (0[xX][0-9a-fA-F]+)
dec_number             ({digit}+)
float       {digit}+\.{digit}+([eE][+-]?{digit}+)?|{digit}+[eE][+-]?{digit}+|{digit}+\.{digit}+
operator               ">"|">>"|">="|">>="|">"|">>"|">="|">>="|"<"|"<<"|"<="|"<<="|"<"|"<<"|"<="|"<<="|"!"|"!="|"="|"=="|"/"|"/="|"*"|"*="|"%"|"%="|"^"|"^="|"|"|"||"|"|="|"?"|"&"|"&&"|"&="|""|"+"|"+="|"++"|""|"-"|"-="|"--"
delimiter              ";"|","|":"|"."|"#"|"["|"]"|"("|")"|"{"|"}"|"<"|">"
ill_string	           (\"([^"\n]*(\\\")*)*)
ill_num		           ({digit}+(\.{digit}+)?([eE][+-]?[^0-9\n]))|({digit}+\.[^0-9\n])
ill_identifier         ([0-9@]({letter}|{digit})*)

%%

{line_comment} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Line comment\t");
    printf("[Value]: %s", yytext);
    add_char(yyleng);
    add_line(1);
    clear_col();
    count[0]++;
}
{block_comment} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Block comment\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    for (int i = 0; i < strlen(yytext); i++) {
        if (yytext[i] == '\n') {
            add_line(1);
            clear_col();
        } else {
            add_col(1);
        }
    }
    count[1]++;
}
{char} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Character\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[2]++;
}
{string} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: String\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[3]++;
}
{reserved_word} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Reserved word\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[4]++;
    add_word(1);
}
{identifier} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Identifier\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[5]++;
    add_word(1);
}
{bin_number} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Binary number\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[6]++;
}
{oct_number} {
    printf("[Location]: %d:%d\t", line, col);
    printf("[Type]: Octal number\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[7]++;
}
{hex_number} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Hexadecimal number\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[8]++;
}
{dec_number} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Decimal number\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[9]++;
}
{float} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Float\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[10]++;
}
{operator} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Operator\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[11]++;
}
{delimiter} {
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: Delimiter\t");
    printf("[Value]: %s\n", yytext);
    add_char(yyleng);
    add_col(yyleng);
    count[12]++;
}

{ill_num} {
	printf("\033[31m[Error] wrong number\n");
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: wrong number\t");
    printf("[Value]: %s\033[0m\n", yytext);
	add_char(yyleng);
    add_col(yyleng);
}
	
{ill_string} {
	printf("\033[31m[Error] wrong string\n");
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: wrong string\t");
    printf("[Value]: %s\033[0m\n", yytext);
	add_char(yyleng);
    add_col(yyleng);
    count[3]++;
}

{ill_identifier} {
    printf("\033[31m[Error] wrong identifier\n");
    printf("[Location]: %d:%d \t", line, col);
    printf("[Type]: wrong identifier\t");
    printf("[Value]: %s\033[0m\n", yytext);
	add_char(yyleng);
    add_col(yyleng);
}

.       {
    add_char(1);
    add_col(1);
}
\n      {
    add_char(1);
    add_line(1);
    clear_col();
}

%%

int main(int argc, char **argv)
{
	printf("-------------------------------------------------WELCOME-------------------------------------------------\n");
	printf("\t@Version: 0.0.1\n");
	printf("\t@Encoding: UTF-8\n");
	printf("\t@Copyright: BUPT\n");
	printf("\t@Teacher: Liu Chen\n");
	printf("\t@Author: Shen Yuanhao\n");
	printf("\t@Description: A lexical parser in lex language.\n");
	printf("\t@Usage: ./LexParser [in.txt](optional)\n");
	printf("\t@Hints: Input your code and check the result in terminal.\n");
	printf("---------------------------------------------------------------------------------------------------------\n\n");
    
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))){
            perror(argv[1]);
            return 1;
        }
        printf("\033[0;32m[Info] Read data from file: %s\033[0m\n\n", argv[1]);
    } else {
        printf("\033[0;32m[Info] Read data from stdin.\033[0m\n\n");
    }

    yylex();

    puts("\n==========================================");
    puts("Count:");
    printf("Char: %d\n",char_count);
    printf("Line: %d\n",line);
    printf("Word: %d\n",word_count);
    puts("\n=====Tokens count=====");
    printf("Line comment:       %d\n",count[0]);
    printf("Block comment:      %d\n",count[1]);
    printf("Character:          %d\n",count[2]);
    printf("String:             %d\n",count[3]);
    printf("Reserved word:      %d\n",count[4]);
    printf("Identifier:         %d\n",count[5]);
    printf("Binary number:      %d\n",count[6]);
    printf("Octal number:       %d\n",count[7]);
    printf("Hexadecimal number: %d\n",count[8]);
    printf("Decimal number:     %d\n",count[9]);
    printf("All number:         %d\n",count[6]+count[7]+count[8]+count[9]);
    printf("Float:              %d\n",count[10]);
    printf("Operator:           %d\n",count[11]);
    printf("Delimiter:          %d\n",count[12]);
    puts("==========================================");
    return 0;
}

void add_line(int cnt)
{
    line += cnt;
}
void add_col(int cnt)
{
    col += cnt;
}
void clear_col()
{
    col = 0;
}
void add_char(int cnt) 
{
    char_count += cnt;
}
void add_word(int cnt)
{
    word_count += cnt;
}
// int yywrap()
// {
//     return 1;
// }