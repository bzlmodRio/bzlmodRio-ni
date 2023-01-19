
import sys
import os

from bazelrio_gentool.deps.dependency_container import DependencyContainer


def _default_all_platforms():
    return ["linuxathena"]

def get_ni_dependencies():
    
    # year = "2022"
    # version = "2022.0.0"
    # version = "2022.2.0"
    # version = "2022.2.1"
    # version = "2022.2.2"
    # version = "2022.2.3"
    # version = "2022.4.0"

    year = "2023"
    # version = "2023.1.0"
    # version = "2023.2.0"
    # version = "2023.2.1"
    version = "2023.3.0"

    group_id = f"edu.wpi.first.ni-libraries"

    group = DependencyContainer("bzlmodrio-ni", version, year, "https://frcmaven.wpi.edu/release")
    group.create_cc_dependency(f"chipobject", parent_folder="chipobject", group_id=group_id, headers=None, sources=None, resources=_default_all_platforms(), has_jni=False)
    group.create_cc_dependency(f"visa", parent_folder="visa", group_id=group_id, headers=None, sources=None, resources=_default_all_platforms(), has_jni=False)
    group.create_cc_dependency(f"runtime", parent_folder="runtime", group_id=group_id, headers=None, sources=None, resources=_default_all_platforms(), has_jni=False)
    group.create_cc_dependency(f"netcomm", parent_folder="netcomm", group_id=group_id, headers=None, sources=None, resources=_default_all_platforms(), has_jni=False)
    
    return group
    
if __name__ == "__main__":
    get_opencv_dependencies()