# frozen_string_literal: true

# class Seat
class Seat
  attr_accessor :id, :seat_number, :is_booked, :row, :col

  # Initialize method
  def initialize(seat_number, row, col)
    @id = Time.now.to_i + rand(400..499)
    @row = row
    @col = col
    @seat_number = seat_number
    @is_booked = false
  end

end
