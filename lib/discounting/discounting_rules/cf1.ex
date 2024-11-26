defmodule Discounting.DiscountingRules.Cf1 do
  @moduledoc """
  If you buy 3 or more coffees, the price of all coffees should drop
  to two thirds of the original price.
  """
  @behaviour Discounting.DiscountingRule

  @impl true
  def apply(price, quantity) when is_integer(quantity) and quantity >= 3 do
    {:ok, price * quantity * 2 / 3}
  end

  def apply(price, quantity) when is_integer(quantity) do
    {:ok, price * quantity}
  end

  def apply(_price, _quantity) do
    {:error, :invalid}
  end
end
