#include <stdint.h>
#include <stdio.h>

extern uint32_t fnv1a32(const char*);
extern uint64_t fnv1a64(const char*);

void test_fnv1a32(const char* s, uint32_t desirable_result)
{
    uint32_t result = fnv1a32(s);
    if (result == desirable_result) {
        printf("[PASSED] Test fnv1a32(\"%s\") => %08x\n", s, result);
    } else {
        printf("[FAILED] Test fnv1a32(\"%s\") => %08x (should've been %08x)\n", s, result, desirable_result);
    }
}

void test_fnv1a64(const char* s, uint64_t desirable_result)
{
    uint64_t result = fnv1a64(s);
    if (result == desirable_result) {
        printf("[PASSED] Test fnv1a64(\"%s\") => %016lx\n", s, result);
    } else {
        printf("[FAILED] Test fnv1a64(\"%s\") => %016lx (should've been %08lx)\n", s, result, desirable_result);
    }
}

int main(int argc, const char* argv[])
{
    test_fnv1a32("", 0x811c9dc5);
    test_fnv1a32("a", 0xe40c292c);
    test_fnv1a32("foobar", 0xbf9cf968);

    test_fnv1a64("", 0xcbf29ce484222325);
    test_fnv1a64("a", 0xaf63dc4c8601ec8c);
    test_fnv1a64("foobar", 0x85944171f73967e8);


    return 0;
}