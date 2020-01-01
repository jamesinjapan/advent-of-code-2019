require 'csv'

ADD_CODE = 1
MULTIPLY_CODE = 2
RETURN_CODE = 99

raw_input = File.read('input.csv')
(0..99).to_a.each do |first_noun|
  (0..99).to_a.each do |first_verb|
    input = raw_input.strip.split(",").map(&:to_i)
    input[1] = first_noun
    input[2] = first_verb
    cursor = 0
    while true
      opcode = input[cursor]
      break if opcode.nil? || opcode == RETURN_CODE

      noun = input[cursor+1]
      verb = input[cursor+2]
      output = input[cursor+3]

      case opcode
      when ADD_CODE
        input[output] = input[noun] + input[verb]
        cursor += 4
      when MULTIPLY_CODE
        input[output] = input[noun] * input[verb]
        cursor += 4
      else
        throw ArgumentError
        break
      end
    end
    if input[0] == 19690720
      p 100 * first_noun + first_verb
      return
    end
  end
end
