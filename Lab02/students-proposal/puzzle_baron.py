from pysmt.shortcuts import *

# Creating dictionary to store variables
time_room = {"tr{}{}".format(i,j): Symbol("tr{}{}".format(i,j), BOOL) for i in range(0,5) for j in ["120","122","125","129","215"]}
time_size = {"ts{}{}".format(i,j): Symbol("ts{}{}".format(i,j), BOOL) for i in range(0,5) for j in ["8","14","17","18","25"]}

# We merge both dictionary into one
var = {**time_room, **time_size}

final_answer = ["7am: ", "9am: ", "11am: ", "1pm: ", "3pm: "]

msat = Solver()

# The course in room 129 starts sometime after the class with 25 students.
msat.add_assertion(Or(
    And(var["tr1129"],var["ts025"]),
    And(var["tr2129"],Or(var["ts125"],var["ts025"])),
    And(var["tr3129"],Or(var["ts125"],var["ts025"],var["ts225"])),
    And(var["tr4129"],Or(var["ts125"],var["ts025"],var["ts225"],var["ts325"])),
    ))
#Of the class in room 120 and the class in room 215, one has 14 students and the other starts at 11:00 am.

msat.add_assertion(Or(
	And(var["tr2120"],Or(And(var["ts114"],var["tr1215"]),And(var["ts314"],var["tr3215"]),And(var["ts414"],var["tr4215"]),And(var["ts014"],var["tr0215"]))),
	And(var["tr2215"],Or(And(var["ts114"],var["tr1120"]),And(var["ts314"],var["tr3120"]),And(var["ts414"],var["tr4120"]),And(var["ts014"],var["tr0120"])))	
))


#The 11:00 am class has 8 students.
msat.add_assertion(var["ts28"])
#The course in room 120 starts 2 hours after the course with 25 students.
msat.add_assertion(Or(
	And(var["tr1120"],(var["ts025"])),
	And(var["tr2120"],(var["ts125"])),
	And(var["tr3120"],(var["ts225"])),
	And(var["tr4120"],(var["ts325"])),
))
#The class in room 122 is either the course with 17 students or the 7:00 am class.
msat.add_assertion(Or(var["tr0122"],Or(And(var["ts117"],var["tr1122"]),And(var["ts217"],var["tr2122"]),And(var["ts317"],var["tr3122"]),And(var["ts417"],var["tr4122"]))))
#The five classes are the 3:00 pm class, the course with 25 students, 
#the course in room 129, the class with 8 students and the class in room 122.
msat.add_assertion(And(Not(var["tr4129"]),Not(var["tr4122"]),Not(var["ts48"]),Not(var["ts425"])))
msat.add_assertion(Not(Or(
	And(Or(var["tr0129"],var["tr0122"]),Or(var["ts025"],var["ts08"])),
	And(Or(var["tr1129"],var["tr1122"]),Or(var["ts125"],var["ts18"])),
	And(Or(var["tr2129"],var["tr2122"]),Or(var["ts225"],var["ts28"])),
	And(Or(var["tr3129"],var["tr3122"]),Or(var["ts325"],var["ts38"])),
	And(Or(var["tr4129"],var["tr4122"]),Or(var["ts425"],var["ts48"])),
)))



# Each time must be associated to exactly one room
for i in range(0,5):
	msat.add_assertion(ExactlyOne([var["tr{}{}".format(i, j)] for j in ["120","122","125","129","215"]]))

# Each time must be associated to exactly one class size
for i in range(0,4):
	msat.add_assertion(ExactlyOne([var["ts{}{}".format(i, j)] for j in ["8","14","17","18","25"]]))	

# Each class must be associated to exactly one time slot
for j in ["120","122","125","129","215"]:
	msat.add_assertion(ExactlyOne([var["tr{}{}".format(i, j)] for i in range(0,5)]))

# Each class size must be associated to exactly one time slot
for j in ["8","14","17","18","25"]:
	msat.add_assertion(ExactlyOne([var["ts{}{}".format(i, j)] for i in range(0,5)]))



final_answer = ["7am: ", "9am: ", "11am: ", "1pm: ", "3pm: "]

res = msat.solve()
if res:
	sat_model = {el[0].symbol_name():el[1] for el in msat.get_model()}
	for i in range(0,5):
		for j in ["120","122","125","129","215"]:
			if sat_model["tr{}{}".format(i,j)] == Bool(True):
				final_answer[i] = final_answer[i] + j + " - "
		for j in ["8","14","17","18","25"]:
			if sat_model["ts{}{}".format(i,j)] == Bool(True):
				final_answer[i] = final_answer[i] + j
	print("\n".join(final_answer))
else:
	print("UNSAT")




