defmodule Discounting.DiscountingRule do
  @doc """
  Applies a dicounting rule to a product.
  """
  @callback apply(price :: float(), quantity :: non_neg_integer()) ::
              {:ok, float()} | {:error, atom()}
end
