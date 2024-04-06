from pysmt.shortcuts import *

n=5
A=Int(0)
B=Int(1)
C=Int(2)
D=Int(3)
E=Int(4)

solver = Solver(name="z3")

process = ["A","B","C","D","E"]


#first argument is the last process
fu = FunctionType(BOOL,[INT,INT])

after=Symbol("after",fu)
i=Symbol('i',INT)
lastProcess=Symbol("lastProcess",INT)

#last process must be between (A,E)
solver.add_assertion(And(GE(lastProcess,A),LE(lastProcess,E)))

#We can execute A after D is completed
solver.add_assertion(after(A,D))
solver.add_assertion(And(after(B,C),after(B,E)))

#We can execute E after B or D are completed.
solver.add_assertion(Or(after(E,B),after(E,D)))

#We can execute C after A is completed
solver.add_assertion(after(C,A))

#Hidden conditions:
#no one is exectuted after the last process
solver.add_assertion(ForAll([i],Not(after(i,lastProcess))))
#no one is executed after himself
solver.add_assertion(ForAll([i],Not(after(i,i))))


num_solutions = 0

print(solver.assertions)

while solver.solve():
    num_solutions += 1
    sat_model = {el[0].symbol_name():el[1] for el in solver.get_model()}
    print(sat_model)
    for x in solver.get_model():
        print(x[1])
    solver.add_assertion(Not(Equals(lastProcess, sat_model['lastProcess'])))
        
print("num_solutions:", num_solutions)


