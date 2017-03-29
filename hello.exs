defmodule MyGuards do
    defmacro is_kid age do
      quote do: unquote(age) < 12
    end

    defmacro is_adult age do
      quote do: unquote(age) > 18
    end
end
# order of module matters ...

defmodule Hello do
  import MyGuards

  def hello(name,age) when is_kid(age) do
    IO.puts "Hello Kid #{name}"
  end
  def hello(name,age) when is_adult(age) do
    IO.puts "Hello Mister #{name}"
  end
  def hello(name,age) do
    IO.puts "Hello you #{name}"
  end
end
