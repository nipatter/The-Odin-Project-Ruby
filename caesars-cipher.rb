=begin
Caesar's cipher takes a string and encrypts it by
shifting the letters some distance along the alphabet.
i.e. a letter shifting scrable. This is my implementation of it.
=end

require "pry" # see how much faith I have in myself

# TODO Get string from user to encrypt

def caesars_cipher(str, shift = 1)

  # Convert the string to a list of letters and
  # Map each letter in the alphabet to a number (.byte -> ASCII encoding)
  # Convert the listed letters to numbers
  ascii_nums = str.bytes

  # Parse the string for upper/lowercase letters
  # Going letter by letter along the string length 
  for i in 0...ascii_nums.length
    
    if ascii_nums[i].between?(65, 90)
      # handle capital letters
      # Algorithm: shift the letter:num by an amount, then
      #   reduce it so that we count from 0 (A = 0), then
      #   get the remainder dividing my 26 (# letters in alphabet) so
      #   that we handle wrapping around to the beginning, then
      #   convert back to ASCII encoding by adding back 65.
      new_num = (ascii_nums[i] + shift - 65) % 26 + 65
      print new_num.chr
      
    elsif ascii_nums[i].between?(97, 122)
      # handle lower case letters
      new_num = (ascii_nums[i] + shift - 97) % 26 + 97
      print new_num.chr

    else
      # ignore punctuation and spacing
      print ascii_nums[i].chr
    end
  end
  print "\n"
end

caesars_cipher("What a string!", 5)