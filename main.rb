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
def cover_areas(triangle)
  (0...triangle.height).map do |w_or_h|
    range = ((-1 * w_or_h)..w_or_h)
    range.map do |x_or_y|
      case triangle.direction
      when 'R'
        # 右が直角(左に伸ばす)
        [-1 * w_or_h, x_or_y]
      when 'L'
        # 左が直角(右に伸ばす)
        [w_or_h, x_or_y]
      when 'T'
        # 上が直角(下に伸ばす)
        [x_or_y, w_or_h]
      when 'B'
        # 下が直角(上に伸ばす)
        [x_or_y, -1 * w_or_h]
      end
    end
  end
end

inputs = parse_input(input)
pp cover_areas(Triangle.new(4, 6, 'R', 2))

