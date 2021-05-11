source refute.sh

test.shouldFail.knownCommand() {
 refute ls
}

test.shouldFail.singleBrackets() {
  refute [ "Hello" = "Hello" ]
}

test.shouldPass.unknownCommand() {
  refute this-command-does-not-exis
}

test.shouldPass.singleBrackets() {
  refute [ "Hello" = "World" ]
}

test.shouldFail.configured.to.exit() {
  REFUTE_FAIL=exit
  if refute true
  then
    echo "This will never run"
  else
    echo "This code won't run because refute exited"
  fi
}

test.shouldPass.configured.to.return() {
  REFUTE_FAIL=return
  if refute true
  then
    echo "This will never run"
  else
    echo "This code will run because refute returned"
  fi
}