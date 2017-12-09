defmodule InverseCaptcha do
  @moduledoc """
  InverseCaptcha.
  """

  @doc """
  The captcha requires you to review a sequence of digits (your puzzle input)
  and find  the sum of all digits that match the next digit in the list.
  The list is circular, so the digit after the last digit is the first digit in the list.

  1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
  1111 produces 4 because each digit (all 1) matches the next.
  1234 produces 0 because no digit matches the next.
  91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

  ## Examples

      iex> InverseCaptcha.solve 1122
      3

      iex> InverseCaptcha.solve 1111
      4

      iex> InverseCaptcha.solve 1234
      0

      iex> InverseCaptcha.solve 91212129
      9
  """
  def solve(num) when is_integer(num) do
    num
    |> Integer.digits
    |> solve
  end

  def solve(digits) when is_list(digits) do
    digits
    |> Enum.with_index
    |> Enum.reduce(0, fn({num, index}, total) ->
      if num == wrapped_next(digits, index) do
        total + num
      else
        total
      end
    end)
  end

  defp wrapped_next(digits, index) do
    Enum.at(digits, index + 1, List.first(digits))
  end
end
