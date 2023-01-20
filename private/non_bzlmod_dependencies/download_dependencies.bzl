load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # Python, for gentool
    http_archive(
        name = "rules_python",
        sha256 = "497ca47374f48c8b067d786b512ac10a276211810f4a580178ee9b9ad139323a",
        strip_prefix = "rules_python-0.16.1",
        url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.16.1.tar.gz",
    )

    # Project Generator
    http_archive(
        name = "bzlmodrio-gentool",
        sha256 = "91dbeb541a6151eab3f4dfa37318b81e3f4fa964e45ebea48665cb2b3e471353",
        strip_prefix = "gentool-dummy_version",
        url = "https://github.com/bzlmodRio/gentool/archive/refs/heads/dummy_version.zip",
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "470592cbc252abc8eed7520ce1d9c55007701b62f2e959836e53d66776200e82",
        strip_prefix = "bzlmodRio-rules_bazelrio-bb90ff46dfe56fe1c227aac4277873d12d8abbe5",
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_bazelrio/archive/bb90ff46dfe56fe1c227aac4277873d12d8abbe5.zip",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = "1470b8626dda33deb15bd2a220ce74bcd851880ce4aa560cf853bf6849ff3a01",
        strip_prefix = "rules_roborio_toolchain-ba3f5a3fd391e6536b5fd5c13e0098b06892077a",
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/ba3f5a3fd391e6536b5fd5c13e0098b06892077a.zip",
    )

    ########################
    # bzlmodRio dependencies

    ########################
