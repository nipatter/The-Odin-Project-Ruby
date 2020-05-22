def leap_years(first_year, last_year)
    is_leap = Array.new
    all_years = Array(first_year..last_year)
    for i in all_years do
        if i % 4 == 0 and i % 100 !=0 then
            is_leap << i
        elsif i % 400 == 0 then
            is_leap << i
        end    
    end
    puts "There are #{is_leap.count} leap years between #{first_year} and #{last_year}."
    puts "They are #{is_leap.join(", ")}."
end

puts "Start year?"
a = gets.chomp.to_i

puts "End year?"
b = gets.chomp.to_i

leap_years(a, b)
