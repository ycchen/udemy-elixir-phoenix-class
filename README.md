#### How to require test.ex inside of iex

> touch test.ex

\\ test.ex
defmodule Test do
  def fib(0), do: 1
  def fib(1), do: 1
  def fib(n) do
    fib(n-1) + fib(n-2)
  end
end

iex(1)> c("test.ex")
[Test]
iex(2)> Test.fib(0)
1
