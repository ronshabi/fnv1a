# FNV-1a hash implementation in x86-64 assembly

Currently implements the 32 & 64 bit versions of the hash.

[About the FNV hash function](http://www.isthe.com/chongo/tech/comp/fnv/index.html)


## Test vectors
[Source: IETF draft-eastlake-fnv-19.txt](https://datatracker.ietf.org/doc/html/draft-eastlake-fnv-19#page-117)

run `./fnv1a` to test:

```
[PASSED] Test fnv1a32("") => 811c9dc5
[PASSED] Test fnv1a32("a") => e40c292c
[PASSED] Test fnv1a32("foobar") => bf9cf968
[PASSED] Test fnv1a64("") => cbf29ce484222325
[PASSED] Test fnv1a64("a") => af63dc4c8601ec8c
[PASSED] Test fnv1a64("foobar") => 85944171f73967e8
```

## Author
Ron Shabi
