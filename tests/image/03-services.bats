@test "service 'consul-template' should be installed" {
  run test -f /etc/services.d/consul-template/run
  [ $status -eq 0 ]
}

@test "Check the zookeper 'data' dir has proper permissions" {

  # Check the owner match the variable ZOO_USER
  owner=$(stat -c %U  "${ZOO_DATA_DIR}")
  [ "${owner}" == "${ZOO_USER}" ]

  # Check the group match the variable ZOO_USER
  group=$(stat -c %U  "${ZOO_DATA_DIR}")
  [ "$group" == "${ZOO_USER}" ]

  # Check the directory is writable
  status=$(test -w "${ZOO_DATA_DIR}"; echo $?)
  [ "$status" == 0 ]

}

@test "Check the zookeper 'datalog' dir has proper permissions" {

  # Check the owner match the variable ZOO_USER
  owner=$(stat -c %U  "${ZOO_DATA_LOG_DIR}")
  [ "$owner" == "${ZOO_USER}" ]

  # Check the group match the variable ZOO_USER
  group=$(stat -c %U  "${ZOO_DATA_LOG_DIR}")
  [ "$group" == "${ZOO_USER}" ]

  # Check the directory is writable
  status=$(test -w "${ZOO_DATA_LOG_DIR}"; echo $?)
  [ "$status" == 0 ]

}

@test "Check the zookeeper 'myid' file is present and correct" {

  # Check the myid file is present
  status=$(test -f /data/myid;echo $?)
  [ "$status" -eq 0 ]

  # Check the myid file is correct
  myid=$(cat /data/myid || 0)
  [ "$myid" -ge 0 ] && [ "$myid" -le 255 ]

}
