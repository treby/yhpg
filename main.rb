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
  x_or_y_offset = case triangle.direction
                  when 'R', 'L'
                    # 右が直角(左に伸ばす)
                    # 左が直角(右に伸ばす)
                    triangle.x
                  when 'T', 'B'
                    # 上が直角(下に伸ばす)
                    # 下が直角(上に伸ばす)
                    triangle.y
                  end

  (0...triangle.height).flat_map do |x_or_y|
    range = ((-1 * x_or_y)..x_or_y)
    range.map do |offset|
      case triangle.direction
      when 'R'
        # 右が直角(左に伸ばす)
        [- 1 * x_or_y + x_or_y_offset, triangle.y + offset]
      when 'L'
        # 左が直角(右に伸ばす)
        [x_or_y + x_or_y_offset, triangle.y + offset]
      when 'T'
        # 上が直角(下に伸ばす)
        [triangle.x + offset, x_or_y + x_or_y_offset]
      when 'B'
        # 下が直角(上に伸ばす)
        [triangle.x + offset, -1 * x_or_y + x_or_y_offset]
      end
    end
  end
end

inputs = parse_input(input)
inputs.each do |triangle|
  pp cover_areas(triangle)
end
