.PHONY : all clean build runonly run

ifeq ($(OS),Windows_NT)
	EXE_EXT := .exe
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		EXE_EXT :=
	else
		EXE_EXT :=
	endif
endif

project_name = asm-chat

all: | build

clean:
	@rm -rf build

build:
	@mkdir -p build;
	@cd build && cmake .. && make -s -j4;

runonly:
	@cd build && ./$(project_name);

run: | all runonly
