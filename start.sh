#!/bin/bash

usage() {
    echo "Usage: $0 -n name -p local-port" 1>&2; exit 1;
}

PORT=5432

while getopts "n:p:" o; do
    case "${o}" in
        n)
            NAME=${OPTARG}
            ;;
        p)
            PORT=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${NAME}" ] || [ -z "${PORT}" ]; then
    usage
fi

echo "Running postgres locally for ${NAME} on local port ${PORT}..."

docker build --build-arg dbname=${NAME} -t postgres-vanilla-${NAME} . && \
docker run -p ${PORT}:5432 -d postgres-vanilla-${NAME}
