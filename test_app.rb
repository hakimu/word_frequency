require 'minitest/autorun'
require 'minitest/rg'

require_relative 'app'

class WordFrequencyTest < Minitest::Test

  def test_parse_text
    test_string = "This sentence has a period."
    result = WordFrequency.new(test_string).parse_punctuation
    refute result.include?(".")
  end

  def test_word_frequency
    test_string = "Today is friday friday and tomorrow is is is is saturday."
    frequency = WordFrequency.new(test_string).word_frequency
    assert_equal 1, frequency["Today"]
    assert_equal 5, frequency["is"]
    assert_equal 2, frequency["friday"]
    assert_equal 1, frequency["and"]
    assert_equal 1, frequency["tomorrow"]
    assert_equal 1, frequency["saturday"]
  end

  def test_for_question_mark
    text = "Is it raining?"
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?("?")
  end

  def test_for_period
    text = "It's raining."
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?(".")
  end

  def test_for_exclamation
    text = "It's \" cold!"
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?("!")
  end

  def test_for_colon
    text = "The : is in the sentence"
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?(":")
  end

  def test_for_semi_colon
    text = "The semi colon is at the end;"
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?(";")
  end

  def test_for_dash
    text = "Today is - Sunday"
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?("-")
  end

  def test_for_double_quotes
    text = "She said, \"Hi\""
    result = WordFrequency.new(text).parse_double_quotes
    refute result.include?('"')
  end

  def test_for_coma
    text = "I went here third, second, first and last"
    result = WordFrequency.new(text).parse_punctuation
    refute result.include?(",")
  end

  def test_sort_words
    test_string = "Today is friday friday and tomorrow is is is is saturday."
    values = [["is", 5], ["friday", 2], ["saturday", 1], ["tomorrow", 1], ["and", 1], ["Today", 1]]
    assert_equal values, WordFrequency.new(test_string).sort_words
  end

  def test_top_words
    test_string = "Today is friday friday and tomorrow is is is is saturday."
    top_two = [["is", 5], ["friday", 2]]
    assert_equal top_two, WordFrequency.new(test_string).top_words(2)
  end

end

# test for coma, parens, colon, semi colon, quotes (single/double)
# look at reading from file
# get top list of words