defmodule MyEnumerator do
	def length([]), do: 0

	def length(list) when is_list(list) do
		length(list, 0)
	end

	def length([], accumulator), do: accumulator

	def length([_head | tail], accumulator) do
		IO.inspect(accumulator)
		IO.inspect(tail)
		length(tail, accumulator + 1)
	end
end