#!/bin/sh
set -ex

function run_test() {
    docker build -f Dockerfile.$1 -t bazel-test-$1 .
    docker run --rm -it -w /src/workspace --entrypoint /bin/sh bazel-test-$1 -c 'echo "{}" | ./scripts/gopackagesdriver.sh builtin'
}

run_test 6.4
run_test 7.0