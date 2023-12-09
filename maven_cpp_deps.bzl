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
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2024.2.0/chipobject-2024.2.0-headers.zip",
        sha256 = "7ce496235f1b9ffbb31d93d65792937721b59afa3b56ef5802c56226406f6da7",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_chipobject_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/chipobject/2024.2.0/chipobject-2024.2.0-linuxathena.zip",
        sha256 = "e4a4b116ad7a3a50bc4e382e9de5b512f5465f2a30eb568a8defa199c5543dd8",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2024.2.0/visa-2024.2.0-headers.zip",
        sha256 = "d94be2251b72971f3bfccef80055b81c8eecec261d0d56865c0581bea4d77aa9",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_visa_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/visa/2024.2.0/visa-2024.2.0-linuxathena.zip",
        sha256 = "69904fb41112ab59e652737a1c903ea2689429301120ef416a620e0f88aa1c37",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_runtime_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/runtime/2024.2.0/runtime-2024.2.0-linuxathena.zip",
        sha256 = "a3b809ac5ae1ee0696b06e021e4c10d779cb45e77ff3891b684ca8acf001e78e",
        build_file_content = cc_library_shared,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_headers",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2024.2.0/netcomm-2024.2.0-headers.zip",
        sha256 = "91156616d25e1c1b1b1e22f92b2c373a0a03a7c390229898b34a27a4bc9f6f23",
        build_file_content = cc_library_headers,
    )
    maybe(
        http_archive,
        "bazelrio_edu_wpi_first_ni-libraries_netcomm_linuxathena",
        url = "https://frcmaven.wpi.edu/release/edu/wpi/first/ni-libraries/netcomm/2024.2.0/netcomm-2024.2.0-linuxathena.zip",
        sha256 = "13d37de999bddc1f5d39e443f5b0b61c8e056b144e05bc8916cf4550427fb388",
        build_file_content = cc_library_shared,
    )

def setup_legacy_bzlmodrio_ni_cpp_dependencies():
    __setup_bzlmodrio_ni_cpp_dependencies(None)

setup_bzlmodrio_ni_cpp_dependencies = module_extension(
    __setup_bzlmodrio_ni_cpp_dependencies,
)
