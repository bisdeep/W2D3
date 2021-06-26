class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  attr_reader :pegs
  #getters for peg

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)} #remember possible_pegs is a hash
 #what if inputted keys are lowercase? => check the upcase char.
  end

  def initialize(pegs)
    

    if Code.valid_pegs?(pegs)
        @pegs = pegs.map(&:upcase)
    else
        raise "pegs invalid"
    end

  end

  def self.random(length)
    
    #randomized means sampling an array
    random_pegs = Array.new()
    #push in random (sampled) pegs from the possible pegs hash(the keys)
    length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
    #call it in the class constructor
    Code.new(random_pegs)
  end

  def self.from_string(pegs)#string representing pegs
    #we have to call Code::new with an array of chars, splitting pegs into an array works 
    Code.new(pegs.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

    def num_exact_matches(code) # takes in a code to count matching indexes with the current class
     (0...code.length).count { |i| code[i] == self[i] } #remember the self would be the random instance 
      #go through the range, and count where the indexes in the current peg set exactly matches the one in the code
    end

  def num_near_matches(code)
   count = 0
   (0 .. code.length-1).each do |i|
    #iterate index
      if self.pegs.include?(code[i])
        if !(self[i] == code[i])
          count += 1
        end
      end

    end
    count
  end



  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
