source "${BASH_SOURCE[0]%/*}/helper.sh"

source assert.sh

TEST_FILE=examples/usingAssert.spec.sh

spec.test.shouldFail.unknownCommand() {
  runTest test.shouldFail.unknownCommand
  assertTestOutput "Expected to succeed, but failed: $ this-command-does-not-exist"
  assertTestOutput "[FAIL] test.shouldFail.unknownCommand"
}

spec.test.shouldFail.singleBrackets() {
  runTest test.shouldFail.singleBrackets
  assertTestOutput "Expected to succeed, but failed: $ [ Hello = World ]"
  assertTestOutput "[FAIL] test.shouldFail.singleBrackets"
}

spec.test.shouldPass.knownCommand() {
  runTest test.shouldPass.knownCommand
  assertTestOutput "[PASS] test.shouldPass.knownCommand"
}

spec.test.shouldPass.singleBrackets() {
  runTest test.shouldPass.singleBrackets
  assertTestOutput "[PASS] test.shouldPass.singleBrackets"
}

spec.test.shouldFail.configured.to.exit() {
  runTest test.shouldFail.configured.to.exit
  assertTestOutput "[FAIL] test.shouldFail.configured.to.exit"
  assertTestOutput "Expected to succeed, but failed: $ false"
}

spec.test.shouldPass.configured.to.return() {
  runTest test.shouldPass.configured.to.return
  assertTestOutput "[PASS] test.shouldPass.configured.to.return"
}