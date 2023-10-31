# yacc syntax.y
# cc y.tab.c -lfl -o a
bison -d syntax.y
gcc -o parser syntax.tab.c -ly