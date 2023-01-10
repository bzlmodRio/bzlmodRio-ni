
import sys
import os

from bazelrio_gentool.deps.dependency_container import DependencyContainer


def _default_all_platforms():
    return ["linuxathena"]

def get_ni_dependencies():
    
    year = "2021"
    # version = "3.4.7-4"
    version = "3.4.7-5"
    
    year = "2022"
    version = "4.5.2-1"

    year = "2023"
    version = "4.5.5-1"
    version = "4.5.5-2"
    version = "4.5.5-3"
    version = "4.6.0-1"
    version = "4.6.0-2"
    version = "2020.9.2"

    group_id = f"edu.wpi.first.ni-libraries"

    group = DependencyContainer("bzlmodrio-ni", version, year, "https://frcmaven.wpi.edu/release")
    group.create_cc_dependency(f"chipobject", parent_folder="ni", group_id=group_id, headers=None, resources=_default_all_platforms(), has_jni=False)
    group.create_cc_dependency(f"visa", parent_folder="ni", group_id=group_id, headers=None, resources=_default_all_platforms(), has_jni=False)
    group.create_cc_dependency(f"runtime", parent_folder="ni", group_id=group_id, headers=None, resources=_default_all_platforms(), has_jni=False)
    group.create_cc_dependency(f"netcomm", parent_folder="ni", group_id=group_id, headers=None, resources=_default_all_platforms(), has_jni=False)
    
    return group
    
if __name__ == "__main__":
    get_opencv_dependencies()