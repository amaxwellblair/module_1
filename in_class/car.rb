class Car

  attr_accessor :color, :wheel_count, :starter  # => nil

  def initialize
    @starter = 0  # => 0, 0
  end             # => :initialize

  def horn
    puts "Beeps!"  # => nil
  end              # => :horn

  def drive distance
    puts "I'm driving #{distance} miles"  # => nil
  end                                     # => :drive

  def report_color
    puts "I am #{@color}"  # => nil
  end                      # => :report_color

  def start
    if starter == 0                   # => true, false
      puts "Starting up!"             # => nil
      @starter = 1                    # => 1
    else
      puts "BZZT! Nice try, though."  # => nil
    end                               # => 1, nil
  end                                 # => :start


end  # => :start




my_car = Car.new                                                   # => #<Car:0x007fc29c931820 @starter=0>
my_car.horn                                                        # => nil
my_car.drive(12)                                                   # => nil
my_car.color = "purple"                                            # => "purple"
my_car.report_color                                                # => nil
my_car.wheel_count = 18                                            # => 18
puts "This sweet ride is sitting on #{my_car.wheel_count} wheels"  # => nil
my_car.start                                                       # => 1
my_car.start                                                       # => nil

my_second_car = Car.new                                                   # => #<Car:0x007fc29c92acf0 @starter=0>
my_second_car.wheel_count = 2                                             # => 2
puts "This sweet ride is sitting on #{my_second_car.wheel_count} wheels"  # => nil

# >> Beeps!
# >> I'm driving 12 miles
# >> I am purple
# >> This sweet ride is sitting on 18 wheels
# >> Starting up!
# >> BZZT! Nice try, though.
# >> This sweet ride is sitting on 2 wheels
