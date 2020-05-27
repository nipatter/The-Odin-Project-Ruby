# ABOUT
#   Caesar's cipher takes a string and encrypts it by
#   shifting the letters some distance along the alphabet.
#   i.e. a letter shifting scramble. This is my implementation of it.

# ALGORITHM
#   0. Create a new string to store the encrypted result
#   1. Convert letters to ascii numbers
#   2. Categorize numbers as capital or lowercase
#   3. To each add the shift amount to ascii num representation
#   4. For capitals subtract 65 and % 26 to deal with wrapping around
#   5. Concatenate the new letter to the end of encrypted string
#   6. For lowercase subtract 97 and % 26 to deal with wrapping
#   7. Concatenate the new letter to the end of encrypted string
#   8. Add back the 65/97 to bring back to ascii num representation
#   9. If neither capital not lowercase, ignore it
#   10. End with newline

def caesars_cipher(str, shift = 1)
  encrypted_string = ''

  ascii_nums = str.bytes
  ascii_nums.each do |i|
    case i
    when 65..90
      encrypted_string << ((i + shift - 65) % 26 + 65).chr
    when 97..122
      encrypted_string << ((i + shift - 97) % 26 + 97).chr
    else
      encrypted_string << i.chr
    end
  end
  encrypted_string
end

puts caesars_cipher('What a shift!', 5)
