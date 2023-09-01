#!/bin/bash

dev_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
dev_dir="$( dirname "$dev_dir" )"

set -e
set -o pipefail

docker run "$@" -it --gpus all --net=host -v  /tmp/.X11-unix:/tmp/.X11-unix \
 -v $HOME/2023WaterCode:/home/ubuntu/.2023WaterCode.readonly \
 --ipc=host \
 -v /dev:/dev --privileged \
 --shm-size=8G \
 -e DISPLAY=$DISPLAY -e NVIDIA_DRIVER_CAPABILITIES=all --user ubuntu testros2:latest /bin/bash