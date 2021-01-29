# libasm
The aim of the project is to re-code part of the libc library functions in assembly.

## Usage
``make`` to create the library "libasm.a"

library contains the following functions:
```
size_t    ft_strlen(char const *s1);
char      *ft_strcpy(char *dest, const char *src);
int       ft_strcmp(const char *s1, const char *s2);
ssize_t   ft_write(int fd, const void *buf, size_t count);
ssize_t   ft_read(int fd, void *buf, size_t count);
char      *ft_strdup(const char *s);
```

``make test`` to compile with a testfile, main.c
