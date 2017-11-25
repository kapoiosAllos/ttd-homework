class Codebreaker
  class Game
    attr_reader :output
    def initialize(output)
      @output = output
    end
    def welcome
      output.puts "Welcome to Codebreaker"
    end
    def start(secret_number)
      @secret_number = secret_number
      output.puts "Enter guess:"
    end
    def guess(input)
        plus_counter, minus_counter = 0,0
        input.bytes.each_with_index { |number,index| plus_counter +=1 if number == @secret_number.bytes[index]}
        minus_counter = (@secret_number.bytes & input.bytes).length - plus_counter if ((@secret_number.bytes & input.bytes).length - plus_counter) > 0

        print_method(input,plus_counter,minus_counter)
        return !((@secret_number.bytes & input.bytes).length == 4 && plus_counter == 4)
    end
    private
    def print_method(entry,plus = 0, minus = 0)
        output.puts entry.length == 4 ? "+" * plus + "-" * minus : "Try guessing a number with four digits"
    end
  end
end
