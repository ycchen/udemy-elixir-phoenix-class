defmodule Year do
	def is_leap?(year) do
		
		case { rem(year, 4), rem(year, 100), rem(year, 400)} do
			{0, 0, 0} -> true
			{0, 0, _} -> false
			{0, _, 0} -> true
			_ -> false
		end

	end
end