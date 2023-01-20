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
    native.local_repository(
        name = "bzlmodrio-gentool",
        path = "../../gentool",
    )

    # Bazelrio Rules
    native.local_repository(
        name = "rules_bazelrio",
        path = "../../bzlmodRio-rules_bazelrio",
    )

    # Roborio Toolchain
    native.local_repository(
        name = "rules_roborio_toolchain",
        path = "../../rules_roborio_toolchain",
    )

    ########################
    # bzlmodRio dependencies

    ########################
