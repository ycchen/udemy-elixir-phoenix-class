# Cards

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `cards` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:cards, "~> 0.1.0"}]
    end
    ```

  2. Ensure `cards` is started before your application:

    ```elixir
    def application do
      [applications: [:cards]]
    end
    ```

## how to create a project

$ mix new cards

* create_deck: create an array of playing cards

* shuffle: Shuffle an array of playing card

* deal: create a "hand" of cards

* contains?: Given a deck and a sigle card, figure out if the cards is in the deck

* save: Save a collection of cards to a file on the local machine

* load: Load a collection of cards from the local machine

## how to run our project

$ iex -S mix

> Cards

> Cards.hello
"Hi there!"

* iex shell does not auto reload when the files got change, so we can use recompile to reload the entire project within iex shell without exit out

added create_deck method

> recompile

added shuffle method


* When calling Cards.shuffle() you will get and error of Cards.shuffle/0 is undefined. Did you mean on of shuffle/1
 -- This is because we only defined shuffle method that take one argument.

* If you call Cards.shuffle([], []), you will get an error of Cards.shuffle/2 is undefined. (arity)

add deal method

iex(31)> deck = Cards.create_deck
["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
 "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
 "Four of Clubs", "Five of Clubs", "Ace of Hearts", "Two of Hearts",
 "Three of Hearts", "Four of Hearts", "Five of Hearts", "Ace of Diamonds",
 "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]
iex(32)> Cards.deal(deck, 5)
{["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
  "Five of Spades"],
 ["Ace of Clubs", "Two of Clubs", "Three of Clubs", "Four of Clubs",
  "Five of Clubs", "Ace of Hearts", "Two of Hearts", "Three of Hearts",
  "Four of Hearts", "Five of Hearts", "Ace of Diamonds", "Two of Diamonds",
  "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]}

  * this returns a tuple {[],[]}

  ** Patern matching: is Elixir for replacement variable arragnment

  > {hand, remain} =  Cards.deal(deck, 5)

> {hand, reset_of_deck} = Cards.deal(deck, 5)

> Cards.save(deck, 'my_deck')

> File.read("my_deck")
=>
{:ok,
 <<131, 108, 0, 0, 0, 20, 109, 0, 0, 0, 13, 65, 99, 101,
   32, 111, 102, 32, 83, 112, 97, 100, 101, 115, 109, 0, 0,
   0, 13, 84, 119, 111, 32, 111, 102, 32, 83, 112, 97, 100,
   101, 115, 109, 0, 0, 0, 15, 84, 104, ...>>}
> {status, binary} = File.read("my_deck")

iex(50)> :erlang.binary_to_term(binary)
["Ace of Spades", "Two of Spades", "Three of Spades",
 "Four of Spades", "Five of Spades", "Ace of Clubs",
 "Two of Clubs", "Three of Clubs", "Four of Clubs",
 "Five of Clubs", "Ace of Hearts", "Two of Hearts",
 "Three of Hearts", "Four of Hearts", "Five of Hearts",
 "Ace of Diamonds", "Two of Diamonds", "Three of Diamonds",
 "Four of Diamonds", "Five of Diamonds"]


:ok, :error are called atom: it handle status, atom is like a string

> deck = Cards.create_deck

> shuffle_deck = Cards.shuffle(deck)

> Cards.deal(shuffle_deck, 5)

> Cards.create_hand(5)
{["Ace of Spades", "Three of Diamonds", "Four of Diamonds", "Three of Clubs",
  "Three of Spades"],
 ["Four of Hearts", "Five of Diamonds", "Five of Clubs", "Five of Hearts",
  "Three of Hearts", "Four of Spades", "Ace of Diamonds", "Two of Diamonds",
  "Two of Hearts", "Two of Spades", "Five of Spades", "Ace of Hearts",
  "Two of Clubs", "Ace of Clubs", "Four of Clubs"]}

** Adding documentation

1. add ex_doc to generate html documentation

- module documentation:

Add following code under the module of Cards
  @moduledoc """
    Provides methods for creating and handing a deck of cards
  """

> mix docs  # this will generate html documentation

- function documentation: individual function do
  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

    iex> deck = Cards.create_deck
    iex> {hand, deck} = Cards.deal(deck,1)
    iex> hand
    ["Ace of Spades"]   
  """
> mix docs 


** Writing test

\\ test/test_help.exs : it's for global setting for the test


** What is doctest?

-- The example within our doc will be assert while test is running.

** What is case test?

-- Test blocks within the test/module_test.exs file


## Data Structure

Map: Maps are collection of key value pairs 
Ruby: Hash == Elixir : Map

> colors = %{primary: "red"}

> colors = %{primary: "red", secondary: "blue"}

> colors.secondary
"blue"

> %{secondary: secondary_color} = colors

> secondary_color
"blue"

## How to update a value inside of a Map

> colors = %{primary: "red"}
# using function to update a value

> Map.put(color, :primary, "blue")
%{primary: "blue"}

>colors
%{primary: "red"}

> %{ colors | primary: "blue"}
%{primary: "blue"}

> Map.put(colors, :secondary_color, "green")
%{primary: "red", secondary_color: "green"}

### Keyword List: list like an array

> colors = [{:primary, "red"}, {:secondary, "green"}]
[primary: "red", secondary: "green"]

> colors[:primary]
"red"

> colors = [primary: "read", secondary: "green"]
[primary: "red", secondary: "green"]

> colors = %{primary: "red", primary: "blue"}
%{primary: "blue"}

--- ECTO Query Example
> query = User.find_where([where: user.age > 10, where: user.subscribed == true])



##### Next Project focus on Elixir Syntax


