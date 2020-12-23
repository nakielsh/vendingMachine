
class Products

    def initialize()
        #[quantity, price in PLN]
        @products = {
            "Snickers"  => [20, 3],
            "CocaCola"  => [20, 5],
            "3Bit"      => [20, 2.5],
            "Doritos"   => [20, 4.49],
            "Water"      => [20, 1.25],
            "Mars"      => [20, 2.5],
            "Sprite"    => [20, 4],
            "Coffee"      => [20, 5.5]
            }
    end


    attr_reader :products

    def buy_product(product)
        @products[product][0] -=1
        @products[product][1]
    end
    
end
