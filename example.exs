defmodule Example do
	
	def double(2 = number) do
		IO.puts "double 2"
		IO.puts number * 2
	end

	def double(3 = number) do
		IO.puts "double 3"
		IO.puts number * 2
	end
end

Example.double(2)

Example.double(3)

# Example.double(4)

