source "${BASH_SOURCE[0]%/*}/helper.sh"

source refute.sh

TEST_FILE=examples/usingRefute.spec.sh

spec.test.shouldFail.knownCommand() {
  runTest test.shouldFail.knownCommand
  assertTestOutput "Expected to fail, but succeeded: $ ls"
  assertTestOutput "[FAIL] test.shouldFail.knownCommand"
}

spec.test.shouldFail.singleBrackets() {
  runTest test.shouldFail.singleBrackets
  assertTestOutput "Expected to fail, but succeeded: $ [ Hello = Hello ]"
  assertTestOutput "[FAIL] test.shouldFail.singleBrackets"
}

spec.test.shouldPass.unknownCommand() {
  runTest test.shouldPass.unknownCommand
  assertTestOutput "[PASS] test.shouldPass.unknownCommand"
}

spec.test.shouldPass.singleBrackets() {
  runTest test.shouldPass.singleBrackets
  assertTestOutput "[PASS] test.shouldPass.singleBrackets"
}

spec.test.shouldFail.configured.to.exit() {
  runTest test.shouldFail.configured.to.exit
  assertTestOutput "[FAIL] test.shouldFail.configured.to.exit"
  assertTestOutput "Expected to fail, but succeeded: $ true"
}

spec.test.shouldPass.configured.to.return() {
  runTest test.shouldPass.configured.to.return
  assertTestOutput "[PASS] test.shouldPass.configured.to.return"
}