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

def uses_available_letters?(input, letters_in_hand)
  hand_copy = letters_in_hand.clone
  input_array = input.chars
  input_array.each do |char|
    index = hand_copy.index(char)
    if !index || !hand_copy.delete_at(index)
      return false
    end
  end
  return true
end


# 3
def score_word(word)
  letter_array = word.upcase.split(//)
  word_score = 0
  letter_array.each do |each_letter|
    case each_letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      word_score += 1
    when "D","G"
      word_score += 2
    when "B","C","M","P"
      word_score += 3
    when "F","H","V","W","Y"
      word_score += 4
    when "K"
      word_score += 5
    when "J", "X"
      word_score += 8
    when "Q","Z"
      word_score += 10
    end
  end
  if letter_array.length > 6
    word_score += 8
  end
  return  word_score
end

#4
def highest_score_from(words)
  words_and_scores = words.map do |word|
    {word: word, score: score_word(word)}
  end
  p words_and_scores

  word_value = []
  words_and_scores.each do |hash|
    if word_value.empty?
      word_value << hash
    elsif hash[:score] > word_value[0][:score]
      word_value.clear
      word_value << hash
    elsif hash[:score] == word_value[0][:score]
      word_value << hash
    end
  end

  p "word value", word_value

  if word_value.length == 1
    return word_value[0]
  end

  finalists = word_value

  min_length = 10
  winner_word = {}
  finalists.each do |hash|
    if hash[:word].length == 10
      return hash
    elsif hash[:word].length < min_length
      min_length = hash[:word].length
      winner_word = hash
    end
    return winner_word
  end
end



words = ['BBBBBB', 'AAAAAAAAAA']

p highest_score_from(words)