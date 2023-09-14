load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

filegroup_all = """filegroup(
     name = "all",
     srcs = glob(["**"]),
     visibility = ["//visibility:public"],
 )
 """

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

cc_library_static = """

cc_library(
    name = "static_libs",
    srcs = glob(["**/*.lib", "**/*.a"]),
    visibility = ["//visibility:public"],
)
"""

cc_library_shared = """
JNI_PATTERN=[
    "**/*jni.dll",
    "**/*jni.so*",
    "**/*jni.dylib",
    "**/*_java*.dll",
    "**/lib*_java*.dylib",
    "**/lib*_java*.so",
]

static_srcs = glob([
        "**/*.lib",
        "**/*.a"
    ],
    exclude=["**/*jni.lib"]
)
shared_srcs = glob([
        "**/*.dll",
        "**/*.so*",
        "**/*.dylib",
    ],
    exclude=JNI_PATTERN + ["**/*.so.debug"]
)
shared_jni_srcs = glob(JNI_PATTERN, exclude=["**/*.so.debug"])

filegroup(
    name = "static_libs",
    srcs = static_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_libs",
    srcs = shared_srcs,
    visibility = ["//visibility:public"],
)

filegroup(
    name = "shared_jni_libs",
    srcs = shared_jni_srcs,
    visibility = ["//visibility:public"],
)
"""

def __setup_bzlmodrio_ni_cpp_dependencies(mctx):
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2024.1.0/chipobject-2024.1.0-headers.zip",
        sha256 = "cb29bd6882bbfe56608a70bc633edf5bedf13f0153df531e93c7d0fce152a052",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2024.1.0/chipobject-2024.1.0-linuxathena.zip",
        sha256 = "36095a67f077837ae6e518b2987e3ecf6fed931a372acc3268e067b4f4f976bf",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2024.1.0/visa-2024.1.0-headers.zip",
        sha256 = "f15a4141887e49fc5533ba5da8a02304ffb3b623c57e1eb4feaca3b7e7411f86",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2024.1.0/visa-2024.1.0-linuxathena.zip",
        sha256 = "1cd5da173951d54e4995759dcf2fb985ea926e93634a9a9154192d58310be51a",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_runtime_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/runtime/2024.1.0/runtime-2024.1.0-linuxathena.zip",
        sha256 = "4463e3bca0c21fc68beec59d34eb29909a37ba5daa451a39800a4209940c20c5",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2024.1.0/netcomm-2024.1.0-headers.zip",
        sha256 = "aa3960c213042a09cdd2a273bc2d14c337ae81e1590e4b9cdcab3316de5716eb",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2024.1.0/netcomm-2024.1.0-linuxathena.zip",
        sha256 = "0e3d271af9df48b5a96dff6cfdfec1760c18b43ec96e36290653f61c84b7797f",
        build_file_content = cc_library_shared,
    )

def setup_legacy_bzlmodrio_ni_cpp_dependencies():
    __setup_bzlmodrio_ni_cpp_dependencies(None)

setup_bzlmodrio_ni_cpp_dependencies = module_extension(
    __setup_bzlmodrio_ni_cpp_dependencies,
)
