# import the text file correctly
# make the program choose a random word at the start of the program
def word_generator
  words = File.readlines('../google-10000-english-no-swears.txt')
  words.sample.chomp
end

def word_convertor(word)
  converted_string = ''
  word.length.times do
    converted_string += '_'
  end
  converted_string
end

def index_finder(letter, word)
  to_change = []
  guess = word.gsub(/#{letter}/, '*')
  if guess.include?('*')
    arr = guess.split('')
    arr.each_with_index do |value, index|
      to_change.push(index) if value == '*'
    end
  end
  to_change
end

def guess(letter, word, converted_string)
  to_change = index_finder(letter, word)
  arr = []
  if to_change.empty? == false
    arr = converted_string.split('')
    to_change.each do |index|
      arr[index] = "#{letter}"
    end
  end
  arr.join('')
end

word = word_generator
converted_string = word_convertor(word)

converted_string = guess('a', word, converted_string)
puts word
puts converted_string
