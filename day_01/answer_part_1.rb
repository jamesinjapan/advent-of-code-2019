input = File.readlines('input.txt')
masses = input.map{ |ln| (ln.strip.to_i/3).floor - 2 }
puts "Total mass: #{masses.sum}"