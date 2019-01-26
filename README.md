Purpose:
The scripts/Dockerfiles here rebase OKD 3.11 (fedora 29). The multiarch team needed to have a place to test multi-arch changes to support OCP.

Structure:
The idea here is to be able to clone this repo to a machine with fedora 29. Then run build_<okd_version>.sh and have all components (rpms and containers) built for OKD

See the README_<OKDVERSION>.md for requirements and supported archs specific for each relase.

Packages needed on your host:
dnf install libsemanage-python3 docker
