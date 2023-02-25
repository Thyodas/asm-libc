##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## Makefile
##

SRC = src/strlen.asm	\
	  src/strchr.asm	\
	  src/strrchr.asm	\
	  src/memset.asm	\
	  src/memcpy.asm	\
	  src/strcmp.asm	\
	  src/memmove.asm	\
	  src/strncmp.asm	\
	  src/strcasecmp.asm\
	  src/strstr.asm	\
	  src/strpbrk.asm	\
	  src/strcspn.asm	\
	  src/memfrob.asm	\
	  src/strfry.asm	\
	  src/ffs.asm		\

OBJ = $(SRC:.asm=.o)

NAME = libasm.so

INCLUDE = ../include

%.o: %.asm
	@nasm -f elf64 -w+all -g -o $@ $<
	@echo "Nasm $<"

all:
	@echo "\033[1;37m\033[1;46m               minilibc\
	                  \033[0m"
	@$(MAKE) -s $(NAME)

$(NAME): $(OBJ)
		 ld -fPIC -g -shared -o $(NAME) $(OBJ)

clean:
	   rm -f $(OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: fclean all debug re clean $(NAME)
