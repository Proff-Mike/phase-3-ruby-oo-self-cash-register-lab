

class CashRegister

  attr_accessor :discount, :total, :item_history, :current_transaction

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @item_history = []
  end

  def add_item(item, price, amount=1)
    self.current_transaction = price * amount
    self.total += self.current_transaction
    amount.times {self.item_history << item}
  end

  def apply_discount
    if self.discount
      self.total -= self.total * self.discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    self.item_history
  end 

  def void_last_transaction
    self.total -= self.current_transaction
  end 

end 
