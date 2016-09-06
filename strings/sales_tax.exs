defmodule Salestax do
  def apply_taxes(orders, tax_rates) do
    for order <- orders do
      rate = Keyword.get tax_rates, order[:ship_to], 0
      order ++ [total_amount: order[:net_amount] + rate]
    end
  end
end

# tax_rates = [ NC: 0.075, TX: 0.08 ]
# orders = [
#   [ id: 123, ship_to: :NC, net_amount: 100.00 ]
# ]
