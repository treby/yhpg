input = '291,11T120/258,54B130'

# parse

Triangle = Struct.new(:x, :y, :direction, :height)

def parse_input(txt)
  inputs = txt.split('/')
  inputs.map do |input|
    matches = /(\d+),(\d+)(R|L|T|B)(\d+)/.match(input)
    Triangle.new(matches[1], matches[2], matches[3], matches[4])
  end
end

parse_input(input)
