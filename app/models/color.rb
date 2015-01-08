class Color
  COLORS = %w(blue light_blue cyan green light_green yellow red pink orange purple brown)

  def self.colors
    COLORS
  end

  def self.allowed_color?(color)
    colors.include?(color)
  end

  def self.random_color
    colors.sample
  end

end
