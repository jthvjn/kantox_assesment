defmodule Discounting.ManagerTest do
  use ExUnit.Case

  alias Discounting.Manager

  test "apply_discount/3 returns the discounted price for the item" do
    assert {:ok, 1.0} == Manager.apply_discount("CF1", 1.0, 1)
  end

  test "apply_discount/3 returns `{:error, :config_not_found}` if not discount config is added" do
    assert {:error, :config_not_found} == Manager.apply_discount("BF1", 1.0, 1)
  end
end
