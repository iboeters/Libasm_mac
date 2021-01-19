/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: iboeters <iboeters@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2021/01/15 13:37:27 by iboeters      #+#    #+#                 */
/*   Updated: 2021/01/19 16:13:41 by iboeters      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

/*
** compile: gcc -Wall -Werror -Wextra main.c libasm.a
** [V] ft_strlen
** [V] ft_strcpy
** [V] ft_strncmp
** [V] ft_write
** [V] ft_read
** [V] ft_strdup
*/

int		main(void)
{
	{
		printf("test: ft_strlen\n");

		char *s = "";
		char *s2 = "string2";
		printf("own  |%li|\n", ft_strlen(s));
		printf("real |%li|\n", strlen(s));
		printf("own  |%li|\n", ft_strlen(s2));
		printf("real |%li|\n", strlen(s2));
		// char *s3 = NULL;
		// printf("own  |%li|\n", ft_strlen(s3));
		// printf("real |%li|\n", strlen(s3));
	}
	{
		printf("\ntest: ft_strcpy\n");

		char dst[10];
		char dst2[10];
		char *src = "string";
		printf("own  |%s|\n", ft_strcpy(dst, src));
		printf("real |%s|\n", strcpy(dst2, src));
		char dst3[10];
		char dst4[10];
		char *src2 = "";
		printf("own  |%s|\n", ft_strcpy(dst3, src2));
		printf("real |%s|\n", strcpy(dst4, src2));
	}
	{
		printf("\ntest: ft_strcmp\n");

		char *s = "string";
		char *s2 = "string2";
		printf("own  |%d|\n", ft_strcmp(s, s2));
		printf("real |%d|\n", strcmp(s, s2));
		char *s3 = "";
		char *s4 = "string2";
		printf("own  |%d|\n", ft_strcmp(s3, s4));
		printf("real |%d|\n", strcmp(s3, s4));
		char *s5 = "string1";
		char *s6 = "string2";
		printf("own  |%d|\n", ft_strcmp(s5, s6));
		printf("real |%d|\n", strcmp(s5, s6));
		char *s7 = "string";
		char *s8 = "string";
		printf("own  |%d|\n", ft_strcmp(s7, s8));
		printf("real |%d|\n", strcmp(s7, s8));
	}
	{
		printf("\ntest ft_write\n");

		int fd = open("file.txt", O_WRONLY);
		char *s = "hello\n";
		int len = 6;
		printf("own  |%ld|\n", ft_write(fd, s, len));
		printf("real |%ld|\n", write(fd, s, len));
		fd = -1;
		printf("own  |%ld| |%d| |%s|\n", ft_write(fd, s, len), errno, strerror(errno));
		printf("real |%ld| |%d| |%s|\n", write(fd, s, len), errno, strerror(errno));
		fd = open("file.txt", O_RDONLY);
		printf("own  |%ld| |%d| |%s|\n", ft_write(fd, s, len), errno, strerror(errno));
		printf("real |%ld| |%d| |%s|\n", write(fd, s, len), errno, strerror(errno));
		fd = open("file.txt", O_WRONLY);
		s = NULL;
		printf("own  |%ld| |%d| |%s|\n", ft_write(fd, s, len), errno, strerror(errno));
		printf("real |%ld| |%d| |%s|\n", write(fd, s, len), errno, strerror(errno));
	}
	{
		printf("\ntest ft_read\n");

		int fd = open("file.txt", O_RDONLY);
		int fd2 = open("file2.txt", O_RDONLY);
		char buf[6];
		char buf2[6];
		buf[5] = '\0';
		buf2[5] = '\0';
		int len = 5;
		printf("own  |%ld| |%s|\n", ft_read(fd, buf, len), buf);
		printf("real |%ld| |%s|\n", read(fd2, buf2, len), buf2);
		int fd3 = open("file.txt", O_RDONLY);
		int fd4 = open("file2.txt", O_RDONLY);
		char buf3[6];
		char buf4[6];
		len = 0;
		printf("own  |%ld| |%s|\n", ft_read(fd3, buf3, len), buf3);
		printf("real |%ld| |%s|\n", read(fd4, buf4, len), buf4);
		int fd5 = open("file.txt", O_RDONLY);
		int fd6 = open("file2.txt", O_RDONLY);
		char buf5[6];
		char buf6[6];
		len = -1;
		printf("own  |%ld| |%s| |%s|\n", ft_read(fd5, buf5, len), strerror(errno), buf5);
		printf("real |%ld| |%s| |%s|\n", read(fd6, buf6, len), strerror(errno), buf6);
		int fd7 = open("file.txt", O_WRONLY);
		int fd8 = open("file2.txt", O_WRONLY);
		char buf7[6];
		char buf8[6];
		len = 5;
		printf("own  |%ld| |%s| |%s|\n", ft_read(fd7, buf7, len), strerror(errno), buf7);
		printf("real |%ld| |%s| |%s|\n", read(fd8, buf8, len), strerror(errno), buf8);
		fd8 = -1;
		printf("own  |%ld| |%s| |%s|\n", ft_read(fd8, buf7, len), strerror(errno), buf7);
		printf("real |%ld| |%s| |%s|\n", read(fd8, buf8, len), strerror(errno), buf8);
	}
	{
		printf("\ntest ft_strdup\n");

		char *s = "joehoeoeeeeeeeeeeeeeeeeeeeeee";
		char *s2 = ft_strdup(s);
		char *s3 = strdup(s);
		printf("own  |%s|\n", s2);
		printf("real |%s|\n", s3);
		char *s4 = "";
		char *s5 = ft_strdup(s4);
		char *s6 = strdup(s4);
		printf("own  |%s|\n", s5);
		printf("real |%s|\n", s6);
		if (s2)
			free(s2);
		if (s3)
			free(s3);
		if (s5)
			free(s5);
		if (s6)
			free(s6);
	}
	return (0);
}
