class FunnyBots
    attr_accessor :name, :quotes # create read/write methods ONLY for instance variables
  
    @@bots = []
  
    def initialize(name, quotes)
      @name = name
      @quotes = quotes
      @@bots << self # self is the instance
    end
  
    def random_quote
      self.quotes.sample # self is the instance
    end
  
    def self.bots # class method. self is the class itself. In this case a reader fro class variable @@bots
      @@bots
    end

end
  
quotes = [
'Q: How did the programmer die in the shower? A: He read the shampoo bottle instructions: Lather. Rinse. Repeat. ',
"A UI is like a joke. If you have to explain it, it's not good.",
'Q: How many programmers does it take to change a light bulb? A: None – It’s a hardware problem',
]
archer = FunnyBots.new('Archer', quotes)

# What is self in this line: @@bots << self ?
    #Instance of FunnyBots
# What is self in this line: self.quotes.sample?
    #Instance of FunnyBots
# What kind of method is self.bots and what is self?
    #class method, self is the class itself (FunnyBots)
# Will this work: archer.bots? Why / why not?
    #no, archer is an instance of FunnyBots but bots is a class method so it doesn't work on an instance?


# class Bicycle
#     attr_reader :tire
    
#     def initialize(tire, gears, style)
#         @tire = tire
#         @gears = gears
#         @style = style
#     end
    
#     def tire_size
#         self.tire
#     end
    
#     def self.gears
#         @gears
#     end

# end
    
# mongoose = Bicycle.new(4, 10, 'BMX')

# For what reasons will the following method calls fail?

# mongoose.tire_size = 5
# mongoose.gears
# Bicycle.bikes
# Bicycle.styles
# Restructure the class to fix the issues.

class Bicycle

    @@bikes = [] #temporary database
    # @@styles = []

    def self.bikes
       @@bikes
    end

    def self.styles
        # @@styles
        @@bikes.map {|bike| bike.style}
        # @bikes.map(& :style)
     end

    attr_reader :tire, :gears, :style
    
    def initialize(tire, gears, style)
        @tire = tire
        @gears = gears
        @style = style
        @@bikes << self
        # @@styles << style
    end
    
    def tire_size=(new_tire)
        self.tire=(new_tire)
    end

    private

    attr_writer :tire

end
    
mongoose = Bicycle.new(4, 10, 'BMX')

mongoose.tire_size = 5
mongoose.gears
puts Bicycle.bikes.inspect
puts Bicycle.styles.inspect
