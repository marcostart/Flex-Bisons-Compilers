# Flex-Bisons-Compilers
Creation of lexical and syntactic analyzers

## How to use it ?

### Parsers_Integers_Langage

The image named `CFG.png`` describes the grammar recognized by the language.

- Install `Flex` an `Bison`;
- Type **make** in the terminal to produce the executable named **int_lang**
- Run **int_lang > file_name** to perform lexical and syntactic analysis of **file_name**
- The file named **code.txt** is an example of code recognized by this langage

### Parsers_Cool_Langage

This program identifies tokens in code written in **cool language**.

- Install `Flex`;
- Type **make** in the terminal to produce the executable named **find_token**
- Run **find_token < cool_file_name** to perform lexical analysis of **cool_file_name**
- The file named **code.cl** is an example of code recognized by this langage