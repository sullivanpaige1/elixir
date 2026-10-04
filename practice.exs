# ASSESSMENT 1 -----------------------------------
# Variables

x = 10
y = x
x = 25

IO.inspect(x)
IO.inspect(y)

# Tuples

student = {"Paige", 23, :active}

IO.inspect(elem(student, 2))

data = {:ok, "hello", 42}

IO.inspect(elem(data, 2))

# BIF

a = [1, 2]
b = [3, 4]

a ++ b

# -- (List Subtraction)

# [1, 2, 3, 4] -- [2]
# [1, 3, 4]

# ["cat", "dog", "bird"] -- ["dog"]
# ["cat", "bird"]


# ASSESSMENT 2 -----------------------------------

# Functions
# = is a match operator, not simple "assignment"
# x = 5

# Since x is unbound, this will match and bind x to 5
# {x, y} = {10, 20}

# the tuple structures match, so x is now 10 and y is now 20
# x = 10
# y = 20

# but this fails because the tuple structures do not match
# {x, y} = {10, 20, 30}

x = 10
{^x, y} = {10, 30}

IO.inspect(x)
IO.inspect(y)
