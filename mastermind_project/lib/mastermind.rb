require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)#call random from the code class and save this randomized array as @secret_code
    end

    def print_matches(code)

        puts "exact matches: " + (@secret_code.num_exact_matches(code)).to_s
        puts "near matches: " + (@secret_code.num_near_matches(code)).to_s

    end

    def ask_user_for_guess
        puts "Enter a code: "
        string = gets.chomp
        code = Code.from_string(string)
        puts "exact matches: " + (@secret_code.num_exact_matches(code)).to_s
        puts "near matches: " + (@secret_code.num_near_matches(code)).to_s
        return code == @secret_code
    end

end
