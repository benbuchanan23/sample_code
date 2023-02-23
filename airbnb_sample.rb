module Flyable
  def fly
    "I can fly!"
  end
end

module Sociable
  def social 
    "I play well with others."
  end
end

module Huntable
  def hunt(prey)
    "I hunt #{prey}."
  end
end

class Animal
  @@total_number_of_animals = 0 

  def initialize
    @@total_number_of_animals += 1 
    @animal_id = @@total_number_of_animals 
    @diet = self.diet
    @body_temp = "warm-blooded"
    @weight = calc_weight
  end

  def to_s 
    description = <<~BAT
    ========================
    species: #{self.class}
    animal id: #{self.animal_id}
    weight: #{self.weight}
    diet: #{self.diet}
    body temp: #{self.body_temp}
    ========================
    BAT
  end

  private 

  attr_reader :animal_id, :diet, :body_temp, :weight

  def calc_weight(lower_limit, upper_limit)
    (lower_limit..upper_limit).to_a.sample
  end

  def diet
  end
end

class Zebra < Animal
  include Sociable

  def calc_weight(lower_limit = 770, upper_limit = 990)
    super(lower_limit, upper_limit)
  end

  private

  def diet
    "Vegetation"
  end
end

class Hawk < Animal
  include Flyable
  include Huntable

  def calc_weight(lower_limit = 12, upper_limit = 15)
    super(lower_limit, upper_limit)
  end

  private

  def diet
    "Meat"
  end
end

class Tiger < Animal
  include Huntable

  def calc_weight(lower_limit = 200, upper_limit = 680)
    super(lower_limit, upper_limit)
  end

  private

  def diet
    "Meat"
  end
end

class Koala < Animal

  def calc_weight(lower_limit = 10, upper_limit = 30)
    super(lower_limit, upper_limit)
  end

  private

  def diet
    "Vegetation"
  end
end

class Parrot < Animal
  include Flyable
  include Sociable

  def calc_weight(lower_limit = 1, upper_limit = 3)
    super(lower_limit, upper_limit)
  end

  private

  def diet
    "Vegetation"
  end
end

zebra = Zebra.new
zebra2 = Zebra.new
parrot = Parrot.new
hawk = Hawk.new
tiger = Tiger.new
koala = Koala.new
puts zebra
puts zebra2
puts parrot
puts hawk
p zebra.social
p parrot.fly
p hawk.fly
p hawk.hunt("pigeon")
p zebra.animal_id  # ==> (NoMethodError): private method
p zebra.diet  # ==> (NoMethodError): private method
p zebra.body_temp  # ==> (NoMethodError): private method
p zebra.weight  # ==> (NoMethodError): private method
zebra.body_temp = "cold_blooded"  # ==> (NoMethodError): no setter method