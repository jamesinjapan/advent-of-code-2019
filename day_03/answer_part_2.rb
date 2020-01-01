def new_coordinates(command, coordinates)
  new_coordinates = coordinates.clone
  path = []
  command[1..-1].to_i.times do
    case command[0]
    when "U"
      new_coordinates[1] += 1
    when "D"
      new_coordinates[1] -= 1
    when "R"
      new_coordinates[0] += 1
    when "L"
      new_coordinates[0] -= 1
    end
    path.push new_coordinates.clone
  end
  path
end

raw_instructions = File.readlines('input.txt')
instructions = raw_instructions.map(&:chomp)
ORIGIN = [0,0]
results = []

# Transform each set of instructions into an array of coordinates
instructions.each do |set|
  coordinates = [ORIGIN]
  set.split(",").each do |command|
    coordinates.concat new_coordinates(command, coordinates[-1])
  end
  results.push coordinates[1..-1] #ignore start point
end

uniq_intersects = results[0].intersection(results[1]).uniq
steps = []
uniq_intersects.each do |coordinate|
  indices = results.map { |arr| arr.find_index(coordinate) }
  steps.push(indices.sum + 2)
end

puts "Shortest combined steps: #{steps.min}"