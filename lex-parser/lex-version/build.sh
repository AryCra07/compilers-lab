#!/bin/bash

lex lex_parser.l

gcc lex.yy.c -o lex_parser -ll