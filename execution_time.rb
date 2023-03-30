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

def first_anagram?(string1, string2)
    
   string1.chars.permutation.map(&:join).include?(string2)

end 


def second_anagram?(string1, string2)

    arr = string2.split("")
    string1.split("").each do |ele|
        arr.delete_if{|ele2| ele2 == ele}
    end
    if arr.empty? 
        return true
    else
        false
    end
end 

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(string1, string2)
    alphabet = ("a".."z").to_a
    string1.chars.sort == string2.chars.sort
end

def fourth_anagram?(string1, string2)

    hash = Hash.new(0)
    string1.each_char do |char1| 
        hash[char1] += 1
    end

    string2.each_char do |char2|
        hash[char2] -= 1 
    end

    hash.values.all? {|v| v == 0}
end

def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num, i| 
        arr.each_with_index do |num2, j| 
            if j > i && num + num2 == target_sum
                return true 
            end
        end
    end
    false
end

def okay_two_sum?(arr, target_sum)
    left = 0
    right = arr.length - 1

    while left < right
        sum = (arr[left] + arr[right])  
    
        if sum == target_sum 
            return true 
        elsif sum > target_sum
            right -= 1
        else 
            left += 1
        end 
    end
    false
end

def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] = true}
    arr.each_with_index do |num, i|

        diff = target_sum - num
       return true if hash[diff] == true  && diff != num
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be fa
# p two_sum?(arr, 23)
# p two_sum?(arr, 17)
# p two_sum?(arr, -2)
# p two_sum?(arr, 5025)


def my_window_max_1(array, w)
    current_max_range = nil 
    windows = []

    array.each_with_index do |ele, i|
        if (i + w) <= array.length 
           windows << array[i...i+w] 
        end 
        range = array[i...i+w].max - array[i...i+w].min
        current_max_range = range if current_max_range == nil || current_max_range < range
    end 
    current_max_range
   
end 

# arr = [1,2,3,5]
# p my_window_max_1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p my_window_max_1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p my_window_max_1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p my_window_max_1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
    
    def initialize
        @store = []
    end

    def enqueue(window)
        self.push(window)
    end

    def dequeue 
        self.shift
    end

    def peek
        self.first
    end

    def empty?
        self.length == 0
    end

    def size
        self.length
    end



end

def window_max_range(array, window_size)
    max_range = nil 
    arr = []
    array.each_with_index do |ele, i| 
        arr.shift while !arr.empty? && arr.first <= i - window_size
end