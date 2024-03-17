#!/usr/bin/env ruby

require 'test/unit'
require 'http'

LIMIT = 20

def find_first_even_num(array)
  even_values = []
  array.each do |url|
      if url.split('/').pop().to_i.even?
      even_values << url
      break if even_values.length == LIMIT
      end
  end
  even_values
end

def get_api_data(values)
  result = []
  values.each do |uri|
      response = HTTP.get(uri) 
      if ! response.parse.empty?
      result << { title: response.parse['title'] ? response.parse['title'] : nil , completed: response.parse['completed']? response.parse['completed'] : nil  }
      end
  end
  result
end   

class TestFindFirstEvenEntries < Test::Unit::TestCase
    def test_find_first_even_num
      # Test case: array with first 20 even values 
      input1 = (1..40).to_a.map {|i| 'https://jsonplaceholder.typicode.com/todos/'+i.to_s}
         
      even_numbers = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
      expected1 = even_numbers.map {|i| 'https://jsonplaceholder.typicode.com/todos/'+i.to_s}

      assert_equal(expected1, find_first_even_num(input1))
  
      # Test case: array with less than 20 even values
      numbers2 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
      input2 = numbers2.map {|i| 'https://jsonplaceholder.typicode.com/todos/'+i.to_s}
      expected2 = []
      assert_equal(expected2, find_first_even_num(input2))
  
      # Test case: array with more than 20 even values
      input3  = (1..100).to_a.map {|i| 'https://jsonplaceholder.typicode.com/todos/'+i.to_s}
      expected3 = 20
      assert_equal(20, find_first_even_num(input3).size)
    end
  
    def test_get_api_data
      # Test case: fetching the data from the API 
      values = ['https://jsonplaceholder.typicode.com/todos/4']
      assert_equal("et porro tempora", get_api_data(values).first[:title])
      assert_equal(true, get_api_data(values).first[:completed])

      # Test case: find the 20 even api data
      even_numbers = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40]
      expected1 = even_numbers.map {|i| 'https://jsonplaceholder.typicode.com/todos/'+i.to_s}
      assert_equal(expected1.count, get_api_data(expected1).count)
    end
end