#!/bin/bash

VCPKG_PATH=$(readlink `which vcpkg`)
CMAKE_TOOLCHAIN_FILE="${VCPKG_PATH%/*}/scripts/buildsystems/vcpkg.cmake"

BUILD_DIR=out

if [ ! -d "${BUILD_DIR}" ]; then
    mkdir ${BUILD_DIR}
fi

cmake . -G Xcode -B ${BUILD_DIR} -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}