# Read a file.  1. Count the word frequency. 2. Find out the top 10 words.

def word_frequency(text)
  text = parse_text_for_punctuation(text)
  array = text.split(" ")
  word_hash = {}
  array.each do |a|
    if word_hash.has_key?(a)
      word_hash[a] += 1
    else
      word_hash[a] = 1
    end
  end
  word_hash
end

def parse_text_for_punctuation(text)
  text.gsub(".","")
end