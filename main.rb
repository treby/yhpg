require 'pp'
Triangle = Struct.new(:x, :y, :direction, :height)

input = '291,11T120/258,54B130'
if input.nil?
  print 'input> '
  input = STDIN.gets.chomp
end
puts input

# parse
def parse_input(txt)
  inputs = txt.split('/')
  inputs.map do |input|
    matches = /(\d+),(\d+)(R|L|T|B)(\d+)/.match(input)
    Triangle.new(matches[1], matches[2], matches[3], matches[4])
  end
end

# make
def make_triangle(height, direction = 'R')
  (0...height).map do |pos|
    range = ((-1 * pos)..pos)
    range.map { |a| [pos, a] }
  end
end

#inputs = parse_input(input)
pp make_triangle(5)

