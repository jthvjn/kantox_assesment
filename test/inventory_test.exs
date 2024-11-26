defmodule InventoryTest do
  use ExUnit.Case

  test "items_available?/1, returns true on valid item codes" do
    assert Inventory.items_available?(["CF1"])
  end

  test "items_available?/1, returns false on valid item codes" do
    refute Inventory.items_available?(["CF2"])
  end

  test "get_price/1, return price of the item if valid" do
    assert {:ok, 11.23} == Inventory.get_price("CF1")
  end

  test "get_price/1, errors if item is invalid" do
    assert {:error, :invalid} == Inventory.get_price("CF2")
  end
end
