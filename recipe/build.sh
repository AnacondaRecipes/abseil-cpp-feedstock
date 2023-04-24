mkdir -p build
cd build

cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_PREFIX_PATH=${PREFIX} \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_CXX_STANDARD=${CXX_STANDARD} \
    -DABSL_PROPAGATE_CXX_STD=ON \
    -GNinja \
    ..

cmake --build .
cmake --install .
