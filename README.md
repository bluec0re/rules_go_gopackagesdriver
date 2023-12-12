# Crashing packages driver with bazel 7.0

```
+ docker run --rm -it -w /src/workspace --entrypoint /bin/sh bazel-test-7.0 -c 'echo "{}" | ./scripts/gopackagesdriver.sh builtin'
Extracting Bazel installation...
Starting local Bazel server and connecting to it...
INFO: Analyzed target @@io_bazel_rules_go//go/tools/gopackagesdriver:gopackagesdriver (81 packages loaded, 9162 targets configured).
INFO: Found 1 target...
WARNING: failed to create one or more convenience symlinks for prefix 'bazel-':
  cannot create symbolic link bazel-bin -> /home/ubuntu/.cache/bazel/_bazel_ubuntu/a08c2e4811c846650b733c6fc815a920/execroot/_main/bazel-out/k8-fastbuild/bin:  /src/workspace/bazel-bin (Permission denied)
  cannot create symbolic link bazel-testlogs -> /home/ubuntu/.cache/bazel/_bazel_ubuntu/a08c2e4811c846650b733c6fc815a920/execroot/_main/bazel-out/k8-fastbuild/testlogs:  /src/workspace/bazel-testlogs (Permission denied)
  cannot create symbolic link bazel-out -> /home/ubuntu/.cache/bazel/_bazel_ubuntu/a08c2e4811c846650b733c6fc815a920/execroot/_main/bazel-out:  /src/workspace/bazel-out (Permission denied)
  cannot create symbolic link bazel-workspace -> /home/ubuntu/.cache/bazel/_bazel_ubuntu/a08c2e4811c846650b733c6fc815a920/execroot/_main:  /src/workspace/bazel-workspace (Permission denied)
Target @@io_bazel_rules_go//go/tools/gopackagesdriver:gopackagesdriver up-to-date:
  /home/ubuntu/.cache/bazel/_bazel_ubuntu/a08c2e4811c846650b733c6fc815a920/execroot/_main/bazel-out/k8-fastbuild/bin/external/io_bazel_rules_go/go/tools/gopackagesdriver/gopackagesdriver_/gopackagesdriver
INFO: Elapsed time: 35.683s, Critical Path: 19.60s
INFO: 10 processes: 6 internal, 4 processwrapper-sandbox.
INFO: Build completed successfully, 10 total actions
INFO: Running command line: /home/ubuntu/.cache/bazel/_bazel_ubuntu/a08c2e4811c846650b733c6fc815a920/execroot/_main/bazel-out/k8-fastbuild/bin/external/io_bazel_rules_go/go/tools/gopackagesdriver/gopackagesdriver_/gopackagesdriver builtin
Running: [bazel info --tool_tag=gopackagesdriver --ui_actions_shown=0]
Running: [bazel query --tool_tag=gopackagesdriver --ui_actions_shown=0 --ui_event_filters=-info,-stderr --noshow_progress --order_output=no --output=label --nodep_deps --noimplicit_deps --notool_deps @@io_bazel_rules_go//:stdlib]
Running: [bazel build --tool_tag=gopackagesdriver --ui_actions_shown=0 --show_result=0 --build_event_json_file=/tmp/gopackagesdriver_bep_3834045985 --build_event_json_file_path_conversion=no --experimental_convenience_symlinks=ignore --ui_event_filters=-info,-stderr --noshow_progress --aspects=@@io_bazel_rules_go//go/tools/gopackagesdriver:aspect.bzl%go_pkg_info_aspect --output_groups=go_pkg_driver_json_file,go_pkg_driver_stdlib_json_file,go_pkg_driver_srcs --keep_going @io_bazel_rules_go//:stdlib]
panic: runtime error: invalid memory address or nil pointer dereference
[signal SIGSEGV: segmentation violation code=0x1 addr=0x0 pc=0x54bb55]

goroutine 1 [running]:
main.(*PackageRegistry).walk(0xc00005c5c0, 0xc00008fae0?, {0xc00018a0a0?, 0x1b?})
	external/io_bazel_rules_go/go/tools/gopackagesdriver/packageregistry.go:79 +0x55
main.(*PackageRegistry).Match(0xc00005c5c0, {0xc00005c2b0, 0x1, 0xc0001bfd80?})
	external/io_bazel_rules_go/go/tools/gopackagesdriver/packageregistry.go:112 +0x2fa
main.(*JSONPackagesDriver).GetResponse(0xc00005c5a0?, {0xc00005c2b0?, 0xc0000cf4a0?, 0xc00005c2b0?})
	external/io_bazel_rules_go/go/tools/gopackagesdriver/json_packages_driver.go:51 +0x25
main.run()
	external/io_bazel_rules_go/go/tools/gopackagesdriver/main.go:111 +0x5c5
main.main()
	external/io_bazel_rules_go/go/tools/gopackagesdriver/main.go:115 +0x2b
```