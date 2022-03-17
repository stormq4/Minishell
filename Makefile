# -*- Makefile -*-

## Executable for minishell
NAME := minishell


## Flags and Compilers
ifndef sanitize

CFLAGS := 				-Wall -fsanitize=address -Wextra -g

else

export CFLAGS := 		-Wall -Wextra -Werror -g

endif

export READLINE := 		-lreadline -I/Volumes/Storage/cache/sde-quai/Library/Logs/Homebrew/readline
export CC := 			gcc


## Headerfiles
INC :=				-I ./inc


## Libft
LIBFT := 			libft
LIBA := 			libft/libft.a


## Source files

# directory
DIR_SRC :=			src


# Main directory with files
DIR_MAIN :=			minishell
MAIN :=				main.c

SRC_MAIN :=			$(addprefix $(DIR_SRC)/$(DIR_MAIN)/, $(MAIN))


# Minishell directory with files
DIR_MINISHELL :=	minishell
MINISHELL := 		free_shell.c \
					initialize_structs.c

SRC_MINISHELL :=	$(addprefix $(DIR_SRC)/$(DIR_MINISHELL)/, $(MINISHELL))


# Lexer directory with files
DIR_LEXER :=		lexer
LEXER :=			lexer.c \
					lexer_lst.c \
					categorize_pipes.c \
					categorize_redirects.c \
					categorize_words.c

SRC_LEXER :=		$(addprefix $(DIR_SRC)/$(DIR_LEXER)/, $(LEXER))


# Utils directory with files
DIR_UTILS :=		utils
UTILS := 			ft_strdup_len.c \
					ft_strlen_c.c \
					find_min.c

SRC_UTILS :=		$(addprefix $(DIR_SRC)/$(DIR_UTILS)/, $(UTILS))


# All Source Files in variable
SRC :=				$(SRC_UTILS) $(SRC_LEXER) $(SRC_MINISHELL) $(SRC_MAIN)

export	SRC_TEST := $(SRC_UTILS) $(SRC_LEXER) $(SRC_MINISHELL)

## Object files from source files
OBJ_DIR :=			obj
OBJ_C :=			$(addprefix $(OBJ_DIR)/, $(SRC))
OBJ :=				$(OBJ_C:%.c=%.o)


## Colors
export GREEN := 			"\033[1;32m"
export CYAN := 			"\033[1;36m"
export RED := 				"\033[1;31m"
export PURPLE := 			"\033[1;35m"


## Commands
all : $(NAME)

run : all
	@./$(NAME)

drun : all
	@lldb $(NAME)

# echo :
#@echo $(OBJ)

sanitize : fclean
	@$(MAKE) sanitize=1
	@echo $(PURPLE)"Compiled with sanitize=address [OK]"

test : fclean
	$(MAKE) -C unit_test test

$(LIBA) :
	@$(MAKE) -C $(LIBFT)

$(NAME) : $(LIBA) $(OBJ)
	@echo $(CYAN)"Object files created for MINISHELL [OK]"
	@$(CC) $(CFLAGS) $(OBJ) $(INC) $(LIBA) $(READLINE) -o $(NAME)
	@echo $(GREEN)"MINISHELL compiled [OK]"

$(OBJ_DIR)/%.o : %.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(INC) -c $< -o $@

clean :
	@rm -rf obj
	@echo $(RED) "Deleting object files from MINISHELL [OK]"
	@$(MAKE) clean -C $(LIBFT)

fclean : clean
	@$(MAKE) fclean -C $(LIBFT)
	@rm -rf $(NAME)
	@echo $(RED) "Deleting MINISHELL Executable [OK]"

re : fclean all

.PHONY: all, clean, fclean, re
