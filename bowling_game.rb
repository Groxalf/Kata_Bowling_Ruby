require_relative 'frame'

class BowlingGame

  def initialize(line)
    @line_frames = line
  end

  def points
    result = 0
    @line_frames.chars.to_a.each_index do | index |
      if @line_frames[index] == '-'
        result += 0
      elsif @line_frames[index] == '/'
        result += 10 + @line_frames[index + 1].ord - 48
      elsif @line_frames[index] == 'X'
        result += 10 + @line_frames[index + 1].ord - 48 + @line_frames[index + 2].ord - 48
      else
        result += @line_frames[index].ord - 48
      end
    end
    result
  end

end