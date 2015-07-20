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
    FieldPointValue.get_value('X') + calculate_strike_bonus(index + 1)
  end

  def calculate_strike_bonus(index)
    return FieldPointValue.get_value(@line_frames[index][0]) +
        FieldPointValue.get_value(@line_frames[index + 1][0]) if @line_frames[index][0].eql? 'X'
    FieldPointValue.get_value(@line_frames[index][0]) + FieldPointValue.get_value(@line_frames[index][1])
  end

  def is_a_strike(frame)
    frame[0].eql?'X'
  end

  def is_a_spare(frame)
    frame[1].eql?'/'
  end

  def calculate_spare(index)
    FieldPointValue.get_value('/') + calculate_spare_bonus(index)
  end

  def calculate_spare_bonus(index)
    (index == MAX_FRAMES - 1) ?
        FieldPointValue.get_value(@line_frames[index][2]) :
        FieldPointValue.get_value(@line_frames[index + 1][0])
  end

end

