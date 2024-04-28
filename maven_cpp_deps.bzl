load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

cc_library_headers = """cc_library(
    name = "headers",
    hdrs = glob(["**"]),
    includes = ["."],
    visibility = ["//visibility:public"],
)
"""

cc_library_sources = """filegroup(
     name = "sources",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

def __setup_bzlmodrio_ni_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2024.2.1/chipobject-2024.2.1-headers.zip",
        sha256 = "c4299902974440b00d9046d4473d9350cb9489cd673f0875eadf88441056461f",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2024.2.1/chipobject-2024.2.1-linuxathena.zip",
        sha256 = "c42aee14154143489825022c76aaeeeefe46840c89ad48c757f7c70f8a46cf7f",
        build_file = "@bzlmodrio-ni//private/cpp/chipobject:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2024.2.1/visa-2024.2.1-headers.zip",
        sha256 = "68fb8880e37863cddb39c1514ac73f3c5a4b5c79961c356f7d9e60dc02cddf15",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2024.2.1/visa-2024.2.1-linuxathena.zip",
        sha256 = "162511fd08957eb9a35c2b97ec8584fc5b43c6b9a8deb049de88376690a495fe",
        build_file = "@bzlmodrio-ni//private/cpp/visa:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_runtime_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/runtime/2024.2.1/runtime-2024.2.1-linuxathena.zip",
        sha256 = "5ad951daea54da1193ebd4416a8077ee3de9abd8c8974cc7275238c1221687b2",
        build_file = "@bzlmodrio-ni//private/cpp/runtime:shared.BUILD.bazel",
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2024.2.1/netcomm-2024.2.1-headers.zip",
        sha256 = "b3de04c3e8950c9017ec1a6adce7ca6be295aa1a599a931778f96ab1b4245786",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2024.2.1/netcomm-2024.2.1-linuxathena.zip",
        sha256 = "8b1ba57c0fde3b1b3216a16bdf31b9440f3b7782637384cdca34e217e0eb4bf9",
        build_file = "@bzlmodrio-ni//private/cpp/netcomm:shared.BUILD.bazel",
    )

def setup_legacy_bzlmodrio_ni_cpp_dependencies():
    __setup_bzlmodrio_ni_cpp_dependencies(None)

setup_bzlmodrio_ni_cpp_dependencies = module_extension(
    __setup_bzlmodrio_ni_cpp_dependencies,
)
