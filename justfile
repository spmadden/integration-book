#!/usr/bin/env -S just --justfile

default +FLAGS='': bootstrap (build FLAGS)

ci +FLAGS='': bootstrap (build FLAGS)

check_install prereq +FLAGS='':
    #!/usr/bin/env bash
    set -euxo pipefail
    if ! cargo install --list | grep -e "^{{prereq}}" > /dev/null; then
      cargo install {{prereq}} {{FLAGS}}
    fi

bootstrap:
    just check_install mdbook
    just check_install mdbook-admonish --vers "1.14.0" --locked
    just check_install mdbook-pdf --features fetch
    just check_install mdbook-epub


build +FLAGS='':
    mdbook build {{FLAGS}}