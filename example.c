#include <stdint.h>
#include <stdio.h>

extern uint32_t fnv1a(const char*);

int main(int argc, const char* argv[])
{
    const char* s = "a";
    printf("fnv1a of [%s] = 0x%08x\n", s, fnv1a(s));

    return 0;
}