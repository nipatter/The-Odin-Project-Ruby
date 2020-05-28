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
#   3. [OK] If a lower value symbol is before higher value symbol
#     3.1 [OK] -> subtract low val from high val (IV = 5 - 1 = 4)
#     ? 3.2 -> RULE: only factor of 5 and 10 allowed
#       3.2.1 [OK] => 10 - (5 or 1), 100 - (50 or 10)
#       3.2.2 [OK] => x/5 == 2 || x/1 = 5 || x/1 == 10
#       ? 3.2.3 => ERROR HANDLING: should return error message instead of crashing
#   4. [OK] Sum up all the numbers at the end
#   5. [OK] Return the Arabic sum number

require 'pry'

# TODO: turn this into a class later
SYMBOLS_MAP = { I: 1, V: 5, X: 10, L: 50,
                C: 100, D: 500, M: 1000 }.freeze

def to_arabic(roman)
  num_parts = split_numeral(roman)
  valid_num(num_parts).sum
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
  # status = false
  1.upto(parts.length - 1) do |i|
    left = parts[i - 1]
    right = parts[i]
    next unless left < right

    parts.subtract_and_comb!(i - 1, i) if valid_order?(left, right)
  end
  parts
end

def valid_order?(left, right)
  if right / left == 2 || right / left == 5 || right / left == 10
    # nearest 5 i.e. 10/5 = 2
    # nearest 1 to 5 i.e. 5/1 = 5
    # nearest 1 to 10 i.e. 10/1 = 10
    true
  else
    'false'
  end
end

# new method to subtract and combine elements of an Array
class Array
  def subtract_and_comb!(left, right)
    self[right] = self[right] - self[left]
    delete_at(left)
  end
end

p to_arabic('MD')
