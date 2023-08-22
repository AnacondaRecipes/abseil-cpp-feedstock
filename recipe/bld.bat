mkdir build
cd build
cmake -GNinja ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	  -DCMAKE_BUILD_TYPE=Release ^
	  -DBUILD_SHARED_LIBS=ON ^
	  -DABSL_USE_EXTERNAL_GOOGLETEST=ON ^
	  -DABSL_BUILD_TESTING=ON ^
	  -DABSL_BUILD_TEST_HELPERS=ON ^
	  ..

cmake --build .

cmake --build . --target install
