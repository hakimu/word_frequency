# Read a file.  1. Count the word frequency. 2. Find out the top 10 words.

def word_frequency(text_from_file)
  words = parse_punctuation(text_from_file)
  words_array = words.split(" ")
  word_hash = {}
  words_array.each do |word|
    if word_hash.has_key?(word)
      word_hash[word] += 1
    else
      word_hash[word] = 1
    end
  end
  word_hash
end

def parse_punctuation(text)
  text.gsub(/[\.\?!:;,-]/,"")
end

def parse_double_quotes(text)
  text.gsub(/\"/,"")
end