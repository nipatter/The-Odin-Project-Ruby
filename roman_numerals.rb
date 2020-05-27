# frozen_string_literal: false

# ABOUT
# Two methods: one to convert roman => arabic numerals
#              one to convert arabic => roman numerals

# ALGORITHM
#   TO_ROMAN
#   1. ???

#   TO_ARABIC
#   1. [OK] Read each letter
#   2. [OK] Count occurences of each letter
#   3. Multiply # of occurences by arabic value (XXX = 3 * 10 = 30)
#   4. If a lower value symbol is before higher value symbol
#     4.1 -> subtract low val from high val (IV = 5 - 1 = 4)
#     4.2 -> RULE: only factor of 5 and 10 allowed
#       4.2.1 => 10 - (5 or 1), 100 - (50 or 10)
#        4.2.2 => x/5 == 2 or x/10 == 10
#       4.2.3 => ERROR HANDLING: should return error message instead of crashing
#   5. Sum up all the numbers at the end
#   6. Return the Arabic sum number

require 'pry'

# For the different nuermal systems
class Numeral
  SYMBOLS_MAP = { I: 1, V: 5, X: 10, L: 50,
                  C: 100, D: 500, M: 1000 }.freeze

  def initialize(roman)
    @roman = roman
  end

  def to_arabic
    # arr = char_count(num) # have a tally of each letter
    # multiplier(arr).sum
    catch_smaller(@rom)
  end

  def letter_to_num(letter)
    symbol = letter.to_sym
    SYMBOLS_MAP[symbol]
  end

  def catch_smaller(str)
    str.chars.each_index do |ind|
      #binding.pry
      if letter_to_num(str[ind]) == letter_to_num(str[ind + 1])
        puts ind
      end
    end
  end

  def subtraction_rule
  end

  def char_count(str)
    sym_counts = {}
    str.each_char do |symb|
      sym_counts.include?(symb) ? sym_counts[symb.to_sym] += 1 : sym_counts[symb.to_sym] = 1
    end
    sym_counts
  end

  def multiplier(hsh)
    letter_sums = []
    hsh.each_pair do |k, v|
      letter_sums << SYMBOLS_MAP[k] * v
    end
    letter_sums
  end

end

rom_num = Numeral.new('XXIV')
puts rom_num.to_arabic
