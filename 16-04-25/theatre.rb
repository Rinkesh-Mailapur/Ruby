# frozen_string_literal: true

require_relative 'screen'
# class Theatre
class Theatre
  attr_accessor :id, :name, :city, :screens, :slots

  # Initialize method
  def initialize(name, city)
    @id = Time.now.to_i + rand(600..699)
    @name = name
    @city = city
    @screens = []
    @slots = []
  end

end