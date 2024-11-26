defmodule CheckoutCounterTest do
  use ExUnit.Case

  test "generate_bill/1, returns net total after discounting" do
    assert {:ok, 22.45} == CheckoutCounter.generate_bill(["GR1", "SR1", "GR1", "GR1", "CF1"])
    assert {:ok, 3.11} == CheckoutCounter.generate_bill(["GR1", "GR1"])
    assert {:ok, 16.61} == CheckoutCounter.generate_bill(["SR1", "SR1", "GR1", "SR1"])
    assert {:ok, 30.57} == CheckoutCounter.generate_bill(["GR1", "CF1", "SR1", "CF1", "CF1"])
    assert {:ok, 0} == CheckoutCounter.generate_bill([])
  end

  test "generate_bill/1, on invalid item codes" do
    assert {:error, :invalid_items} == CheckoutCounter.generate_bill(["SS1"])
  end
end
