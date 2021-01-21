# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: iboeters <iboeters@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/12/15 13:21:22 by iboeters      #+#    #+#                  #
#    Updated: 2021/01/19 16:51:36 by iboeters      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
SRCS =	ft_strlen.s\
		ft_strcpy.s\
		ft_strcmp.s\
		ft_write.s\
		ft_read.s\
		ft_strdup.s
OBJS = ${SRCS:%.s=%.o}
FLAGS= -f macho64

PINK = \033[38;2;255;204;213m
GREY = \033[38;2;100;100;100m
BG_GREY = \033[48;2;38;38;38m
RESET = \033[0m

all: $(NAME)

%.o:%.s
	@echo "$(GREY)$(BG_GREY)Compiling $<$(RESET)"
	@nasm $(FLAGS) $^ -o $@

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREY)---------------------------------------------"
	@echo "$(PINK)Library created: \"$(NAME)\"$(RESET)"

clean:
	@echo "$(BG_GREY)$(GREY)Deleting $(OBJS)$(RESET)"
	@rm -f $(OBJS)

fclean: clean
	@echo "$(BG_GREY)$(GREY)Deleting $(NAME)$(RESET)"
	@rm -f $(NAME)

re: fclean all

test: re
	@gcc -Wall -Werror -Wextra main.c -L. -lasm -o test
	@echo "$(GREY)---------------------------------------------"
	@echo "$(PINK)Run testfile: \"./test\"$(RESET)"

.PHONY: all clean fclean re test
