defmodule CheckoutCounter do
  @moduledoc """
  Utils for checkout counter
  """

  @doc """
  Gnerates the the net total for the items in the list
  after applying discount rules.
  """
  @spec generate_bill(any()) :: float()
  def generate_bill(item_codes) do
    if Inventory.items_available?(item_codes) do
      {:ok,
       calculate_net_total(item_codes)
       |> Decimal.to_float()}
    else
      {:error, :invalid_items}
    end
  end

  defp calculate_net_total(item_codes) do
    item_codes
    |> Enum.frequencies()
    |> Enum.reduce(Decimal.new(0), fn {item_code, quantity}, total ->
      {:ok, price} = Inventory.get_price(item_code)
      {:ok, net_price} = Discounting.Manager.apply_discount(item_code, price, quantity)

      total =
        net_price
        |> Decimal.from_float()
        |> Decimal.add(total)
        |> Decimal.round(2, :half_up)

      total
    end)
  end
end
