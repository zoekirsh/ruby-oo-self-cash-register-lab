require 'pry'

class CashRegister

    attr_reader :discount
    attr_accessor :total, :cart, :prices, :last_quantity



    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @prices = []
        @last_quantity = 0
    end

    def add_item (item, price, quantity = 1)
        quantity.times { self.cart << item}
        self.prices << price 
        @last_quantity = quantity
        self.total += (price.to_f * quantity) 
    end

    def apply_discount
        ###Tried to clean it up... didnt work lol###
        # self.discount == 0 ? "There is no discount to apply" : 
        #     self.total -= (self.total * (self.discount.to_f / 100))
        #     "After the discount, the total comes to $#{self.total.to_i}."

        if self.discount == 0 
            "There is no discount to apply."
        
        else 
            discount_helper = self.discount.to_f / 100
            self.total -= (self.total * discount_helper)
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def items
        self.cart
    end

    def void_last_transaction

        self.total -= (self.prices[-1]* @last_quantity)
        
    end


end
