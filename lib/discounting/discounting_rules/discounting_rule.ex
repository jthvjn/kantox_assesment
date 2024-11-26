defmodule Discounting.DiscountingRule do
  @doc """
  Applies a dicounting rule to a product.
  This callback should be implemented for discounts against an item.
  """

  @callback apply(price :: float(), quantity :: non_neg_integer()) ::
              {:ok, float()} | {:error, atom()}
end
