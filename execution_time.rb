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

    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    my_min(list)  # =>  -5


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

# list = [5, 3, -7]

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

    list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])