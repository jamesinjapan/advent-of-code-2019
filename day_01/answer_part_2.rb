def clean_mass(mass)
  if mass.is_a? Integer
    mass
  else
    mass.strip.to_i
  end
end

def calculate_fuel_requirement(mass)
  (mass/3).floor - 2
end

def additional_fuel_needed?(fuel)
  fuel > 0
end

def recursively_sum_fuel(mass)
  fuel = calculate_fuel_requirement(mass)
  if additional_fuel_needed?(fuel)
    fuel + recursively_sum_fuel(fuel)
  else
    0
  end
end

input = File.readlines('input.txt')
masses = []
input.each do |mass|
  clean_mass = clean_mass(mass)
  masses.push(recursively_sum_fuel(clean_mass))
end
puts "Total mass: #{masses.sum}"