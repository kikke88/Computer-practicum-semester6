#!/bin/bash
set -e

make
processes=2
qbits=5
./gen ${qbits} n_${qbits}.data
mpirun -n ${processes} ${1} ./main ${qbits} 1 0 0 n_${qbits}.data ${qbits}_n_Had_1.data
mpirun -n ${processes} ${1} ./main ${qbits} 1 0 0 ${qbits}_n_Had_1.data ${qbits}_n_Had_2.data
./compare ${qbits} n_${qbits}.data ${qbits}_n_Had_2.data
make clean
