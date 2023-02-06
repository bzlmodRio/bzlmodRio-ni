import os
from get_ni_dependencies import get_ni_dependencies

from bazelrio_gentool.generate_group import generate_meta_deps
from bazelrio_gentool.generate_module_project_files import (
    generate_module_project_files,
    create_default_mandatory_settings,
)
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template
from bazelrio_gentool.cli import add_generic_cli
import argparse


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "libraries")

    parser = argparse.ArgumentParser()
    add_generic_cli(parser)
    args = parser.parse_args()

    group = get_ni_dependencies()

    mandatory_dependencies = create_default_mandatory_settings(
        use_local_roborio=args.use_local_roborio,
        use_local_bazelrio=args.use_local_bazelrio,
    )

    clean_existing_version(REPO_DIR)
    generate_module_project_files(REPO_DIR, group, mandatory_dependencies)
    generate_meta_deps(output_dir, group, force_tests=args.force_tests)


if __name__ == "__main__":
    """
    bazel run //:generate
    """
    main()
