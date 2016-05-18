git clone git@i10git.cs.fau.de:software/walberla.git

mkdir build
cd build

export BOOST_ROOT=$PREFIX
CC=mpicc CXX=mpicxx cmake .. -DWALBERLA_DIR=../walberla -DWALBERLA_BUILD_WITH_PYTHON=1 -DWALBERLA_BUILD_WITH_PYTHON_MODULE=1

make -j8 grandchemPythonModuleInstall GrandChem
cd apps/grandchem/Grandchem $PREFIX/bin
