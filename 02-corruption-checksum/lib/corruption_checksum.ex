defmodule CorruptionChecksum do
  @moduledoc """
  CorruptionChecksum.
  """

  @doc """
  The spreadsheet consists of rows of apparently-random numbers.
  To make sure the recovery process is on the right track, they need you to calculate the spreadsheet's checksum.
  For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.

  For example, given the following spreadsheet:

  5 1 9 5
  7 5 3
  2 4 6 8

  The first row's largest and smallest values are 9 and 1, and their difference is 8.
  The second row's largest and smallest values are 7 and 3, and their difference is 4.
  The third row's difference is 6.

  In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
  """
  def solve(str) when is_binary(str) do
    str
    |> String.trim
    |> String.split("\n")
    |> Enum.map(fn(line) ->
      line
      |> String.split
      |> Enum.map(&String.to_integer/1)
    end)
    |> solve
  end

  def solve(grid) when is_list(grid) do
    grid
    |> Enum.map(&line_checksum/1)
    |> Enum.sum
  end

  defp line_checksum(line) do
    min = Enum.min(line)
    max = Enum.max(line)
    max - min
  end
end
