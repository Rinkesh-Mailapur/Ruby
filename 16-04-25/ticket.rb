# frozen_string_literal: true


class Ticket
  attr_accessor :id , :slot, :seat

  def initialize(slot, seat)
    @id = Time.now.to_i + rand(700..799)
    @slot = slot
    @seat = seat
  end
end
