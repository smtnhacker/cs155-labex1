# EASY-C Lexical Analyzer

Ron Mikhael Surara
SN 2020-12456

## Introduction

This project is done in partial fulfillment of a requirement in our Compilers class where we are tasked with writing a compiler for the EASY-C language. This repository contains the lexical analyzer.

_Note: Since this project is a work in progress, the tokens used may not be the final set of tokens which will be used in the finished project._

## How to run

1. Ideally, you need to have a Linux machine and make sure you have `flex` installed.

2. Run the following command:

```bash
flex le1-202012456.flex
gcc lex.yy.c -o le1-lexer
./le1-lexer <input-file>
```

3. This will generate an output similar to the following:

```
L1: <RESERVED_WORD, "PROCEDURE">
L1: <IDENT, "areaCircle">
L1: <SEMICOLON, ";">
L2: <RESERVED_WORD, "VAR">
L2: <IDENT, "area">
L2: <COLON, ":">
L2: <RESERVED_WORD, "REAL">
L2: <SEMICOLON, ";">
L3: <RESERVED_WORD, "VAR">
L3: <IDENT, "i">
L3: <COLON, ":">
L3: <RESERVED_WORD, "INTEGER">
L3: <SEMICOLON, ";">
L5: <RESERVED_WORD, "BEGIN">
L7: <RESERVED_WORD, "WRITELN">
L7: <PARENTHESIS, "(">
L7: <STRING, ""Computing area of a circle with r from 1 to 10"">
```

## Tokens

As of the moment, here are the set of token types:

```
1. RESERVED_WORD
- Refers to either of the following words:
    - PROCEDURE
    - VAR
    - INTEGER
    - REAL
    - BOOLEAN
    - STRING
    - WRITELN
    - NOT
    - OR
    - DIV
    - MOD
    - AND
    - IF
    - THEN
    - ELSE
    - WHILE
    - DO
    - FOR
    - TO
    - DOWNTO
    - BEGIN
    - END
2. SEMICOLON
- Refers to ;
3. COLON
- Refers to :
4. PLUS
- Refers to +
5. MINUS
- Refers to -
6. OP
- Refers to the following symbols:
    - :=
    - *
    - /
    - =
    - <>
    - <
    - <=
    - >
    - >=
    - ,
7. PARENTHESIS
- Refers to either ( or )
8. IDENT
- Refers to any combination letters and digits that starts with a letter (e.g., var1, areaCircle)
9. STRING
- Refers to any sequence of non-newline and non-quote characters surrounded by quote marks (e.g., "hello there!", "general kenobi?!")
10. US_DIGIT_SEQ
- Refers to an unsigned sequence of digits (e.g., 202012456)
11. DIGIT_SEQ
- Refers to a signed sequence of digits (e.g., +10, -11)
12. REAL
- Refers to any floating number which is characterized by having a period (e.g., 3.14, 1., -3.9)
```