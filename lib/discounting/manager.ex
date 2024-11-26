defmodule Discounting.Manager do
  @moduledoc """
  Genserver for discounting.
  """

  use GenServer

  @config %{
    "CF1" => Discounting.DiscountingRules.Cf1,
    "GR1" => Discounting.DiscountingRules.Gr1,
    "SR1" => Discounting.DiscountingRules.Sr1
  }

  ## Public APIs
  @doc """
    Calculate the net price of some quantity of item after applying dicounts.
  """
  @spec apply_discount(String.t(), float(), non_neg_integer()) :: any()
  def apply_discount(item_code, price, quantity) do
    GenServer.call(__MODULE__, {:apply_discount, item_code, price, quantity})
  end

  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  # Callbacks
  @impl true
  def init(_) do
    {:ok, @config}
  end

  @impl true
  def handle_call({:apply_discount, item_code, price, quantity}, _from, state) do
    if Map.has_key?(state, item_code) do
      {:reply, Map.get(state, item_code).apply(price, quantity), state}
    else
      {:reply, {:error, :config_not_found}, state}
    end
  end

  def handle_call(_msg, _from, state) do
    {:reply, {:error, :not_implemented}, state}
  end
end
