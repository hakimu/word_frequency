# Read a file.  1. Count the word frequency. 2. Find out the top 10 words.

class WordFrequency

  def initialize(text_from_file)
    @text_from_file = text_from_file
  end

  def word_frequency
    words = parse_punctuation
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

  def parse_punctuation
    @text_from_file.gsub(/[\.\?!:;,-]/,"")
  end

  def parse_double_quotes
    @text_from_file.gsub(/\"/,"")
  end

  def sort_words
    word_frequency.sort_by {|k,v| v}.reverse
  end

  def top_words(number)
    sort_words.first(number).map do |word|
      "#{word[0]} appears #{word[1]} times"
    end
  end

end



