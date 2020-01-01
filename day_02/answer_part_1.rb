require 'csv'

ADD_CODE = 1
MULTIPLY_CODE = 2
RETURN_CODE = 99

raw_input = File.read('input.csv')
input = raw_input.strip.split(",").map(&:to_i)
input[1] = 12
input[2] = 2
cursor = 0
while true
  opcode = input[cursor]
  break if opcode.nil? || opcode == RETURN_CODE

  input1 = input[cursor+1]
  input2 = input[cursor+2]
  output = input[cursor+3]

  case opcode
  when ADD_CODE
    input[output] = input[input1] + input[input2]
  when MULTIPLY_CODE
    input[output] = input[input1] * input[input2]
  else
    throw ArgumentError
    break
  end
  cursor += 4
end

p input
puts "Position 0 is now: #{input[0]}"