#!/usr/bin/env bash


set -a #export declared variables

. /usr/local/share/shflags-1.2.3/shflags

DEFINE_string container_name 'docker-container-installer' "Temporal container name" n
DEFINE_string repository '' "source container repository" r
DEFINE_string src '' "source file or directory path" s
DEFINE_string dest '' "local destination install path" d

FLAGS_HELP=`cat <<EOF
USAGE: ./$(basename $0) [flags]
example: ./$(basename $0) --repository php:latest --src /usr/local/etc/php --dest /tmp
EOF`

FLAGS "$@" || (echo "Failed parsing options." >&2; exit $?)
eval set -- "${FLAGS_ARGV}"

[ -z "${FLAGS_container_name}" ] || [ -z "${FLAGS_repository}" ] || [ -z "${FLAGS_src}" ] || [ -z "${FLAGS_dest}" ] && { flags_help; exit 0; }

if [[ ! -d "${FLAGS_dest}" ]]; then
    echo "Destination download folder \"${FLAGS_dest}\" does not exist."
    exit 127
fi

set -x

docker rm -v ${FLAGS_container_name} > /dev/null 2>&1 || true
docker create --name ${FLAGS_container_name} ${FLAGS_repository}
docker cp ${FLAGS_container_name}:${FLAGS_src} ${FLAGS_dest}
docker rm -v ${FLAGS_container_name}
