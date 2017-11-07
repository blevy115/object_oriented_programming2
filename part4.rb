class Vampire

  @@coven = []
  @@new_coven = []

  def initialize (name, age)
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today = false
  end

  def self.create(name, age)
    new_vampire = Vampire.new(name, age)
    @@coven << new_vampire
    return new_vampire
    new_vampire = nil
  end

  def drink_blood
    @drank_blood_today = true
  end

# Ask instrutcors about ways to use each
  def self.sunrise
     @@new_coven = @@coven.select do |vampire|
      vampire.in_coffin == true || vampire.drank_blood_today == true
      end
      @@coven = @@new_coven
  end

  def self.sunset
    @@coven.map do |vampire|
      vampire.drinks_blood_today(false)
      vampire.into_coffin(false)
    end
  end

  def go_home
    @in_coffin = true
  end

  def self.coven
    @@coven
  end

  def drinks_blood_today(state)
    @drank_blood_today = state
  end

  def into_coffin(state)
    @in_coffin = state
  end

  def drank_blood_today
    @drank_blood_today
  end

  def in_coffin
    @in_coffin
  end
end

vampire1 = Vampire.create("Vamp", 25)
vampire2 = Vampire.create("Dracula", 300)

vampire1.drink_blood
vampire3 = Vampire.create("Alister", 100)
vampire1.drink_blood
Vampire.sunset
vampire3.drink_blood
vampire2.go_home
# puts Vampire.coven.inspect
Vampire.sunrise
puts Vampire.coven.inspect
