require 'minitest/autorun'
require 'minitest/rg'

require_relative 'app'

class WordFrequencyTest < Minitest::Test

  def test_parse_text
    test_string = "This sentence has a period."
    result = parse_text_for_punctuation(test_string)
    refute result.include?(".")
  end

  def test_word_frequency
    test_string = "Today is friday friday and tomorrow is is is is saturday."
    frequency = word_frequency(test_string)
    assert_equal 1, frequency["Today"]
    assert_equal 5, frequency["is"]
    assert_equal 2, frequency["friday"]
    assert_equal 1, frequency["and"]
    assert_equal 1, frequency["tomorrow"]
    assert_equal 1, frequency["saturday"]
  end

  def test_for_question_mark
    text = "Is it raining?"
    result = parse_text_for_punctuation(text)
    refute result.include?("?")
  end

end

# test for coma, parens, colon, semi colon, quotes (single/double)
# look at reading from file
# get top list of words