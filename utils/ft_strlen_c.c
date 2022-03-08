/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_strlen_c.c                                      :+:    :+:            */
/*                                                     +:+                    */
/*   By: sde-quai <sde-quai@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2022/03/07 16:14:53 by sde-quai      #+#    #+#                 */
/*   Updated: 2022/03/08 09:29:04 by stormdequay   ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "utils.h"

size_t ft_strlen_c(const char *str, int c)
{
	size_t i;

	i = 0;
	while (str[i] && str[i] != c)
		i++;
	return (i);
}