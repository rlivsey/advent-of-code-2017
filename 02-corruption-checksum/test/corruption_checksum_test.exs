defmodule CorruptionChecksumTest do
  use ExUnit.Case
  doctest CorruptionChecksum

  test "greets the world" do
    assert """
    5 1 9 5
    7 5 3
    2 4 6 8
    """ |> CorruptionChecksum.solve == 18
  end
end
