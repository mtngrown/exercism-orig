#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'word_count'

# Common test data version: 1.0.0 cd26d49
class WordCountTest < Minitest::Test
  def test_count_one_word
    phrase = Phrase.new("word")
    counts = {"word"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_count_one_of_each_word
    phrase = Phrase.new("one of each")
    counts = {"one"=>1, "of"=>1, "each"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_multiple_occurrences_of_a_word
    phrase = Phrase.new("one fish two fish red fish blue fish")
    counts = {"one"=>1, "fish"=>4, "two"=>1, "red"=>1, "blue"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_handles_cramped_lists
    phrase = Phrase.new("one,two,three")
    counts = {"one"=>1, "two"=>1, "three"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_handles_expanded_lists
    phrase = Phrase.new("one,\ntwo,\nthree")
    counts = {"one"=>1, "two"=>1, "three"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_ignore_punctuation
    phrase = Phrase.new("car: carpet as java: javascript!!&@$%^&")
    counts = {"car"=>1, "carpet"=>1, "as"=>1, "java"=>1, "javascript"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_include_numbers
    phrase = Phrase.new("testing, 1, 2 testing")
    counts = {"testing"=>2, "1"=>1, "2"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_normalize_case
    phrase = Phrase.new("go Go GO Stop stop")
    counts = {"go"=>3, "stop"=>2}
    assert_equal counts, phrase.word_count
  end

  def test_with_apostrophes
    phrase = Phrase.new("First: don't laugh. Then: don't cry.")
    counts = {"first"=>1, "don't"=>2, "laugh"=>1, "then"=>1, "cry"=>1}
    assert_equal counts, phrase.word_count
  end

  def test_with_quotations
    phrase = Phrase.new("Joe can't tell between 'large' and large.")
    counts = {"joe"=>1, "can't"=>1, "tell"=>1, "between"=>1, "large"=>2, "and"=>1}
    assert_equal counts, phrase.word_count
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    assert_equal 1, BookKeeping::VERSION
  end
end
