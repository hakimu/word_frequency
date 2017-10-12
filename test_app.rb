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

  def test_top_word_count
    skip
    test_string = "Today is friday friday and tomorrow is is is is saturday."
    frequency = word_frequency(test_string)
    values = [1,5,2,1,1,1]
    assert_equal values, top_word_count
  end

end

# test for coma, parens, colon, semi colon, quotes (single/double)
# look at reading from file
# get top list of words