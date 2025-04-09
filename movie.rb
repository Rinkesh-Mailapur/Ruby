LIST_OF_MOVIES = { '1' => 'Culture', '2' => 'Venom' }.freeze
$arr_of_booking_details = []
$seat_time = { '1' => { '1' => [%w[A A A], %w[B B B], %w[B B B]],
                        '2' => [%w[B B A], %w[A B A], %w[B B A]],
                        '3' => [%w[B A A], %w[A A A], %w[A A A]] },
               '2' => { '1' => [%w[A A A], %w[A A A], %w[B B A]],
                        '2' => [%w[B A A], %w[B B B], %w[B B A]],
                        '3' => [%w[B B B], %w[B B B], %w[A A A]] }
             }
# seat_time

# method mobile_number
def mobile_number
  loop do
    puts 'Enter Mobile Number'
    num = gets.chomp
    return num.to_i if num.match(/^[789]\d{9}$/)

    puts 'please Enter Valid Mobile Number which starts with 7,8,9.'
  end
  # while
end
# method mobile_number

# method movie_name
def movie_name
  puts 'Available Movies:'
  loop do
    LIST_OF_MOVIES.each { |key, value| puts "#{key} - #{value}" }
    puts 'You want to continue booking ? Press 1 to continue or 0 to exit'
    response = gets.chomp.to_i
    return if response.zero?

    puts "\nSelect a movie number to proceed further for booking (e.g., '1' for Culture):"
    movie = gets.chomp
    return movie if LIST_OF_MOVIES.key?(movie)

    puts "\nPlease enter the correct movie number.\n"
  end
  # end
end
# method movie_name

# method time_slot
def time_slot
  puts 'Enter Time Slot (Press):'
  loop do
    puts "1 : 12:00 PM\n2 : 4:00 PM\n3 : 9:00 PM\n"
    slot = gets.chomp
    return slot if %w[1 2 3].include?(slot) # validating time slot

    puts '\nPlease Provide Correct Time slot from below :'
  end
  # while
end
# method time_slot

# method row_col
def row_col
  puts 'Enter Row(1-3) and Column(1-3) Respectively\n'
  loop do
    row = gets.chomp.to_i
    col = gets.chomp.to_i
    return [row, col] if (row + col).positive? && row + col < 7

    puts 'Please enter correct row and column'
  end
  # loop do
end
# method row_col

# method movie_seats_available
def movie_seats_available
  # return if movie_name.nil? 
  movie = movie_name
  slot = time_slot
  check_for_seats(movie, slot)
  loop do
    puts "Book Ticket for movie #{movie} : Press 1 to continue Press 0 to Exit"
    response = gets.chomp.to_i
    confirm_booking(movie, slot) if response == 1
    break

  end
  # loop do
end
# method movie_seats_available

# method check_for_seats if movie and slot known
def check_for_seats(movie, slot)
  $seat_time[movie][slot].each do |ele|
    puts "#{ele}  "
  end
end
# method check_for_seats

# method confirm_booking
def confirm_booking(movie, slot)
  user_name = mobile_number
  loop do
    arr_row_col = row_col
    row = arr_row_col[0]
    col = arr_row_col[1]
    if $seat_time[movie][slot][row - 1][col - 1] == 'A'
      $seat_time[movie][slot][row - 1][col - 1] = 'B'
      puts "Booking Confirmed for #{user_name} seat number #{row}#{col}"
      $arr_of_booking_details.push({ mobile: user_name, movie: LIST_OF_MOVIES[movie], slot: slot, seatno: "#{row}#{col}" }) 
      break

    end
    # end of if
    puts 'This seat is already booked please check and enter correct row and col'
  end
  # end of loop do
end
# end of confirm booking

# method booking_info
def booking_info
  puts 'Booking Details\n\n'
  counter = 1
  return puts 'No Booking Details Found' if $arr_of_booking_details.empty?

  $arr_of_booking_details.each do |i|
    puts "Booking ID #{counter} - \n"
    counter += 1
    i.each do |key, value|
      puts "#{key.to_s.upcase.ljust(10)} : #{value}"
    end
    # do
    puts "\n"
  end
  # do
end
# method booking_info

# method cancel_booking
def cancel_booking
  return puts 'There is no Booking to canel' if $arr_of_booking_details.empty?

  booking_info
  # Display booking details
  loop do
    puts 'Enter the Booking ID you want to cancel 1,2,..'
    book_id = gets.chomp.to_i
    if book_id.positive? && book_id <= $arr_of_booking_details.length
      cancel_seat = $arr_of_booking_details.delete_at(book_id - 1)
      movie_key = LIST_OF_MOVIES.key(cancel_seat[:movie]) # Get the movie key (e.g., "1" or "2")
      seatno = cancel_seat[:seatno]
      row = seatno[0].to_i
      col = seatno[1].to_i
      slot = cancel_seat[:slot]
      $seat_time[movie_key][slot][row - 1][col - 1] = 'A' # Mark seat as available
      puts "Booking ID #{book_id} has been successfully canceled."
      break
    else
      puts 'Wrong Booking ID provided. Try Again.'
    end
    # if
  end
  # loop do
end
# method cancel_booking
loop do
  puts "\tPress 1  - List of Movies\n\tPress 2  - Booked Status\n\tPress 3  - Cancel Booking\n\tPress 0  - Exit\n"
  response = gets.chomp.to_i
  case response
  when 1
    puts 'Welcome'
    movie_seats_available
  when 2
    booking_info
  when 3
    cancel_booking
  when 0
    break
  else
    puts 'Wrong selection from menu please start again'
  end
end
# end of most outter loop do
