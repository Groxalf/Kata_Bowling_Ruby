class FieldPointValue

  @field_values = {"-" => 0, "/" => 10, "X" => 10}

  def self.get_value (field)
    @field_values.has_key?(field) ? @field_values[field] : field.ord - 48
  end

end