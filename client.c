#include <dlfcn.h>

int foo(int);

int main() {
  dlopen("fakelib.bundle", RTLD_NOW);
  printf("Foo(10) is %d\n", foo(10)); 
}
