#include <stdio.h>

static char *argv[] = {"mirage", NULL};
extern void caml_main(char **argv);

void signal() {}

void app_main()
{
    printf("Jumping into OCaml code..\n");
    caml_main(argv);
    printf("OCaml is done..\n");
}
