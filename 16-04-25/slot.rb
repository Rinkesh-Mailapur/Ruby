# frozen_string_literal: true

# class Slot
class Slot
  attr_accessor :id, :show_time, :movie, :start_time, :end_time, :screen

  # Initialize method
  def initialize(start_time, movie, screen)
    @id = Time.now.to_i + rand(500..599)
    @start_time = start_time
    @end_time = start_time + (movie.duration * 60) + 60 * 60
    @movie = movie
    @screen = screen
  end

end
