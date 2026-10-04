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

# Guard Clauses

defmodule Result do
  def describe({:ok, value}) do
    "Success: #{value}"
  end

  def describe({:error, reason}) do
    "Error: #{reason}"
  end
end

IO.inspect(Result.describe({:ok, 42}))
IO.inspect(Result.describe({:error, "not found"}))

defmodule Number do
  def describe(n) when n > 0 do
    "positive"
  end

  def describe(n) when n < 0 do
    "negative"
  end

  def describe(0) do
    "zero"
  end
end

IO.inspect(Number.describe(7))
IO.inspect(Number.describe(-3))
IO.inspect(Number.describe(0))


# Anonymous Functions

double = fn x -> x * 2 end
IO.inspect(double.(5))

greet = fn name -> "Hello, #{name}!" end

IO.inspect(greet.("Sam"))

describe = fn
  {:ok, value} -> "Got #{value}"
  {:error, reason} -> "Error: #{reason}"
end

IO.inspect(describe.({:ok, 100}))
IO.inspect(describe.({:error, "timeout"}))

# Passing Functions Around

square = fn x -> x * x end

Enum.map([2, 3, 4], square)

IO.inspect(Enum.map([2, 3, 4], square))

check = fn
  n when n > 10 -> "big"
  n when n > 0 -> "positive"
  _ -> "other"
end

IO.inspect(check.(7))

# Named Functions, Guards, and Pattern Matching

defmodule Account do
  def withdraw({:account, balance}, amount)
      when amount > 0 and amount <= balance do
    {:ok, balance - amount}
  end

  def withdraw({:account, _balance}, _amount) do
    {:error, "invalid withdrawal"}
  end
end

IO.inspect(Account.withdraw({:account, 100}, 30))
IO.inspect(Account.withdraw({:account, 100}, 150))

defmodule Temperature do
  def describe(temp) when temp <= 0 do
    "freezing"
  end

  def describe(temp) when temp < 20 do
    "cold"
  end

  def describe(temp) when temp >= 20 do
    "warm"
  end
end

IO.inspect(Temperature.describe(-5))
IO.inspect(Temperature.describe(10))
IO.inspect(Temperature.describe(25))

# Arity

operation = fn
  {:add, a, b} -> a + b
  {:multiply, a, b} -> a * b
end

IO.inspect(operation.({:add, 3, 4}))
IO.inspect(operation.({:multiply, 3, 4}))

get_name = fn
  {:user, name} -> name
end

IO.inspect(get_name.({:user, "Alex"}))

defmodule Choice do
  def choose(n) when n > 0, do: :first
  def choose(n) when n > 10, do: :second
end

IO.inspect(Choice.choose(20))
