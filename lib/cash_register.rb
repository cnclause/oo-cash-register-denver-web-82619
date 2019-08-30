class CashRegister  
    attr_accessor :total, :discount, :items, :last_price

    @@all = []

    def initialize (discount = 0)
        @total = 0  
        @discount = discount 
        @items = []
        @@all << self
        @last_price = 0
    end 

  
    def add_item (title, price, quantity=1) 
        quantity.times do 
            items.push(title)
        end
         self.total += price * quantity 
         self.last_price = quantity * price 

     
    end

    def discount 
        @discount 
    end

    def apply_discount 
        if self.discount > 0 
            discount_percentage = self.discount/100.to_f
            self.total = self.total - (self.total * (discount_percentage))
            "After the discount, the total comes to $#{total.to_i}."
        else 
            "There is no discount to apply."
        end 
    end 

    def void_last_transaction 
        self.total = self.total - self.last_price 
    end 


end 
