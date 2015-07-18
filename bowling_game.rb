class BowlingGame

  def initialize(line)
    @line = line
  end

  def points
    result = 0
    @line.chars.to_a.each_index do | index |
      if @line[index] == '-'
        result += 0
      elsif @line[index] == '/'
        result += 10 + @line[index + 1].ord - 48
      elsif @line[index] == 'X'
        result += 10 + @line[index + 1].ord - 48 + @line[index + 2].ord - 48
      else
        result += @line[index].ord - 48
      end
    end
    result
  end

end