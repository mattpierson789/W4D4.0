require 'byebug'

# my_min
# Given a list of integers find the smallest number in the list.

# Example:

def my_min(list)
    smallest = 0       #constant 
    list.each do |num| #linear (0n)
        smallest = num if num < smallest #constant 
    end
    smallest
end

def my_min2(list)
    smallest = 0 #constant
    list.each do |num| #linear (0n)
        list.each do |num2| #constant
            if num < num2 
                smallest = num
            else 
                smallest = num2

            end 
        end 
    end 
    return smallest 
end 

def largest_contiguous_subsum(list)
    sum = list.first
    list.each_with_index do |num, i| 
        list.each_with_index do |num2, j|
            curr_sum = list[i..j].sum
                if sum < curr_sum && j >= i
                    sum = curr_sum
                end 
        end 
    end 
sum 
end 

def largest_2(list)
    largest = list.first
    curr_sum = list.first
    return list.max  if list.all? {|ele| ele <= 0 }
    list[1..-1].each do |num|
        curr_sum += num
        if curr_sum < 0 
            curr_sum = 0 && largest = 0
        end
        if curr_sum > largest 
            largest = curr_sum
        end
    end
    largest              
end

 list = [-5, -1, -3]
p largest_2(list)


# list = [5, 3, -7]
# p largest_2(list)

# p largest_contiguous_subsum(list) # => 8

    # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7
# Example 2:

#     list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# # Example 3:

#     list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])


# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

def first_anagram?(string1, string2)
    
   string1.chars.permutation.map(&:join).include?(string2)

end 

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2)

    string1.split(" ").each do |ele|
        if string2.index(ele) != nil
            string.delete(ele)
        end 


end 