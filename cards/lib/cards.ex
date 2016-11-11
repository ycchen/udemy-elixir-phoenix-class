defmodule Cards do

	@moduledoc """
		Provides methods for creating and handing a deck of cards
	"""

	@doc """
		Returns a list of strings representing a deck of playing cards
	"""
	def create_deck do
		values = ["Ace", "Two", "Three", "Four", "Five"]
		suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

		# list of comprehension
		# every element in suits do this block
		# comprehension is a mapping function
		# the code below returns an array
		for suit <- suits, value <- values do
			"#{value} of #{suit}"
		end

		# if we use 2 comprehension loop, it will return array of array, then we need to flatten it
		# cards = for value <- values do
		# 	for suit <- suits do
		# 		"#{value} of #{suit}"
		# 	end
		# end
		# List.flatten(cards)
	end

	def shuffle(deck) do
		Enum.shuffle(deck)
	end
	@doc """
		Determines whether a deck contains a given card

	## Examples

		iex> deck = Cards.create_deck
		iex> Cards.contains?(deck, "Ace of Spades")
		true
	"""
	def contains?(deck,card) do
		Enum.member?(deck, card)
	end

	@doc """
		Divides a deck into a hand and the remainder of the deck.
		The `hand_size` argument indicates how many cards should be in the hand.

	## Examples

		iex> deck = Cards.create_deck
		iex> {hand, deck} = Cards.deal(deck,1)
		iex> hand
		["Ace of Spades"]		
	"""
	def deal(deck, hand_size) do
		# split returns a tuple {[hand_size of cards], [remain cards]}
		# tuple: can be complete different type of data or format
		# list: is smiliar type of data 
		Enum.split(deck, hand_size)
	end

	def save(deck, filename) do
		# encode the deck and turns to binary
		binary = :erlang.term_to_binary(deck)
		File.write(filename, binary)
	end

	def load(filename) do
		# {status, binary} = File.read(filename)
		# case status do
		# 	:ok -> :erlang.binary_to_term(binary)
		# 	:error -> "That file does not exists"
		# end

		case File.read(filename) do
			{:ok, binary} -> :erlang.binary_to_term binary
			# {:error, reason} -> "That file does not exist"
			# by doing _ is to tell Elixir that we don't want to use this variable, so don't compliant
			{:error, _reason} -> "That file does not exist"
		end
	end

	def create_hand(hand_size) do
		Cards.create_deck
		|> Cards.shuffle
		|> Cards.deal(hand_size)
	end

end
