require_relative './nameable'

class Decorator < Nameabble
  attr_accessor :nameable

  def initialize(nameable = Nameable.new())
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
