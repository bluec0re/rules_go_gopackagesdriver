#!/bin/sh

bazel="$(command -v bazel || command -v bazelisk)"

exec "${bazel}" run -- @io_bazel_rules_go//go/tools/gopackagesdriver "$@"
