require 'pry'

class CashRegister

    attr_reader :discount
    attr_accessor :items, :total , :last_transaction_amount, :last_transaction_quantity

    def initialize(employee_discount = 0)
        @total = 0
        @discount = employee_discount.to_f
        @items = []
    end  

    def add_item(title, price, quantity = 1)
        quantity.times do
            self.total += price
            self.items << title  
        end 
        self.last_transaction_amount = price * quantity
        self.last_transaction_quantity = quantity
    end 

    def apply_discount
        if self.discount != 0
            decimal_discount = self.discount / 100
            self.total -= (self.total * decimal_discount) 
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    return "There is no discount to apply."
    end 

    def void_last_transaction
        if self.items.empty?
            self.total = 0.0
        end 
        self.total -= self.last_transaction_amount
        self.last_transaction_quantity.times do
            self.items.pop()
        end
    end 
end
