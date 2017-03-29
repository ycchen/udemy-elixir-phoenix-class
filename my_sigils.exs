defmodule MySigils do
	# returns the downcasing string if option l is given then returns the list of downcase letters
	def sigil_l(string,[]), do: String.Casing.downcase(string)
	def sigil_l(string,[?l]), do: String.Casing.downcase(string) |> String.graphemes

	#returns the upcasing string if option l is given then returns the list of downcase letter
	def sigil_u(string,[]), do: String.Casing.upcase(string)
	def sigil_u(string,[?l]), do: String.Casing.upcase(string) |> String.graphemes
end

# $ iex
# iex> c "my_sigils.exs"
# iex> import MySigils
# iex> ~l/HELLO/
# "hello"
# iex> ~l/HELLO/l
# ["h", "e", "l", "l", "o"]
# iex> ~u/hello/
# "HELLO"
# iex> ~u/hello/l
# ["H", "E", "L", "L", "O"]