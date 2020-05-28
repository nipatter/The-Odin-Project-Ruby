# frozen_string_literal: true

# ABOUT
# Two methods: one to convert roman => arabic numerals
#              one to convert arabic => roman numerals

# ALGORITHM
#   TO_ROMAN
#   1. [OK] Separate each digit into its place (ones, tens, etc)
#   2. How to figure out what letters to combine to equal num?

#   TO_ARABIC
#   1. [OK] Read each letter
#   2. [OK] Count occurences of each letter
#   3. [OK] If a lower value symbol is before higher value symbol
#     3.1 [OK] -> subtract low val from high val (IV = 5 - 1 = 4)
#     3.2 [NO] -> RULE: only factor of 2, 5, 10 allowed: its not a bug, its a feature
#       3.2.1 [OK] => 10 - (5 or 1), 100 - (50 or 10)
#       3.2.2 [OK] => x/5 == 2 || x/1 = 5 || x/1 == 10
#       3.2.3 [NO] => ERROR HANDLING: should return error message instead of crashing
#   4. [OK] Sum up all the numbers at the end
#   5. [OK] Return the Arabic sum number

# Different numeral writing systems (roman/arabic)
class Numeral
  SYMBOLS_MAP = { I: 1, V: 5, X: 10, L: 50,
                  C: 100, D: 500, M: 1000 }.freeze

  def initialize(numeral)
    @numeral = numeral
  end

  def to_arabic
    num_parts = split_numeral(@numeral)
    num_parts = symbolize(num_parts)
    valid_num(num_parts).sum
  end

  def to_roman
    @numeral = @numeral.to_s if @numeral.is_a? Integer
    digits = split_numeral(@numeral)
    digits = places(digits.reverse)
  end

  def split_numeral(number)
    num_parts = []
    number.chars do |ind|
      num_parts << ind
    end
    num_parts
  end

  def symbolize(num_parts)
    sep = []
    num_parts.each do |char|
      sym = char.to_sym
      sep << SYMBOLS_MAP[sym]
    end
    sep
  end

  def places(num_parts)
    sep = []
    num_parts.each_with_index do |dig, pow|
      sep << dig.to_i * (10**pow)
    end
    sep
  end

  def valid_num(parts)
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
      true
    else
      'false'
    end
  end
end

# new method to subtract and combine elements of an Array
class Array
  def subtract_and_comb!(left, right)
    self[right] = self[right] - self[left]
    self[left] = 0
  end
end

roman_num = Numeral.new('MMMMMMMMDCCXLVII')
p roman_num.to_arabic # => 8747

arab_num = Numeral.new('123')
p arab_num.to_roman # => [3, 20, 100]
