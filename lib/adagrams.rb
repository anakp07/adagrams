#### TEST ONE ####
def draw_letters
  letter_distribution = {
      A: 9,
      B: 2,
      C: 2,
      D: 4,
      E: 12,
      F: 2,
      G: 3,
      H: 2,
      I: 9,
      J: 1,
      K: 1,
      L: 4,
      M: 2,
      N: 6,
      O: 8,
      P: 2,
      Q: 1,
      R: 6,
      S: 4,
      T: 6,
      U: 4,
      V: 2,
      W: 2,
      X: 1,
      Y: 2,
      Z: 1
  }
  letter_pool = []
  letter_distribution.each do |letter, number|
    number.times do
      letter_pool << letter.to_s
    end
  end
  letters_in_hand = letter_pool.sample(10)
  return letters_in_hand
end


###TEST TWO ###

def uses_available_letters?(input, letters_in_hand)
  input.upcase!
  input_array = input.chars
  is_char_valid = true
  input_array.each do |char|
    index = letters_in_hand.index(char)
    if !index || !letters_in_hand.delete_at(index)
      is_char_valid = false
    end
  end
  return is_char_valid
end


# draw_letters = ["N", "E", "O", "K", "Y", "I", "O", "V", "N", "I"]
# p draw_letters
# input = "q"
# p input
#
# p user_available_letters?(input, draw_letters)




# def uses_available_letters?(input, letters_in_hand)
#   input.upcase!
#   input_array = input.chars
#   is_char_valid = false
#   input_array.each do |char|
#     index = letters_in_hand.index(char)
#     if index && letters_in_hand.delete_at(index)
#       is_char_valid = true
#     end
#   end
#   return is_char_valid
# end


