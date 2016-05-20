md build
cd build
SET BOOST_ROOT=$PREFIX

cmake .. -G"Visual Studio 14 2015 Win64" -DWALBERLA_BUILD_WITH_PYTHON=ON -DWALBERLA_BUILD_WITH_PYTHON_MODULE=ON -DWALBERLA_BUILD_WITH_MPI=OFF -DWALBERLA_BUILD_WITH_OPENMP=ON -DPYTHON_EXECUTABLE=C:/Anaconda3/envs/_build/python.exe
msbuild walberla.sln /property:Configuration=Release /property:Platform=%ARCH%
