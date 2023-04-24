mkdir build
cd build
cmake -GNinja ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_CXX_STANDARD=%CXX_STANDARD% ^
      -DBUILD_SHARED_LIBS=ON ^
      -DABSL_PROPAGATE_CXX_STD=ON ^
      ..

cmake --build .

cmake --build . --target install
