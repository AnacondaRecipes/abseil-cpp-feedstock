mkdir build
cd build
if %ERRORLEVEL% neq 0 exit 1

cmake -GNinja ^
	-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
	-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
	-DCMAKE_BUILD_TYPE=Release ^
	-DCMAKE_CXX_STANDARD=17 ^
	-DBUILD_SHARED_LIBS=ON ^
    -DABSL_PROPAGATE_CXX_STD=ON ^
    -DABSL_USE_EXTERNAL_GOOGLETEST=ON ^
    -DABSL_BUILD_TESTING=ON ^
    -DABSL_BUILD_TEST_HELPERS=ON ^
    !EXTRA_ARGS! ^
	..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install
if %ERRORLEVEL% neq 0 exit 1
