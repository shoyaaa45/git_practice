arr = Array.new(5,1)

arr.length.times do
  puts "Hello"
end

for num in 1...5 do 
  puts "hoi"
end

puts "#{ARGV[0]} bigger than 3" if ARGV[0].to_i > 3 
