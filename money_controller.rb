class Money

    def initialize()
        #[quantity, value of a coin in PLN]
        @coins = {
            "2zł"   => [20, 2],
            "1zł"   => [20, 1],
            "50gr"  => [20, 0.5],
            "20gr"  => [20, 0.2],
            "10gr"  => [20, 0.1],
            "5gr"   => [20, 0.05],
            "2gr"   => [20, 0.02],
            "1gr"   => [20, 0.01]
        }
    end

    attr_reader :coins

    def refund_rest(change)
        @return_change = []

        while change > 0
            coin_to_give = @coins.find{|coin, attributes| attributes[1] <= change && attributes[0] > 0 }[0]
            puts "Coin: #{coin_to_give}"
            get_coin(coin_to_give)
            @return_change << coin_to_give
            change -= @coins[coin_to_give][1]
            change = change.round(2)        
        end
        puts "End of change."

    end

    def add_coin(coin)
        @coins[coin][0] += 1
    end

    def get_coin(coin)
        @coins[coin][0] -= 1
    end

end