defmodule SqltTest do
  use ExUnit.Case
  doctest Sqlt

  test "greets the world" do
    assert Sqlt.hello() == :world
  end
end
