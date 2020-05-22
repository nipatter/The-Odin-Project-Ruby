=begin About
Implement a method #substrings that takes:
  arg1: a word
  arg2: an array of substrings
and returns a hash listing each substring found in the word
and how many times it was found.
You don't need to worry about case sensitivity,
but you do need to handle multiple words in a sentence
=end

=begin Algorithm
1. [OK] Create a list of substring words (use default from TOP)
2. [OK] Split the sentence into words
3. [OK] Create an empty dictionary to store the results 
4. [OK] Check if the word exists in substring list
    [OK] Check for the subwords as well
5. [OK] If it does create a new key in the dictionary or
    [OK] if the key exists then increment the value by 1
6. [OK] Print the hash  
=end

require "pry"

keywords = ["below","down","go","going","horn","how","howdy",
  "it","i","low","own","part","partner","sit"]

## My inelegant but working solution.
def substrings(sentence, keywords)
  tracker = Hash.new

  words = sentence.downcase.split(" ")
  for key in keywords
    for word in words
      if word.include? key
        if tracker.include? key
          tracker[key] += 1
        else
          tracker[key] = 1
        end
      end
    end
  end
  puts tracker 
end

substrings("Howdy partner, sit down! How's it going?", keywords)