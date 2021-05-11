#  `assert` & `refute`

Download the [latest version](https://github.com/specs-sh/assert.sh/archive/v1.0.0.tar.gz) or install via:

```sh
curl https://assert.specs.sh/install.sh | bash
```

```sh
source "assert.sh"
source "refute.sh"
```

---

`assert` and `refute` are tiny building blocks for shell testing.


```sh
assert [ -f somefile ]
# Expected to succeed, but failed: $ [ -f somefile ]

refute [ -f i-exist ]
# Expected to fail, but succeeded: $ [ -f i-exist ]
```

---

### Return or Exit

The default behavior of a failing `assert` is to `exit`.

```sh
assert [ -f somefile ] # <--- this will exit 1 on failure
```

The default behavior of a failing `refute` is to `exit`.  

```sh
refute [ -f i-exist ] # <--- this will exit 1 on failure
```

#### Why Exit?

If you want to `return 1` for a failing assertion, BASH has you covered:

```sh
testFileExists() {
  [ -f "$filename" ] # <--- this will return 0 or 1
}
```

Or:

```sh
testFileExists() {
  test -f "$filename" # <--- this will return 0 or 1
}
```

Or simply run any command:

```sh
testCommand() {
  ls some/dir # <--- this will return 1 if dir doesn't exist
}
```

`assert` and `refute` exist to provide an alternative which will `exit`.

This ensures no other commands in your test will run after an assertion failure.

#### Return

To configure assert and/or refute to `return` on failure instead:

```sh
ASSERT_FAIL=return
REFUTE_FAIL=return
```
