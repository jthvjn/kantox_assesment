defmodule Inventory do
  @moduledoc """
  Inventory for dummy purpose.
  """

  @inventory %{
    "CF1" => 11.23,
    "GR1" => 3.11,
    "SR1" => 5.00
  }

  @spec items_available?(list()) :: true
  def items_available?(item_codes), do: Enum.all?(item_codes, &Map.has_key?(@inventory, &1))

  @spec get_price(String.t()) :: {:ok, float()} | {:error, :invalid}
  def get_price(item_code) do
    if items_available?([item_code]) do
      {:ok, @inventory[item_code]}
    else
      {:error, :invalid}
    end
  end
end
