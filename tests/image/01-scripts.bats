@test "script 'zkServer.sh' should be present" {
  run which zkServer.sh
  [ $status -eq 0 ]
}