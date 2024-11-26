defmodule Discounting.Cf1Test do
  use ExUnit.Case

  alias Discounting.DiscountingRules.Cf1

  test "If the quantity is 3 or more coffees, the price of all coffees should drop to two thirds of the original price." do
    expected_price = 11.23 * 5 * 2 / 3

    assert {:ok, expected_price} == Cf1.apply(11.23, 5)
  end

  test "If the quantity is less than 3 coffees, no discount." do
    expected_price = 11.23 * 5 * 2 / 3

    assert {:ok, expected_price} == Cf1.apply(11.23, 5)
  end
end
