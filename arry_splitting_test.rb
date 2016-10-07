gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'pry'
require 'faker'
require_relative 'arry_splitting'

class ArrySplittingTest < Minitest::Test

	def test_even_numbered_list #if list is even this will return the numbers without the center two numbers
    assert_equal [1, 4], ArrySplitting.array_divider(1, 2, 3, 4)
	end

	def test_odd_numbered_list #if list is odd, this will return the numbers without the exact center
	  assert_equal [1, 2, 4, 5], ArrySplitting.array_divider(1, 2, 3, 4, 5)
  end

  def test_empty_list
  	assert_equal "List is empty", ArrySplitting.array_divider()
  end

  def test_list_of_strings
  	assert_equal ["first", "second", "fourth", "fifth"], ArrySplitting.array_divider("first", "second", "middle", "fourth", "fifth")
  end

  def test_list_of_multiple
  	assert_equal [true, 3, {:fifth => 5}, "last"], ArrySplitting.array_divider(true, 3, ["center", :center], {:center => "center"}, {:fifth => 5}, "last")
  end

  def test_array_search_single_result
  	n = Faker::Number.number(1).to_i
  	assert_equal [5, 6, 7, n], ArrySplitting.array_search(n, [rand(99), rand(99), rand(999), rand(999)], [5, 6, 7, n], ["9", "10", "11", "12"])
  end

  def test_array_search_multiple_result
  	n = Faker::Number.number(2).to_i
  	assert_equal [["first", 2, 3, n], [8, true, :hello, n]], ArrySplitting.array_search(n, [rand(9), rand(999), rand(9999), rand(999)], ["first", 2, 3, n], [8, true, :hello, n], [Faker::Name.name, 4, 5, 6,] )
  end

  def test_array_search_no_result
  	assert_equal "Could not find target", ArrySplitting.array_search(4455, [rand(999), rand(999), rand(99999), rand(99)], ["4455", "four", 4, 5])
  end

  def test_array_search_for_string
  	string = Faker::Crypto.md5
  	assert_equal [string, 4, "third", "5"], ArrySplitting.array_search(string, ["string", Faker::Crypto.md5, Faker::Bitcoin.address, [5, 6]], [Faker::Name.name, Faker::PhoneNumber.phone_number, 46, 678], [string, 4, "third", "5"] )
  end

end







