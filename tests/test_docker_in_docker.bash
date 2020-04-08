#!/usr/bin/env bash

set -o errexit
set -o nounset

IMAGE_TAG="${1}"

if [ "${IMAGE_TAG}" == "" ]; then
	echo "Usage: ./build_image IMAGE_TAG"
	exit 1
fi

TESTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$( readlink -f "${TESTS_DIR}/.." )"
SCRIPT_DIR="$( readlink -f "${PROJECT_DIR}/scripts" )"

"${SCRIPT_DIR}/create_workspace_container" "${IMAGE_TAG}"

# inside container
docker --version
exit 0