source assert

test.shouldFail.unknownCommand() {
  assert this-command-does-not-exist
}

test.shouldFail.singleBrackets() {
  assert [ "Hello" = "World" ]
}

test.shouldPass.knownCommand() {
  assert ls
}

test.shouldPass.singleBrackets() {
  assert [ "Hello" = "Hello" ]
}

test.shouldFail.configured.to.exit() {
  ASSERT_FAIL=exit
  if assert false
  then
    echo "This will never run"
  else
    echo "This code won't run because assert exited"
  fi
}

test.shouldPass.configured.to.return() {
  ASSERT_FAIL=return
  if assert false
  then
    echo "This will never run"
  else
    echo "This code will run because assert returned"
  fi
}