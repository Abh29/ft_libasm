#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <omp.h>

// extern void hello(void);
extern int 			ft_strlen(char *str);
extern char* 		ft_strcpy(char *dest, char *src);
extern int			ft_strcmp(char *s1, char *s2);
extern ssize_t		ft_write(int fd, char *buff, size_t size);
extern ssize_t		ft_read(int fd, char *buff, size_t size);


// int main() {
// 	float f = 1.0;
// 	char msg[20] = {0};
// 	char dest[20] = {0};
// 	msg[18] = '\n';
// 	msg[19] = 0;
// 	ft_read(0, msg, 18);
// 	ft_strcpy(dest, msg);
// 	printf("%d %d\n", ft_strcmp(msg, dest), ft_strlen(msg));
// 	ft_write(1, dest, ft_strlen(dest));
// 	return 0;
// }


void print_bytes(int c) {
	int i = 31;

	do {
		printf("%c", (c & (1 << i--)) == 0 ? '0' : '1');
	} while (i >= 0);
	printf("\n");
}

typedef union {
	int i;
	float f;
} uif;

int main() {
	uif n;

	if (scanf("%f", &(n.f)) < 1)
		return 1;
	#pragma omp parallel 
	{
		int id = omp_get_thread_num();
		printf("%d: %f    ,     %d\n", id, n.f, n.i);
		print_bytes(n.i);
	}
	
}
