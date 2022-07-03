# import the text file correctly
# make the program choose a random word at the start of the program
def word_generator
  words = File.readlines('../google-10000-english-no-swears.txt')
  words.sample.chomp
end

def word_convertor(word)
  converted_string = ''
  word.length.times do
    converted_string += ' _ '
  end
  converted_string
end

def index_finder(letter, word)
  to_change = []
  guess = word.gsub(/#{letter}/, '*')
  if guess.include?('*')
    arr = guess.split('')
    print arr
    arr.each_with_index do |value, index|
      if value == "*"
        to_change.push(index)
      end
    end
    to_change
  end
end

word = word_generator
converted_string = word_convertor(word)

def guess(letter, word, _converted_string)
  print index_finder(letter, word)
end

guess('a', word, converted_string)
