defmodule Rec do
def myfunc([head | tail]) do
	# we have head and tail
end

def myfunc([]) do
	# we have empty list
	0
end
# myfunc([1,2,3,4,5])

def sum_no_tail([]) do
	0
end

def sum_no_tail([head | tail]) do
	IO.inspect(head)
	head + sum_no_tail(tail)
end

# sum_no_tail([1,2,3,4,5]) #15
end