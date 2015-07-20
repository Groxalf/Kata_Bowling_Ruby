require_relative 'field_point_value'

class BowlingGame

  MAX_FRAMES = 10

  def initialize(line)
    @line_frames = line.split(' ')
  end

  def points
    result = 0
    (0..9).each { |index| result += self.calculate_frame_points(@line_frames[index], index) }
    result
  end

  def calculate_frame_points(frame, index)
    return calculate_spare(index) if is_a_spare(frame)
    return calculate_strike(index) if is_a_strike(frame)
    FieldPointValue.get_value(frame[0]) + FieldPointValue.get_value(frame[1])
  end

  def calculate_strike(index)
    first_roll = @line_frames[index + 1][0]
    second_roll = @line_frames[index + 1][1]
    FieldPointValue.get_value('X') + FieldPointValue.get_value(first_roll) + FieldPointValue.get_value(second_roll)
  end

  def is_a_strike(frame)
    frame[0].eql?'X'
  end

  def is_a_spare(frame)
    frame[1].eql?'/'
  end

  def calculate_spare(index)
    first_roll = @line_frames[index + 1][0]
    FieldPointValue.get_value('/') + FieldPointValue.get_value(first_roll)
  end

end

