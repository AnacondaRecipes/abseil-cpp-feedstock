#!/bin/bash

set -exuo pipefail

echo "Building ${PKG_NAME}."

# Isolate the build.
mkdir -p build
cd build || exit 1

if [[ "${target_platform}" == osx-* ]]; then
    # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
    CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

# Generate the build files.
echo "Generating the build files..."
cmake -G Ninja \
	-DCMAKE_INSTALL_PREFIX=${PREFIX} \
	-DCMAKE_PREFIX_PATH=${PREFIX} \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DCMAKE_BUILD_TYPE=Release \
	-DBUILD_SHARED_LIBS=ON \
	-DCMAKE_CXX_STANDARD=17 \
	-DABSL_PROPAGATE_CXX_STD=ON \
	${CMAKE_ARGS} \
    ..

ninja install || exit 1

# Error free exit!
echo "Error free exit!"
exit 0

