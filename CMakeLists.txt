cmake_minimum_required(VERSION 3.10)

set(CMAKE_C_COMPILER clang)

project(misacc C)

add_executable(misacc
        src/token.c
        src/ast.c
        src/type.c
        src/symtab.c
        src/lexer.c
        src/parser.c
        src/sema.c
        src/codegen.c
        src/main.c
)

target_include_directories(misacc PRIVATE include)

target_compile_definitions(misacc PRIVATE
        _CRT_SECURE_NO_WARNINGS
        _CRT_NONSTDC_NO_DEPRECATE
)

target_compile_options(misacc PRIVATE -Wall)

set_target_properties(misacc PROPERTIES SUFFIX ".exe")

add_custom_target(run_tests
        COMMAND cmd /c "for %f in (tests\\*.c) do $<TARGET_FILE:misacc> %f -o %~dpnf.asm"
        DEPENDS misacc
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
)