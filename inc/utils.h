/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   utils.h                                            :+:    :+:            */
/*                                                     +:+                    */
/*   By: sde-quai <sde-quai@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2022/03/07 13:36:11 by sde-quai      #+#    #+#                 */
/*   Updated: 2022/03/09 10:04:11 by sde-quai      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef UTILS_H
# define UTILS_H

# include "libft.h"
# include <stdio.h>
# include <readline/readline.h>
# include <readline/history.h>
# include <stdlib.h>
# include <unistd.h>

typedef enum e_bool {
	false,
	true
}			t_bool;

typedef enum e_character {
	s_quote = 39,
	d_quote = 34,
	space = 32,
	c_pipe = 124,
	red_in = 60,
	red_out = 62
}			t_character;

size_t	ft_strlen_c(const char *str, int c);
char	*ft_strdup_len(const char *str, size_t len);

#endif
