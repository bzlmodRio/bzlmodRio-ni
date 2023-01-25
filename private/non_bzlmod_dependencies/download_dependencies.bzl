load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_dependencies():
    # JVM External
    RULES_JVM_EXTERNAL_TAG = "4.2"
    RULES_JVM_EXTERNAL_SHA = "cd1a77b7b02e8e008439ca76fd34f5b07aecb8c752961f9640dea15e9e5ba1ca"
    http_archive(
        name = "rules_jvm_external",
        sha256 = RULES_JVM_EXTERNAL_SHA,
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
    )

    # Bazelrio Rules
    http_archive(
        name = "rules_bazelrio",
        sha256 = "5bcea84860f14b03767cbc4f3d16173502fe60173968da6715fa11b1aedb8fe3",
        strip_prefix = "bzlmodRio-rules_bazelrio-4908451bfa5a04f6b79a6181ad95eeb0eb4e69d3",
        url = "https://github.com/bzlmodRio/bzlmodRio-rules_bazelrio/archive/4908451bfa5a04f6b79a6181ad95eeb0eb4e69d3.tar.gz",
    )

    # Roborio Toolchain
    http_archive(
        name = "rules_roborio_toolchain",
        sha256 = "c83f40ec9bafba45c726062e3c7982f0301fbede9aa46ac25a9900642c13ca66",
        strip_prefix = "rules_roborio_toolchain-8668e36043c7489a9669a9281f7024272b36d583",
        url = "https://github.com/bzlmodRio/rules_roborio_toolchain/archive/8668e36043c7489a9669a9281f7024272b36d583.tar.gz",
    )

    ########################
    # bzlmodRio dependencies

    ########################
