#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'pangram'

# Common test data version: 1.0.0 f375051
class PangramTest < Minitest::Test
  def test_full_alphabet_false
    letters = 'abc'.each_char.with_object(Hash.new(0)) { |l, h| h[l] += 1 }.keys
    result = Pangram.full_alphabet?(letters)
    refute result
  end

  def test_full_alphabet_true
    letters = ('a'..'z').to_a.join.each_char.with_object(Hash.new(0)) { |l, h| h[l] += 1 }.keys
    result = Pangram.full_alphabet?(letters)
    assert result
  end

  def test_sentence_empty
    phrase = ''
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_only_lower_case
    phrase = 'the quick brown fox jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_missing_character_x
    phrase = 'a quick movement of the enemy will jeopardize five gunboats'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_another_missing_character_x
    phrase = 'the quick brown fish jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_underscores
    phrase = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_pangram_with_numbers
    phrase = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_missing_letters_replaced_by_numbers
    phrase = '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_mixed_case_and_punctuation
    phrase = '"Five quacking Zephyrs jolt my wax bed."'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_upper_and_lower_case_versions_of_the_same_character_should_not_be_counted_separately
    phrase = 'the quick brown fox jumped over the lazy FOX'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
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
    assert_equal 4, BookKeeping::VERSION
  end
end
