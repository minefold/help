class Route

  attr_reader :captures

  def initialize(*captures)
    @captures = captures
  end

end
