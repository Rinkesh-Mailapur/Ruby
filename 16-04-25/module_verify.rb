# frozen_string_literal: true

# module Verify
module Verify
  def verify_movie_id
    counter = 0
    loop do
      puts 'Enter Movie ID:'
      movie_id = gets.chomp
      return movie_id if @movie_details.key?(movie_id)

      counter += 1
      break if counter >= 3

      puts "Invalid Movie ID. Please try again. Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # verify movie_id method

  def verify_movie_id_t(movie)
    counter = 0
    loop do
      puts 'Enter Movie ID:'
      movie_id = gets.chomp
      return movie_id if movie.movie_details.key?(movie_id)

      counter += 1
      break if counter >= 3

      puts "Invalid Movie ID. Please try again. Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # verify movie_id_t method

  def verify_admin_user_name
    counter = 0
    loop do
      puts 'Enter Admin username:'
      admin_username = gets.chomp
      return 0 if @@admins[:user_name] == admin_username

      counter += 1
      break if counter >= 3

      puts "Invalusername Admin username. Please try again. Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # end of verify_admin_id method
  

  def verify_admin_password
    counter = 0
    loop do
      puts 'Enter Password:'
      password = gets.chomp
      return 0 if @admins[:password] == password

      counter += 1
      break if counter >= 3

      puts "Invalid Password. Please try again. Attempts left: #{3 - counter}"
    end
  end
  # end of admin_password method

  def verify_mobile_number
    counter = 0
    loop do
      puts 'Enter Mobile Number'
      num = gets.chomp
      return num.to_i if num.match(/^[789]\d{9}$/)

      counter += 1
      break if counter >= 3

      puts "Please Enter Valid Mobile Number which starts with 7,8,9. Attempts left: #{3 - counter}"
    end
    # while
  end
  # method mobile_number

  def verify_row
    puts 'Enter Row(1-3)'
    counter = 0
    loop do
      row = gets.chomp.to_i
      return row if [1, 2, 3].include?(row)

      counter += 1
      break if counter >= 3

      puts "Please enter Valid Row (1-3). Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # method verify_row

  def verify_col
    puts 'Enter Column (1-5)'
    counter = 0
    loop do
      col = gets.chomp.to_i
      return col if [1, 2, 3, 4, 5].include?(col)

      counter += 1
      break if counter >= 3

      puts "Please enter Valid Column (1-5). Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # method verify_row

 
  def verify_theatre_id
    puts 'Please Entre Theatre ID'
    counter = 0
    loop do
      t_id = gets.chomp
      return t_id if @theatre_list.key?(t_id)

      counter += 1
      break if counter >= 3

      puts "Please Enter a Valid Theatre ID: #{t_id}. Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # end of verify_method


  def verify_exit
    puts "\nPress 1 to Continue\nPress 0 to exit"
    counter = 0
    loop do
      response = gets.chomp
      return response if %w[1 0].include?(response)

      counter += 1
      break if counter >= 3

      puts "\nPlease Enter a Valid input\nPress 1 to Continue\nPress 0 to exit. Attempts left: #{3 - counter}"
    end
    # loop do
  end
  # end of verify_exit

  def verify_corrcet_menu
    puts "\n\tPress 1  - List of Movies\n\tPress 2  - Booked Status\n\tPress 3  - Cancel Booking\n\tPress 0  - Exit\n"
    counter = 0
    loop do
      response = gets.chomp
      return response.to_i if %w[0 1 2 3].include?(response)

      counter += 1
      break if counter >= 3

      puts 'please enter a valid input from Menu'
      puts "\n\tPress 1  - List of Movies\n\tPress 2  - Booked Status\n\tPress 3  - Cancel Booking\n\tPress 0  - Exit\n\tAttempts left: #{3 - counter}"
    end
  end
  # end of verify correct_menu
  
 
  def validate_password
    5.times do |i|  
      puts 'ENter Password'
      password = gets.chomp
      return puts 'Password length must be between 8 and 15 characters' unless password.length.between?(8, 15)
    
      has_upper = password.match(/[A-Z]/)
      has_lower = password.match(/[a-z]/)
      has_digit = password.match(/[0-9]/)
      has_symbol = password.match(/[!@#$%^&*_\-+=]/)
    
      return puts 'Password must include at least one uppercase letter, one lowercase letter, one digit, and one special symbol (!@#$%^&*_-+=)' unless has_upper && has_lower && has_digit && has_symbol
    
      return password
    end
  end
  
end 
