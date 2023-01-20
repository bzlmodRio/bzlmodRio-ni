load("@bzlmodrio-ni//:maven_cpp_deps.bzl", "setup_legacy_bzlmodrio_ni_cpp_dependencies")
load("@rules_roborio_toolchain//:maven_deps.bzl", "setup_legacy_setup_toolchains_dependencies")
load("@rules_roborio_toolchain//toolchains:load_toolchains.bzl", "load_toolchains")
load("@rules_python//python:pip.bzl", "pip_parse")

def _setup_toolchains():
    setup_legacy_setup_toolchains_dependencies()

    load_toolchains()

    native.register_toolchains(
        "@local_roborio//:macos",
        "@local_roborio//:linux",
        "@local_roborio//:windows",
    )

def _setup_cpp_dependencies():
    setup_legacy_bzlmodrio_ni_cpp_dependencies()

def _combine_maven_info(maven_artifacts, maven_repositories, setup_functor):
    dep_maven_artifacts, dep_maven_repositories = setup_functor()

    maven_artifacts += dep_maven_artifacts
    maven_repositories += dep_maven_repositories

    return maven_artifacts, maven_repositories

def setup_dependencies():
    _setup_toolchains()
    _setup_cpp_dependencies()

    pip_parse(
        name = "bzlmodrio-gentool-pip",
        requirements_lock = "@bzlmodrio-gentool//:requirements_lock.txt",
    )
