cd src

make -j8 conda 
make -j8 conda mode=shlib
cp lmp_conda $PREFIX/bin/lmp

cd ../python/
$PYTHON install.py
