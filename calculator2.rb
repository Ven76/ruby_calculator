# I need to get the left hand for the equation
# I need to get the operator for the equation
# I need to get hte right hand for the equation
# I need to calculate  and show the result
require 'pry'
@historical = []
@operator = ['+', '-', '*', '/']

def main_menu
  puts "Choose an option"
  puts "1. Calculaor"
  puts "2. History"
  puts "3. Exit calculator"
  num = gets.chomp.to_i

  if num == 1
    chain_menu
  elsif num == 2
    hist
  elsif num == 3
    exit(0)
  else
    puts "Invalid input."
    main_menu
  end
end

def chain_menu
  puts "Welcome to the Ruby Calculator"

  puts "What is your first number?"
  begin
    a = gets.chomp
    a = Float(a)
  rescue
    puts "Please enter a number"
    retry
  end
  a = a.to_f

  puts "What is your operator ( +, -, *, /)?"
  while true
    b = gets.chomp
    if @operator.include? b
      break
    else
      puts  "Invalid operation"
    end
  end


  puts "What is your second number?"
  begin
    c = gets.chomp
    c = Float(c)
  rescue
    puts "Please type a number"
    retry
  end
  c = c.to_f

  print "#{a} #{b} #{c} = "
  calc(a, b, c)
end

def calc(a, b, c)
  if b == '+'
    ans = a + c
  elsif b == '-'
    ans = a - c
  elsif b == '*'
    ans = a * c
  elsif b == '/'
    if c == 0.0
      puts "Error: cannot divide 0 into a number"
      chain_menu
    else
      ans = a / c
    end
  else
    ans = "Invalid operation"
  end
  puts ans
  @historical << "#{a} #{b} #{c} = #{ans}"
end

def hist
  @historical.each_with_index do |x, i|
    puts "#{i + 1}) #{x}"
  end
  puts "Press any key to return to main menu"
  s = gets.chomp.to_i
  if s == 0
    main_menu
  else s == 1
    puts "Nope, try again."
  end
end


while true do
  main_menu
end
