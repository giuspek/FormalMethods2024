from pysmt.shortcuts import *






var = {"c{}{}".format(i,j): Symbol("c{}{}".format(i,j),BOOL) for i in "abcdefgh" for j in range(1,9)}
n=8
msat = UnsatCoreSolver()
for j in "abcdefgh":
    for k in range(1,n+1):
        chosenCell = "c"+str(j)+str(k)
        msat.add_assertion(Implies(var[chosenCell],Not(Or(
        [var["c{}{}".format(i,k)] for i in "abcdefgh" if i!=j] +
        [var["c{}{}".format(j,i)] for i in range(1,n+1) if i!=k]+
        #Diagonal coditioning
        [var["c{}{}".format(chr(char), k+(ord(chr(char))-ord(j)))] for char in range(ord(j) + 1, ord('h')+1) if k+(ord(chr(char))-ord(j))<9 ]+
        [var["c{}{}".format(chr(char), k+(ord(chr(char))-ord(j)))] for char in reversed(range(ord("a"),ord(j))) if k+(ord(chr(char))-ord(j))>0 ]+
        #Diagonal coditioning
        [var["c{}{}".format(chr(char), k-(ord(chr(char))-ord(j)))] for char in range(ord(j) + 1, ord('h')+1) if k-(ord(chr(char))-ord(j))>0]+
        [var["c{}{}".format(chr(char), k-(ord(chr(char))-ord(j)))] for char in reversed(range(ord("a"),ord(j))) if k-(ord(chr(char))-ord(j))<9 ]
        ))))

#Eight cells should be set to true:
    for i in "abcdefgh":
        msat.add_assertion(Or(var["c{}{}".format(i,k)] for k in range(1,9)))


res=msat.solve()
if res:
    for el in msat.get_model():
        if(el[1]==Bool(True)):
            print(el)
else:
    print(msat.get_unsat_core())

    
    
