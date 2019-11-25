class CashRegister

    attr_accessor :discount, :total, :items, :transactions

    def initialize discount = 0
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end

    def add_item title, price, quantity = 1
        self.transactions << [price, quantity]
        sum_transactions

        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else
            self.total *= (100 - self.discount).to_f / 100.0
            self.total = self.total.to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.transactions.pop
        sum_transactions
    end

    ###helper###
    def sum_transactions
        self.total = self.transactions.reduce(0) do |memo, transaction|
            memo + (transaction[0] * transaction[1])
        end
    end
end