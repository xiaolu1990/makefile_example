# https://stackoverflow.com/questions/30573481/how-to-write-a-makefile-with-separate-source-and-header-directories

# https://www.linuxtopia.org/online_books/an_introduction_to_gcc/gccintro_17.html

# 1. List source and build output directiories
SRC_DIR = ./src
INC_DIR = ./inc
OBJ_DIR = ./obj
BIN_DIR = .

# 2. Name the final target (aka. executable file)
EXE = $(BIN_DIR)/main

# 3. List source files
SRC = $(wildcard $(SRC_DIR)/*.c)

# 4. List header files
DEPS = $(wildcard $(INC_DIR)/*.h)

# 5. From the source files, list the object files
OBJ = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC))

# 6. Build flags
CC = gcc
CFLAGS = -g -Wall

.PHONY: all clean

all: $(EXE)

$(EXE): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) -lm

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(DEPS)
	$(CC) $(CFLAGS) -I $(INC_DIR)/ -c $< -o $@

# Debug cmd, prints out the variable defined in makefile
print-%:
	@echo $* = $($*)

clean:
	rm -f $(OBJ_DIR)/*.o $(EXE)
