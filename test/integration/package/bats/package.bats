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

## test-kitchen hack :
# We use sudo here because .config dir is
# created with root rights under vagrant home.
@test "lxd API should be working" {
  run sudo lxc finger
  [ "$status" -eq 0 ]
}
