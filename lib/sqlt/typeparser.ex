defmodule Parser do
    @doc """
    Parses a string.
    """
    @callback parse(String.t) :: {:ok, term} | {:error, String.t}
  
    @doc """
    The return types for inserting
    """
    @callback insert() :: {String.t(), number()}
    @callback multi_insert() :: {String.t(), number()}
  end
  