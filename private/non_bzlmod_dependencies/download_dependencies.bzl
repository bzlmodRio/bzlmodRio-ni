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
        sha256 = "a8e997def42472dd2f31cd90b855c0aeab93aabe1b436cd48f4e1efdd760f01c",
        strip_prefix = "bzlmodRio-rules_bazelrio-bd9c8375bf4f5a91d08cbf64e359c0b30aaf7433",
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_bazelrio/archive/bd9c8375bf4f5a91d08cbf64e359c0b30aaf7433.zip",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = "c8a6fc0acac4a08aa884b59d13af9c3da010a4eed416ee10ccc05c73b9753deb",
        strip_prefix = "rules_roborio_toolchain-8668e36043c7489a9669a9281f7024272b36d583",
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/8668e36043c7489a9669a9281f7024272b36d583.zip",
    )

    ########################
    # bzlmodRio dependencies

    ########################
