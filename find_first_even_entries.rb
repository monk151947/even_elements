#!/usr/bin/env ruby

require 'http'
require 'json'

arguments = ARGV
LIMIT= ARGV[0]
array_as_string = ARGV[1]
array = JSON.parse(array_as_string)

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

values = find_first_even_num(array)
def get_api_data(values)
    result = []
    begin
        values.each do |uri|
            response = HTTP.get(uri) 
            if ! response.parse.empty?
            result << { title: response.parse['title'] ? response.parse['title'] : nil , completed: response.parse['completed']? response.parse['completed'] : nil  }
            end
        end
    result
   rescue StandardError => e
    puts "error: #{e.message}" 
   end
end   

p results = get_api_data(values)
p results.count

