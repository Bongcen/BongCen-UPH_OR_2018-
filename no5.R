library(lpSolveAPI)
# The first step is to create a model, which takes as arguments the
# number of constraints in your model, and the number of decision
# variables in your model.
air = make.lp(6,2)
# Now we need to set up the constraints and objective. The best way to 
# do this using the lpSolveAPI package is by viewing the constraints in
# a matrix format.
set.column(air, 1, c(0.5, 0.6, 1, 1, 0, 0))
set.column(air, 2, c(0.5, 0.4, 0, 0, 1, 1))
set.constr.type(air, c("<=","<=",">=","<=",">=","<="))
set.rhs(air, c(150, 145, 30, 150, 40, 200))

set.objfn(air, c(8, 10))

# The default setting is minimize for the objective, so we need to 
# tell R that we are maximizing our objective:
lp.control(air,sense='max')
# If we want to take a look at our model, we can just type:
air
# Now we are ready to solve our model:
solve(air)
# An output of zero means that the model was successfully solved. 
# You can look at the optimal objective function value or optimal
# decision variable values with get.objective and get.variables:
get.objective(air)
get.variables(air)
#Plot a graph
plot(air)

#Sensitivity
get.sensitivity.rhs(air)
