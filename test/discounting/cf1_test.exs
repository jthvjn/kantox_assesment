defmodule Discounting.Cf1Test do
  use ExUnit.Case

  @price 11.23

  alias Discounting.DiscountingRules.Cf1

  test "If the quantity is 3 or more coffees, the price of all coffees should drop to two thirds of the original price." do
    quantity = 5
    expected_price = @price * quantity * 2 / 3

    assert {:ok, expected_price} == Cf1.apply(@price, quantity)
  end

  test "If the quantity is less than 3 coffees, no discount." do
    quantity = 2
    expected_price = @price * quantity

    assert {:ok, expected_price} == Cf1.apply(@price, quantity)
  end

  test "returns invalid error on non integer quantity" do
    assert {:error, :invalid} == Cf1.apply(11.23, 5.5)
  end
end
