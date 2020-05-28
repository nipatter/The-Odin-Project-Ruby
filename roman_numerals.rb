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

# TODO: turn this into a class later
# TODO: turn this into a bunch of functions later
SYMBOLS_MAP = { I: 1, V: 5, X: 10, L: 50,
                C: 100, D: 500, M: 1000 }.freeze

def to_arabic(roman)
  num_parts = split_numeral(roman)
  valid_num?(num_parts) ? puts 'ok' : 'Invalid syntax given.'
  #num_parts = subtraction_rule(num_parts)
end

def split_numeral(roman)
  # first function should split the string up
  arabic_parts = []
  roman.chars.each_index do |ind|
    sym = roman[ind].to_sym
    arabic_parts << SYMBOLS_MAP[sym]
  end
  arabic_parts
end

def valid_num(parts)
  # check that if a lower number before higher
  # that it is 2 or 10x lower (XV, IX, DC, etc)
  status = false
  1.upto(parts.length - 1) do |i|
    left = parts[i - 1]
    right = parts[i]
    next unless left < right

    # somewhere here you need to handle merging two
    # items to subtract into 1
    # or make them call a method
    status = order_logic(left, right)
  end
  status
end

def order_logic(lef, rht)
  if rht / lef == 2 || rht / lef == 5 || rht / lef == 10
    # nearest 5 i.e. 10/5 = 2
    # nearest 1 to 5 i.e. 5/1 = 5
    # nearest 1 to 10 i.e. 10/1 = 10
    subtraction_rule(lef, rht)
  else
    false
  end
end

def subtraction_rule(low_sym, high_sym)
  # subtract valid lesser left num from right num (IV = 5 - 1 = 4)
  high_sym - low_sym
end



  # fourth function is the multiplier

  # fifth function is the adder



p to_arabic('XXIX')
