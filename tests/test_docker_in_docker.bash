#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

image_tag="${1:-}"

if [ "${image_tag}" == "" ]; then
	printf 'Usage: ./build_image IMAGE_TAG\n'
	exit 1
fi

test_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
project_dir="$( readlink -f "${test_dir}/.." )"
script_dir="$( readlink -f "${project_dir}/scripts" )"

printf 'test_docker_in_docker\n'

# setup
printf 'Creating development container..\n'
container_name='cpp-development.test_docker_in_docker'
"${script_dir}/create_workspace_container" \
	--tag "${image_tag}" \
	--name "${container_name}" \
	--detach

# test
printf '\nContainer output:\n'
docker exec "${container_name}" bash -c 'set -o xtrace && docker --version'

# cleanup
printf 'Cleaning up container...\n'
docker container rm "${container_name}" --force

printf '\n'