# CheckoutCounter
  
  `CheckoutCounter.generate_bill/1` generates the the net total for the items in the list after applying discount rules. Discount rules can be updated and recompiled for hot reloading.

  Implement `Discounting.DiscountingRule` for a new discount rule against an item_code and update `Discounting.Manager` config.

  Data is fetched against a dummy `Inventory`.

  `mix deps.get && mix test` to run the test against given cases.
