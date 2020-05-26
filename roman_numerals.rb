=begin
ABOUT
Two methods: one to convert roman => arabic numerals
             one to convert arabic => roman numerals

ALGORITHM
  TO_ROMAN
  1. ???

  TO_ARABIC
  1. OK: Read each letter
  2. OK: Count occurences of each letter
  3. OK: Multiply # of occurences by arabic value (XXX = 3 * 10 = 30)
  4. If a lower value symbol is before higher value symbol
    4.1 -> subtract low val from high val (IV = 5 - 1 = 4)
    4.2 -> RULE: only the sequentially lower number is allowed
      4.2.1 => OK: IV = 4, OK: XL (50 - 10 = 40), NOT OK: IC =/= 100 - 1 = 99 
                                                  (proper: XCIX = 100 - 10 + 10 - 1 = 99)
      4.2.2 => EXCEPTION: for I and X (IX = 9)
      4.2.3 => ERROR HANDLING: should return error message instead of crashing
  5. Sum up all the numbers at the end
  6. Return the Arabic sum number
=end


class Numeral

  def initialize(num)
    @num = num
  end

  SYMBOLS_MAP = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, 
                "C" => 100, "D" => 500, "M" => 1000}

  def to_arabic
    subtraction_rule(@num)
    # c = char_count(@num)
    # s = multiplier(c)
    # s.sum
  end
            
  def char_count(str)
    sym_counter = Hash.new
    str.each_char do |symb|
      sym_counter.include?(symb) ? sym_counter[symb] += 1 : sym_counter[symb] = 1
    end
    sym_counter
  end

  def multiplier(hsh)
    letter_sums = Array.new
    hsh.each_pair do |k, v|
      letter_sums << SYMBOLS_MAP[k] * v
    end
    letter_sums
  end

  def subtraction_rule(str)
    1.upto(str.length - 1) do |i|
      puts str[i]
    end
    # if symb LHS < symb RHS
    #   -> RHS - LHS
    # if symb LHS << symb RHS
    #   -> Invalid number: subtraction of next nearest symbols only
    # except! I and X subtraction is allowed, and XC, and CM.....
  end

end

n = Numeral.new("XXVI")
puts n.to_arabic