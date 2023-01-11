
import os
from generate_ni.get_ni_dependencies import get_ni_dependencies

from bazelrio_gentool.generate_group import generate_group
from bazelrio_gentool.generate_module_project_files import generate_module_project_files, MandetoryDependencySettings
from bazelrio_gentool.clean_existing_version import clean_existing_version
from bazelrio_gentool.utils import TEMPLATE_BASE_DIR, render_template



def main():
    SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
    REPO_DIR = os.path.join(SCRIPT_DIR, "..")
    output_dir = os.path.join(REPO_DIR, "dependencies")

    group = get_ni_dependencies()

    mandetory_dependencies = MandetoryDependencySettings(
        bcr_branch = "main",
    )

    # clean_existing_version(REPO_DIR)
    generate_module_project_files(REPO_DIR, group, mandetory_dependencies)
    generate_group(output_dir, group)
    
if __name__ == "__main__":
    """
    bazel run @bzlmodrio-ni//generate_ni:generate_ni_deps
    """
    main()
