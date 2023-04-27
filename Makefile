SRC =	ft_strlen.asm ft_strcpy.asm ft_strcmp.asm \
		ft_write.asm ft_read.asm ft_strdup.asm 
CSRC = test.c
NAME = out
OBJ := ${SRC:%.asm=%.o}


default: test;

%.o : %.asm
	nasm -f elf64 $<

$(NAME): $(OBJ) $(SRC)
	ld -m elf_x86_64 $(OBJ) -o $(NAME)

all: $(NAME)
	bash $(NAME)

compile:	$(OBJ)

test: $(OBJ) $(CSRC)
	gcc -g $(CSRC) $(OBJ) -o $@

fclean:
	rm -f $(OBJ) $(NAME) test

.PHONY: compile