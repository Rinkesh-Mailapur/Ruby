# frozen_string_literal: true

require_relative 'movie'
require_relative 'theatre'
require_relative 'seat'
# class Screen
class Screen
  attr_accessor :id, :screen_number, :seating_capacity, :seats

  # Initialize method
  def initialize(screen_number, row, col)
    @id = Time.now.to_i + rand(300..399)
    @screen_number = screen_number
    @seats = []
    @seating_capacity = row * col
    create_seats(row, col)
    @seats.last.is_booked = true
  end

  def create_seats(row, col)
    letter = 'A'
    row.times do |r|
      col.times do |c|
        seats << Seat.new("#{letter}#{c+1}", r, c)
        puts "#{letter}#{c+1}  #{r} #{c} "
      end
      letter = letter.next
    end
  end


end
