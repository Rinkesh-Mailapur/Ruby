# Module Mod
module Mod
  def one
    puts 'This is old_one'
  end
  module_function :one
end
# end module Mod

# class TestModule
class TestModule
  include Mod
  def call_one
    one
  end
end

test = TestModule.new
test.call_one
Mod.one

#module Mod
module Mod
  def one
    puts 'This is new_one'
  end
end

test.call_one
Mod.one