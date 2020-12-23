require_relative 'products'
require_relative 'money_controller'

class UserInterract
    def initialize()
        
        @prod = Products.new
        @mon = Money.new
        while 1
            ask_for_product()
            get_product_price(@selected_product)
            ask_for_money(@product_price)
            give_product(@selected_product)
            @mon.refund_rest(@change)
        end
    end

    def ask_for_product()
        puts "-----------------------------------------"
        puts "\nEnter the product you want to buy:\n " 
        @prod.products.each{|product, attributes| puts "#{product} is #{attributes[1]}PLN and there are #{attributes[0]} left"}
        @selected_product = gets.chomp
        
    end

    def get_product_price(selection)
        if @prod.products.include? selection 
            puts "You have chosen #{selection}, put #{@prod.products[selection][1]} PLN"
            @product_price = @prod.products[selection][1]
        end
    end

    def ask_for_money(product_price)
        @money_put = 0
        coin = gets.chomp
        until @money_put >= product_price
            @money_put += @mon.coins[coin][1]
            @money_put = @money_put.round(2)
            puts "Money put: #{@money_put} PLN"
            @mon.add_coin(coin)
            if @money_put >= product_price
                break
            else  
                coin = gets.chomp
            end
            
        end
        @change = @money_put - product_price
        @change = @change.round(2)
    end

    def give_product(product)
        puts "You can now take #{product}\nWait for the change  -  #{@change} PLN"
        @prod.buy_product(product)
    end


end