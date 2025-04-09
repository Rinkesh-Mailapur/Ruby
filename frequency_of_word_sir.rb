hash = {}
puts 'Enter a senetence to find frequency of characters'
sentence = gets.chomp
arr_character = sentence.split
arr_character.each do |char|
hash[char] = hash[char].to_i + 1
end
puts hash