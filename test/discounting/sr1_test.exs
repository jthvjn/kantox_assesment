defmodule Discounting.Sr1Test do
  use ExUnit.Case

  alias Discounting.DiscountingRules.Sr1

  @price 5.00
  @discounted_price 4.5

  test "applies discounted price on buying 3 or more" do
    quantity = 5
    expected_price = @discounted_price * quantity

    assert {:ok, expected_price} == Sr1.apply(@price, quantity)
  end

  test "no discount" do
    quantity = 2
    expected_price = @price * quantity

    assert {:ok, expected_price} == Sr1.apply(@price, quantity)
  end

  test "returns invalid error on non integer quantity" do
    assert {:error, :invalid} == Sr1.apply(@price, 5.5)
  end
end
