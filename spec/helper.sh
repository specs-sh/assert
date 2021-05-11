runTest() {
  [ -z "$TEST_FILE" ] && { TEST_FILE="$1"; shift; }
  (( $# != 1 )) && { echo "Please runTest providing a [test file] and [test name]." >&2; return 1; }
  TEST_OUTPUT="$( ./vendor/microspec "$TEST_FILE" --filter "$1" )" && TEST_EXITCODE=$? || TEST_EXITCODE=$?
  TEST_OUTPUT="$( removeColorCodes "$TEST_OUTPUT" )"
  (( TEST_EXITCODE == 0 )) && TEST_PASSED=true || TEST_PASSED=false
  return 0
}

assertTestOutput() {
  if ! [[ "$TEST_OUTPUT" = *"$1"* ]]
  then
    echo "Expected output '$1' not found" >&2
    echo "Output: '$TEST_OUTPUT'" >&2
    return 1
  fi
}

removeColorCodes() {
  echo "$1" | sed -E "s/\x1B\[(([0-9]{1,2})?(;)?([0-9]{1,2})?)?[m,K,H,f,J]//g"
}