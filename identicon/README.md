# Identicon

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `identicon` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:identicon, "~> 0.1.0"}]
    end
    ```

  2. Ensure `identicon` is started before your application:

    ```elixir
    def application do
      [applications: [:identicon]]
    end
    ```

## Project Overview: Generate Identicon image like in github account profile image

#### Identicon is formed by 250px x 250px, 5X5 grid of squares, each 50px tall and wide. Same user identicon will not get duplicate.

Regenerate same Identicon.

String -> Identicon Generator -> Image


String -> Compute MD5 hash of string -> List of numbers based on the string -> Pick color
-> Build grid of squares -> Convert grid into image -> Save image


iex(1)> hash = :crypto.hash(:md5,"banana")
<<114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239,
  239, 124, 65>>
iex(2)> Base.encode16(hash)
"72B302BF297A228A75730123EFEF7C41"
iex(3)> :binary.bin_to_list(hash)
[114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239,
 239, 124, 65]


## create \lib\image.ex
ex(11)> %Identicon.Image{}
%Identicon.Image{hex: nil}
iex(12)> %Identicon.Image{hex: []}
%Identicon.Image{hex: []}

ex(14)> Identicon.main("asdf")
%Identicon.Image{hex: [145, 46, 200, 3, 178, 206, 73, 228,
  165, 65, 6, 141, 73, 90, 181, 112]}

## Build Grid

ex(27)> image = Identicon.main("asdf")
%Identicon.Image{color: {145, 46, 200},
 hex: [145, 46, 200, 3, 178, 206, 73, 228, 165, 65, 6, 141, 73, 90, 181, 112]}
iex(28)> %Identicon.Image{hex: hex} = image
%Identicon.Image{color: {145, 46, 200},
 hex: [145, 46, 200, 3, 178, 206, 73, 228, 165, 65, 6, 141, 73, 90, 181, 112]}
iex(29)> hex
[145, 46, 200, 3, 178, 206, 73, 228, 165, 65, 6, 141, 73, 90, 181, 112]
iex(30)> Enum.chunk(hex,3)
[[145, 46, 200], [3, 178, 206], [73, 228, 165], [65, 6, 141], [73, 90, 181]]

x: rem(index, 5)* 50 = 100
y: div(index, 5) *50 = 50


