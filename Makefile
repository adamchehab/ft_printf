# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: abronn <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/20 20:00:28 by abronn            #+#    #+#              #
#    Updated: 2021/02/21 01:40:39 by abronn           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

OBJ_DIR 	= obj
SRC_DIR 	= src
INCLUDESDIR = includes

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
NAME		= libftprintf.a

# optimise theese
SRCS		=	$(SRC_DIR)/ft_printf.c \
				$(SRC_DIR)/handlers_1.c \
				$(SRC_DIR)/handlers_2.c \
				$(SRC_DIR)/parser.c \
				$(SRC_DIR)/utils_lib1.c \
				$(SRC_DIR)/utils_lib2.c \
				$(SRC_DIR)/utils_lib3.c \
				$(SRC_DIR)/utils_lib4.c \
				$(SRC_DIR)/utils_p.c

OBJS		=	$(OBJ_DIR)/ft_printf.o  \
				$(OBJ_DIR)/handlers_1.o \
				$(OBJ_DIR)/handlers_2.o \
				$(OBJ_DIR)/parser.o     \
				$(OBJ_DIR)/utils_lib1.o \
				$(OBJ_DIR)/utils_lib2.o \
				$(OBJ_DIR)/utils_lib3.o \
				$(OBJ_DIR)/utils_lib4.o \
				$(OBJ_DIR)/utils_p.o

GREEN		= \033[0;32m

RED			= \033[0;31m

RESET		= \033[0m

$(OBJ_DIR)/%.o	:	$(SRC_DIR)/%.c
				@mkdir -p $(OBJ_DIR)
				@$(CC) $(CFLAGS) -I $(INCLUDESDIR) -c $< -o $@

$(NAME)			:	$(OBJS)
				@ar rcs $(NAME) $(OBJS)
				@echo "ft_printf: $(GREEN) $(NAME) was created.$(RESET)"
		
all				:	$(NAME)


clean			:
				@rm -frd $(OBJ_DIR)
				@echo "ft_printf: $(RED) /obj folder was deleted.$(RESET)"

fclean			:	clean
				@rm -rf $(NAME)
				@echo "ft_printf: $(RED) $(NAME) was deleted.$(RESET)"

re				:	fclean all