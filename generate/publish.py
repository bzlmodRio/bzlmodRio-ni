import os
from get_ni_dependencies import get_ni_dependencies
from bazelrio_gentool.generate_json import generate_json


def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    registry_location = os.path.join(SCRIPT_DIR, "..", "..", "bazel-central-registry")

    group = get_ni_dependencies()

    os.chdir(SCRIPT_DIR)
    generate_json(
        registry_location, group, module_json_template=None, module_template=None
    )


if __name__ == "__main__":
    """
    bazel run //:publish
    """
    main()
