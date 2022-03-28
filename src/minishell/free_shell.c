/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   free_shell.c                                       :+:    :+:            */
/*                                                     +:+                    */
/*   By: stormdequay <stormdequay@student.codam.      +#+                     */
/*                                                   +#+                      */
/*   Created: 2022/03/08 14:35:11 by stormdequay   #+#    #+#                 */
/*   Updated: 2022/03/28 14:00:07 by sde-quai      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

/**
 * @brief frees the shell attributes such as lexer .... add more!!
 * 
 * @param shell struct
 */
void	free_shell(t_minishell *shell)
{
	free((void *)shell->cmd_line);
	ft_lstclear(&shell->tokens, token_delete);
	ft_lstclear(&shell->parser, parser_delete);
}
