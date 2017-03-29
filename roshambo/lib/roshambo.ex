defmodule Roshambo do
  @moduledoc """
  Documentation for Roshambo.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Roshambo.hello
      :world

  """
  def main([]) do
    IO.puts("Please provide a value of 'rock', 'paper', or 'scissors'")
  end
  def main(argv) do
    # IO.inspect(argv)
    # player_move = List.first(argv)
    # IO.puts("You played #{player_move}")
    # play(player_move)
    # parse_args(argv)
    argv
    |> parse_args
    |> determine_winner
    |> IO.puts

  end

  defp parse_args(argv) do
    switches = [rock: :boolean, paper: :boolean, scissors: :boolean]
    parse = OptionParser.parse(argv, switches: switches)
    case parse do
      {[{switch, true}], [player_move], _} ->
        {to_string(switch), player_move}
      {_, [player_move], _} ->
        {get_comp_move, player_move}
    end
  end
  defp play(player_move) do
    get_comp_move
    |> determine_winner(player_move)
    |> IO.puts
    # IO.puts(determine_winner(comp_move, player_move))
  end
  defp get_comp_move do
    Enum.random(["rock", "paper", "scissors"])
  end
  defp determine_winner({"paper", "rock"}) do
    "You lost, computer played paper"
  end
  defp determine_winner({"rock", "scissors"}) do
    "You lost, computer played rock"
  end
  defp determine_winner({"scissors", "paper"}) do
    "You lost, computer played scissors"
  end

  defp determine_winner({comp_move, player_move}) when comp_move == player_move do
    "It was a tie - you both played #{comp_move}"
  end
  defp determine_winner({comp_move, _}) do
    "You win! Computer played #{comp_move}"
  end
end
