workspace(name = "bzlmodrio_ni")

load("@bzlmodrio_ni//private/non_bzlmod_dependencies:download_dependencies.bzl", "download_dependencies")

download_dependencies()

load("@bzlmodrio_ni//private/non_bzlmod_dependencies:setup_dependencies.bzl","setup_dependencies")

setup_dependencies()

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_artifacts, maven_repositories = get_java_dependenicies()

maven_install(
    name = "maven",
    artifacts = maven_artifacts,
    repositories = maven_repositories,
    # maven_install_json = "//build_scripts/bazel/deps:maven_install.json",
)

load("@bzlmodrio-gentool-pip//:requirements.bzl", "install_deps")

install_deps()
