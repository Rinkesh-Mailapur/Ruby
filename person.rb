# class Person
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
  # end of initialize method

  def display
    puts 'Hi in Person class'
    puts "Name : #{@name} \nAge : #{@age}"
  end
  # end of display method
end
# class Person

# class Employee
class Employee < Person
  # attr_accessor :empid

  def empid
    @empid
  end

  def empid=(empid)
    @empid = empid
  end

  def initialize(name, age, empid)
    super(name, age)
    @empid = empid
  end
  # end of initialize method

  def display
    p = Person.new(name, age)
    p.display
    puts "Employee ID : #{@empid}"
  end
end
# class Employee

emp = Employee.new('Rinkesh', 25, 101)
emp.display
puts emp.empid
puts emp.name
puts emp.age
emp.name = 'Rinku'
puts emp.name
emp.empid = 102
puts emp.empid
