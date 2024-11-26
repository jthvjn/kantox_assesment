defmodule Discounting.DiscountingRules.Sr1 do
  @moduledoc """
  If you buy 3 or more strawberries, the price should drop to £4.50
  per strawberry.
  """
  @behaviour Discounting.DiscountingRule

  @discounted_price 4.5
  def apply(_price, quantity) when is_integer(quantity) and quantity >= 3 do
    {:ok, @discounted_price * quantity}
  end

  def apply(price, quantity) when is_integer(quantity) do
    {:ok, price * quantity}
  end

  def apply(_price, _quantity) do
    {:error, :invalid}
  end
end
