require 'pp'
Triangle = Struct.new(:x, :y, :direction, :height)

input = '7,0R6/3,1B5'
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
    Triangle.new(matches[1].to_i, matches[2].to_i, matches[3], matches[4].to_i)
  end
end

# make
def cover_areas(triangle)
  from_x_or_y, to_x_or_y = case triangle.direction
                           when 'R', 'L'
                             # 右が直角(左に伸ばす)
                             # 左が直角(右に伸ばす)
                             [triangle.x, triangle.x + (triangle.height - 1)] # 'L'
                           when 'T', 'B'
                             # 上が直角(下に伸ばす)
                             # 下が直角(上に伸ばす)
                             [triangle.y, triangle.y + (triangle.height - 1)] # 'T'
                           end
  (from_x_or_y...to_x_or_y).map do |w_or_h|
    range = ((-1 * w_or_h)..w_or_h)
    range.map do |x_or_y|
      case triangle.direction
      when 'R'
        # 右が直角(左に伸ばす)
        [w_or_h, x_or_y]
      when 'L'
        # 左が直角(右に伸ばす)
        [-1 * w_or_h, x_or_y]
      when 'T'
        # 上が直角(下に伸ばす)
        [x_or_y, -1 * w_or_h]
      when 'B'
        # 下が直角(上に伸ばす)
        [x_or_y, w_or_h]
      end
    end
  end
end

inputs = parse_input(input)
inputs.each do |triangle|
  pp cover_areas(triangle)
end

