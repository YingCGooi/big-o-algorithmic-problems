# You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.


def coin_change(coins, amount)
  min_num_of_coins = coin_change_helper(coins, amount)
end

def coin_change_helper(coins, amount, memo={})
  return 0 if amount == 0

  curr_minimums = coins.map do |coin|
    coin_change_helper(coins, amount - coin, memo)
  end
  memo[amount] ||= curr_minimums.min + 1
end

coin_change([1, 2, 5], 11)
# output => 3
# 11 = 5 + 5 + 1

coin_change([2], 3)
# output => -1