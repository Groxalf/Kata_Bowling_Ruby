class BowlingGame

  HYPHEN_VALUE = 0
  SPARE_VALUE = 10
  STRIKE_VALUE = 10
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
    field_value(frame[0]) + field_value(frame[1])
  end

  def calculate_strike(index)
    first_roll = @line_frames[index + 1][0]
    second_roll = @line_frames[index + 1][1]
    STRIKE_VALUE + field_value(first_roll) + field_value(second_roll)
  end

  def is_a_strike(frame)
    frame[0].eql?'X'
  end

  def is_a_spare(frame)
    frame[1].eql?'/'
  end

  def calculate_spare(index)
    first_roll = @line_frames[index + 1][0]
    SPARE_VALUE + field_value(first_roll)
  end

  def field_value(field_value)
    if field_value == '-'
      HYPHEN_VALUE
    elsif field_value == '/'
      SPARE_VALUE
    elsif field_value === 'X'
      STRIKE_VALUE
    else
      field_value.ord - 48
    end
  end

end

