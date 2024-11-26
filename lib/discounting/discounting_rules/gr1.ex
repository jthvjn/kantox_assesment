defmodule Discounting.DiscountingRules.Gr1 do
  @moduledoc """
  buy-one-get-one-free
  """
  @behaviour Discounting.DiscountingRule
  def apply(price, quantity) when quantity == 1 do
    {:ok, price * quantity}
  end

  def apply(price, quantity) when is_integer(quantity) do
    {:ok, price * floor(quantity / 2) + rem(quantity, 2) * price}
  end

  def apply(_price, _quantity) do
    {:error, :invalid}
  end
end
