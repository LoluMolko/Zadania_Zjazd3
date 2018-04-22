class Calculator
  attr_reader :name, :result, :history

  def initialize(name)
    @name = name
    @result = 0
    @history = []
  end

  def add(number)
    @result += number
    history << "add #{number} (result: #{@result})"
  end

  def subtract(number)
    @result -= number
    history << "subtract #{number} (result: #{@result})"
  end

  def multiply(number)
    @result *= number
    history << "multiply #{number} (result: #{@result})"
  end

  def divide(number)
    @result /= number
    history << "divide #{number} (result: #{@result})"
  end

  def clear
    @result = 0
    history << "clear (result: #{@result})"
  end

  def change_sign
    if @result < 0
      @result = @result * -1
    elsif @result > 0
      @result -= @result*2
    else
      @result = 0
    end
    history << "change_sign (result: #{@result})"
  end

  def print_history
    puts history
  end
end

calculator = Calculator.new("CASIO")
puts calculator.name # prints CASIO
calculator.add(2)
calculator.add(3)
puts calculator.result # prints 5
calculator.add(10)
puts calculator.result # prints 15
calculator.clear # set result to 0
puts calculator.result # prints 0
calculator.subtract(20)

puts calculator.result # prints -20
calculator.multiply(3)
puts calculator.result # prints -60
calculator.divide(4)
puts calculator.result # prints -15
calculator.change_sign
puts calculator.result # prints 15
calculator.print_history # prints entire history
# add 2 (result: 2)
# add 3 (result: 5)
# add 10 (result: 15)
# clear (result: 0)
# subtract 20 (result: -20)
# multiply 3 (result: -60)
# divide 4 (result: -15)
# change_sign (result: 15)
