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
        [- 1 * x_or_y + x_or_y_offset, triangle.y + offset].to_s.to_sym
      when 'L'
        # 左が直角(右に伸ばす)
        [x_or_y + x_or_y_offset, triangle.y + offset].to_s.to_sym
      when 'T'
        # 上が直角(下に伸ばす)
        [triangle.x + offset, x_or_y + x_or_y_offset].to_s.to_sym
      when 'B'
        # 下が直角(上に伸ばす)
        [triangle.x + offset, -1 * x_or_y + x_or_y_offset].to_s.to_sym
      end
    end
  end
end

def count_same(a, b)
  (a & b).count
end


def test(str)
  str.each_line do |line|
    line.chomp!
    next if line == ''
    line =~ /\/\*(\d+)\*\/.*"(.*)", "(.*)"/
    num, input_str, except = [$1, $2, $3.to_i]
    a, b = parse_input(input_str).map do |triangle|
      cover_areas(triangle)
    end
    fact = count_same(a, b)
    puts "#{num}: #{input_str} : #{except == fact ? 'OK' : "NG"}"
  end
end

test_raw_text = <<~EOS
/*0*/ test( "7,0R6/3,1B5", "15" );

/*1*/ test( "1,6L4/4,9R9", "4" );

/*2*/ test( "0,2R4/1,3B4", "3" );

/*3*/ test( "1,2L4/1,2L5", "16" );

/*4*/ test( "3,2L5/5,6B4", "8" );

/*5*/ test( "4,1B3/6,3B4", "4" );

/*6*/ test( "4,4R7/4,3R5", "20" );

/*7*/ test( "4,5R9/0,7T3", "7" );

/*8*/ test( "4,7T9/1,6T3", "1" );

/*9*/ test( "4,8B7/3,7L4", "10" );

/*10*/ test( "5,3L3/9,8L4", "0" );

/*11*/ test( "5,6B4/4,4R2", "3" );

/*12*/ test( "5,6B4/8,5R4", "8" );

/*13*/ test( "5,8B9/5,2L2", "4" );

/*14*/ test( "6,1L5/7,1T2", "3" );

/*15*/ test( "7,2B4/7,2T4", "1" );

/*16*/ test( "7,3T9/9,6L6", "11" );

/*17*/ test( "8,0R6/8,1R7", "30" );

/*18*/ test( "0,4R7/4,6R10", "36" );

/*19*/ test( "10,4L4/9,1T6", "9" );

/*20*/ test( "2,2T7/6,7T10", "4" );

/*21*/ test( "2,7R4/1,6L8 ", "2" );

/*22*/ test( "3,0R10/1,2T7", "7" );

/*23*/ test( "3,5T2/3,6B10", "2" );

/*24*/ test( "4,7R10/8,2T8", "6" );

/*25*/ test( "6,8B10/4,5B6", "36" );

/*26*/ test( "9,2B7/1,1B10", "6" );

/*27*/ test( "9,3R14/2,4R1", "1" );

/*28*/ test( "3,0R10/0,6B10", "54" );

/*29*/ test( "4,10T8/4,10T8", "64" );

/*30*/ test( "1,5T10/1,20B10", "56" );

/*31*/ test( "15,16L4/5,12L12", "4" );

/*32*/ test( "12,11T18/7,18R18", "34" );

/*33*/ test( "15,16T14/5,12L15", "44" );

/*34*/ test( "5,10L40/22,22B10", "100" );

/*35*/ test( "46,34T34/34,29T14", "30" );

/*36*/ test( "52,75L12/88,69T54", "0" );

/*37*/ test( "67,83B70/99,48T14", "52" );

/*38*/ test( "291,11T120/258,54B130", "424" );

/*39*/ test( "62,170L139/133,172R21", "441" );

/*40*/ test( "98,189B116/183,127R27", "240" );

/*41*/ test( "646,684B96/435,690R772", "0" );

/*42*/ test( "113,668L866/581,859L852", "158404" );

/*43*/ test( "309,321B162/137,420B423", "15750" );

/*44*/ test( "5474,6459R9089/8177,150R5120", "376996" );

/*45*/ test( "2399,1640B2451/1718,2100L1623", "221334" );

/*46*/ test( "5621,8460T7612/2715,5697L8851", "861192" );
EOS

test(test_raw_text)
