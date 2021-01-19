/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: iboeters <iboeters@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/01/15 13:37:27 by iboeters      #+#    #+#                 */
/*   Updated: 2021/01/19 12:01:14 by iboeters      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

/*
** compile: gcc -Wall -Werror -Wextra main.c libasm.a
** [V] ft_strlen
** [V] ft_strcpy
** [V] ft_strncmp
** [V] ft_write
** [V] ft_read
** [V] ft_strdup
*/

#include "libasm.h"

int		main(void)
{
	{
		char dst[10];
		char dst2[10];
		char *s = "string";
		char *s2 = "string2";
		// char *s3 = NULL;
		printf("test ft_strlen, ft_strcpy and ft_strcmp\n");
		printf("real |%li|\n", strlen(s));
		printf("own  |%li|\n", ft_strlen(s));
		printf("real |%li|\n", strlen(s2));
		printf("own  |%li|\n", ft_strlen(s2));
		// printf("real |%li|\n", strlen(s3));
		// printf("own  |%li|\n", ft_strlen(s3));
		printf("real |%s|\n", strcpy(dst, s2));
		printf("own  |%s|\n", ft_strcpy(dst2, s2));
		printf("real |%d|\n", strcmp(s, s2));
		printf("own  |%d|\n", ft_strcmp(s, s2));
	}
	{
		int fd = 0;
		char *s4 = "hello\n";
		int len = 6;

		printf("\ntest ft_write\n");
		fd = open("file_to_open.s", O_WRONLY);
		printf("real |%ld| |%d|\n", write(fd, s4, len), errno);
		printf("own  |%ld| |%d|\n", ft_write(fd, s4, len), errno);
	}
	{
		printf("\ntest ft_read\n");
		int fd = open("file.txt", O_RDONLY);
		int fd2 = open("file.txt", O_RDONLY);
		char buf[20];
		char buf2[20];
		int len = 19;
		printf("real |%ld| |%s| |%s|\n", read(fd, buf, len), strerror(errno), buf);
		printf("own  |%ld| |%s| |%s|\n", ft_read(fd2, buf2, len), strerror(errno), buf2);
	}
	{
		char *s = "joehoeoeeeeeeeeeeeeeeeeeeeeee";

		printf("\ntest ft_strdup\n");
		char *s2 = strdup(s);
		char *s3 = ft_strdup(s);
		printf("real |%s| |%s|\n", s2, strerror(errno));
		printf("own  |%s| |%s|\n", s3, strerror(errno));
		if (s2)
			free(s2);
		if (s3)
			free(s3);
	}
	return (0);
}
