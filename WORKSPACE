workspace(name = "bzlmodrio-ni")

load("@bzlmodrio-ni//private/non_bzlmod_dependencies:download_dependencies.bzl", "download_dependencies")

download_dependencies()

load("@bzlmodrio-ni//private/non_bzlmod_dependencies:setup_dependencies.bzl", "setup_dependencies")

setup_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")
