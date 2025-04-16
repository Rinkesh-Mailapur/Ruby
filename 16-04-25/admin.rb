# frozen_string_literal: true

# class Admin
class Admin
  attr_accessor :id, :user_name, :password, :theatre

  def initialize(user_name, password, theatre)
    @id = Time.now.to_i + rand(100..199)
    @user_name = user_name
    @password = password
    @theatre = theatre
  end
end