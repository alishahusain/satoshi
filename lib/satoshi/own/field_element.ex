defmodule Satoshi.Own.FieldElement do
  @moduledoc """
  Finite field element struct.
  """

  @enforce_keys [:value, :prime]
  defstruct [:value, :prime]

  def add(%{value: val1, prime: prime}, %{value: val2, prime: prime}) do
    new_value = val1 + val2
      |> rem(prime)

    %__MODULE__{value: new_value, prime: prime}
  end
  def add(_, _), do: raise ArgumentError

  def sub(%{value: val1, prime: prime}, %{value: val2, prime: prime}) do
    new_value = val1 - val2
      |> rem(prime)
      |> abs()

    %__MODULE__{value: new_value, prime: prime}
  end
  def sub(_, _), do: raise ArgumentError

  def mul(%{value: val1, prime: prime}, %{value: val2, prime: prime}) do
    new_value = val1 * val2
      |> rem(prime)
      |> abs()

    %__MODULE__{value: new_value, prime: prime}
  end
  def mul(_, _), do: raise ArgumentError

  def rmul(%{value: val1, prime: prime}, val2) when is_integer(val2) do
    new_value = val1 * val2
      |> rem(prime)
      |> abs()

    %__MODULE__{value: new_value, prime: prime}
  end
  def rmul(_, _), do: raise ArgumentError

  def pow(%{value: val1, prime: prime}, val2) when is_integer(val2) do
    new_value = :math.pow(val1, val2)
      |> round()
      |> rem(prime)
      |> abs()

    %__MODULE__{value: new_value, prime: prime}
  end
  def pow(_, _), do: raise ArgumentError



end
