# frozen_string_literal: true 1

# class Movie
class Movie
  attr_accessor :id, :title, :duration, :genre, :rating, :is_active

  # Initialize method
  def initialize(title, duration, genre)
    @id = Time.now.to_i + rand(200..299)
    @title = title
    @duration = duration
    @genre = genre
    @rating = "5"
    @is_active = true
  end

  def display
    puts "Movie ID - #{id}, Title - #{title}, Duration - #{duration}"
  end

end
