class CashRegister

  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = nil)
    quantity ||= 1
    @total += price * quantity
    quantity.times do
      @items << item
    end

    @last_transaction = price
  end

  def apply_discount
    if @discount
      @total *= (1 - (discount * 0.01))
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end

