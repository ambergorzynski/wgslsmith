# wgslsmith

[![CI](https://github.com/wgslsmith/wgslsmith/actions/workflows/ci.yml/badge.svg)](https://github.com/wgslsmith/wgslsmith/actions/workflows/ci.yml)
[![](https://img.shields.io/badge/docs-wgslsmith.github.io-orange)](https://wgslsmith.github.io)

`wgslsmith` provides a set of tools for randomized testing of [WGSL](https://www.w3.org/TR/WGSL/) shader compilers. This includes a random program generator, as well as tools for executing arbitrary compute shaders and performing automated test case reduction on WGSL programs.

The compilers that are supported for testing currently include [naga](https://github.com/gfx-rs/naga) via [wgpu](https://github.com/gfx-rs/wgpu) and [tint](https://dawn.googlesource.com/tint) via [dawn](https://dawn.googlesource.com/dawn).

This was developed for [@hasali19](https://github.com/hasali19)'s final year project at Imperial College London, and went on to win a prize. The project report is available [here](https://drive.google.com/file/d/1qDcGQndpl5onKN2UA4CFStDJQBRfpKIm/view?usp=sharing).

## Requirements

- [Rust](https://rustup.rs/) - Latest stable toolchain

A more complete list of requirements is available [here](https://wgslsmith.github.io/building/index.html).

## Building

This repository contains several submodules. These should be shallow-cloned as follows otherwise they will take a very long time.

```sh
$ git clone https://github.com/wgslsmith/wgslsmith
$ cd wgslsmith
$ git submodule update --init --depth=1
```

To build everything without options, run the following:
```sh
$ ./build.py
```

WGSLsmith is linked to a specific version of Dawn, which is contained in the submodule `external/Dawn`. It is possible to link WGSLsmith with a different Dawn checkout using the build option `--dawn-path`. 

```sh
$ ./build.py --dawn-path=/path/to/dawn
```

The Dawn submodule uses the Chromium build system and depedency management, `depot_tools`. This will fetch and update external dependencies and toolchains with `gclient`. `gclient` auto-updates `depot_tools`. Sometimes this introduces problems if the updated dependencies are not backward-compatible with the Dawn version that WGSLsmith is attempting to link with.

By default, WGSLsmith disables the `depot_tools` auto-update. To enable the update, run the following:
```sh
$ ./build.py --update-depot-tools
```

Some of the tools can be used without any WebGPU implementations/compilers (e.g. generator and reconditioner). To compile these, run:

```sh
$ git clone --recursive https://github.com/wgslsmith/wgslsmith
$ cd wgslsmith
$ cargo build -p wgslsmith --release
$ target/release/wgslsmith --help
```

## Usage

All the tools can be used through the `wgslsmith` command:

```sh
# Do some fuzzing
$ wgslsmith fuzz
# Recondition a shader
$ wgslsmith recondition /path/to/shader.wgsl
# Reduce a crash
$ wgslsmith reduce crash path/to/shader.wgsl --config wgpu:dx12:9348 --regex '...'
# Run a shader
$ wgslsmith run path/to/shader.wgsl
```

Some options can be configured through a config file. Run `wgslsmith config` to open the default config file in a text editor. You can also specify a custom config file with the `--config-file` option.

```toml
[reducer]
tmpdir = "/home/hasan/dev/wgslsmith/tmp"
parallelism = 24

[reducer.creduce]
path = "/optional/path/to/creduce"

[reducer.cvise]
path = "/optional/path/to/cvise"

[reducer.perses]
# You need this if you want to reduce with perses
jar = "/path/to/perses_deploy.jar"
```

To use perses for reduction, grab and build it from https://github.com/wgslsmith/perses, then add it to the config as above.

## Development

[Insta](https://github.com/mitsuhiko/insta) is used for snapshot testing the parser.

Install the tool with `cargo install cargo-insta` and use `cargo insta test -p parser` to run the parser tests.

## Updating Dawn

The Dawn submodule should be periodically updated, ideally whenever there is a new stable Chromium branch. The shallow clone of the submodule will not contain the branch information, so fetch this:
```sh
$ cd /path/to/wgslsmith
$ cd external/dawn
$ git remote set-branches origin '*'
$ git fetch --depth=1
$ git checkout chromium/${LATEST}
```

Where LATEST is the desired branch, e.g. 6846.

Next, attempt to build WGSLsmith and update depot tools to get the required dependencies.
```sh
$ cd /path/to/wgslsmith
$ ./build.py --update-depot-tools
```

The build may fail if the updated Dawn is not compatible with WGSLsmith. In this case, you will need to investigate the changes that have taken place since the previous linked Dawn and update WGSLsmith accordingly. Git bisect is a very useful tool for identifying the specific commit in which a breaking change was made, which can help to guide the update.

#### Common issues

#TODO