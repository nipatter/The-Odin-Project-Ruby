=begin 
ABOUT
Implement a method called #stock_picker that
takes an array of stock prices for each day.
It returns a pair of days:
  1. the best to buy
  2. the best to sell
Day indexing starts from 0.
Restriction: You need to buy before selling.
  No shorting allowed

ALGORITHM
1. Sort the prices into descending order
1.5 Loop body
2. Subset the prices array from [0] to [prices.index(desc[0])]
3. Guess1 = desc[0] - price0.min
4. Subset the prices array from [1] to [prices.index(desc[1])]
5. Guess2 = desc[1] - price1.min
6. Is Guess2 < Guess1?
    yes -> return [price0.min, desc[0]]
    no -> keep looping, now with desc[2] <=> desc[1] 
=end 

def stock_picker(days)
  buy_sell_days = Array.new

  desc_days = days.sort.reverse

  desc_days.each_with_index { |val, ind| 
    sub_prices_A = days[0..ind]
    guess_A = val - sub_prices_A.min

    sub_prices_B = days[0..(ind + 1)]
    guess_B = days[ind + 1] - sub_prices_B.min

    if guess_B < guess_A
      buy_sell_days << days.index(sub_prices_A.min)
      buy_sell_days << days.index(val)
      break
    end
  }
  buy_sell_days
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect