from pysmt.shortcuts import *

var = {"c{}{}".format(i,j): Symbol("c{}{}".format(i,j),BOOL) for i in "abcdefgh" for j in range(1,9)}

msat = Solver()

msat.add_assertion(Implies(var["ca1"],[]))

