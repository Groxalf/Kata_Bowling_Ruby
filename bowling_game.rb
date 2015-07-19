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
        result += field_value(index) + field_value(index + 1)
      elsif @line_frames[index] == 'X'
        result += field_value(index) + field_value(index + 1) + field_value(index + 2)
      else
        result += field_value(index)
      end
    end
    result
  end

  def field_value(index)
    if @line_frames[index] == '-'
       0
    elsif @line_frames[index] == '/'
       10 - field_value(index - 1)
    elsif   @line_frames[index] == 'X'
       10
    else
       @line_frames[index].ord - 48
    end
  end

end