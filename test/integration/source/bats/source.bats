#!/usr/bin/env bats

@test "lxd should be in the path" {
    [ "$(command -v lxd)" ]
}

@test "lxc should be in the path" {
    [ "$(command -v lxc)" ]
}

@test "lxd service should be running and ok" {
  [ "$(service lxd status)" ]
}

# We use sudo here beacause vagrant user
# does not belong to lxd group
@test "lxd API should be working" {
  run sudo lxc finger
  [ "$status" -eq 0 ]
}
