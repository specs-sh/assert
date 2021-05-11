[![Mac (BASH 3.2)](https://github.com/specs-sh/assert/workflows/Mac%20(BASH%203.2)/badge.svg)](https://github.com/specs-sh/assert/actions?query=workflow%3A%22Mac+%28BASH+3.2%29%22) [![BASH 4.0](https://github.com/specs-sh/assert/workflows/BASH%204.0/badge.svg)](https://github.com/specs-sh/assert/actions?query=workflow%3A%22BASH+4.0%22) [![BASH 4.4](https://github.com/specs-sh/assert/workflows/BASH%204.4/badge.svg)](https://github.com/specs-sh/assert/actions?query=workflow%3A%22BASH+4.4%22) [![BASH 5.0](https://github.com/specs-sh/assert/workflows/BASH%205.0/badge.svg)](https://github.com/specs-sh/assert/actions?query=workflow%3A%22BASH+5.0%22)
---

# ☑️ `assert` & `refute`

Download the [latest version](https://github.com/specs-sh/assert/archive/v1.0.0.tar.gz) or install via:

```sh
curl https://assert.specs.sh/install.sh | bash
```

```sh
source "assert"
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
