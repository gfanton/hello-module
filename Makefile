make_dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
default_deps := Makefile

# ARGS
OUTPUT_FRAMEWORK ?= $(make_dir)/ios/Frameworks/Hello.xcframework

### commands

all build: build.ios build.android

init:
	go run golang.org/x/mobile/cmd/gomobile init

build.ios: init $(OUTPUT_FRAMEWORK)
build.android: init output/android/hello.aar

fclean:
	rm -rf output

.PHONY: build.ios build.android fclean

### go bind

go_files := $(shell find . -iname '*.go')
go_deps := go.mod go.sum $(go_files)
$(OUTPUT_FRAMEWORK): $(default_deps) $(go_deps)
	mkdir -p $(dir $@)
	go run golang.org/x/mobile/cmd/gomobile bind -v -o $@ -target ios $(make_dir)/framework/hello

output/android/hello.aar: $(default_deps) $(go_deps)
	@mkdir -p $(dir $@)
	go run golang.org/x/mobile/cmd/gomobile bind -v -o $@ -target android $(make_dir)/framework/hello
