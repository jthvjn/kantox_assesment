defmodule Discounting.DiscountingRules.Gr1Test do
  use ExUnit.Case

  @price 3.11
  alias Discounting.DiscountingRules.Gr1

  test "applies buy-one-get-one-free, even number as quantity" do
    quantity = 6
    expected_price = @price * quantity / 2
    assert {:ok, expected_price} == Gr1.apply(@price, quantity)
  end

  test "applies buy-one-get-one-free, odd number as quantity" do
    quantity = 5
    expected_price = @price * 2 + @price
    assert {:ok, expected_price} == Gr1.apply(@price, quantity)
  end

  test "returns invalid error on non integer quantity" do
    assert {:error, :invalid} == Gr1.apply(@price, 5.5)
  end
end
