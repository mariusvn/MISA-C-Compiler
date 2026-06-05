CC      = clang
CFLAGS  = -Iinclude -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -Wall
SRCS    = src/token.c src/ast.c src/type.c src/symtab.c \
          src/lexer.c src/parser.c src/sema.c src/codegen.c src/main.c
TARGET  = misacc.exe

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $@

test: $(TARGET)
	for %f in (tests\*.c) do $(TARGET) %f -o %~dpnf.asm

clean:
	del /Q $(TARGET) 2>NUL || true

.PHONY: all test clean
