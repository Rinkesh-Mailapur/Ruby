LIST_OF_MOVIES = {"1" => "Culture" , "2"=>"Venom"}
$arr_of_booking_details = Array.new()
$seat_time = {
  "1" => { 
      "1" => [
          ['A', 'B', 'A'],  # 12:00 PM show
          ['A', 'A', 'A'],
          ['B', 'A', 'B']
      ],
      "2" => [
          ['A', 'A', 'A'],  # 4:00 PM show
          ['A', 'A', 'A'],
          ['A', 'A', 'A']
      ],
      "3" => [
          ['A', 'A', 'A'],  # 9:00 PM show
          ['A', 'A', 'A'],
          ['A', 'A', 'A']
      ]
  } ,
  "2" => { 
      "1" => [
          ['B', 'B', 'A'],  # 12:00 PM show
          ['A', 'B', 'A'],
          ['B', 'A', 'B']
      ],
      "2" => [
          ['B', 'B', 'A'],  # 4:00 PM show
          ['A', 'A', 'A'],
          ['A', 'B', 'B']
      ],
      "3" => [
          ['A', 'A', 'A'],  # 9:00 PM show
          ['A', 'A', 'A'],
          ['A', 'A', 'A']
      ]
  }

} #seat_time

#method mobile_number
def mobile_number
  while true
    puts "Enter Mobile Number"
    num = gets.chomp
    return num.to_i if num.match(/^[789]\d{9}$/)
    puts "please Enter Valid Mobile Number"
  end #while
end  #method mobile_number

#method movie_name
def movie_name
  puts "Available Movies:"
  while true
    LIST_OF_MOVIES.each { |key, value|  puts "#{key} - #{value}" } 
    puts "\nSelect a movie number to proceed further for booking (e.g., '1' for Culture):"
    movie = gets.chomp
    return movie if LIST_OF_MOVIES.has_key?(movie)
    puts "\nPlease enter the correct movie number.\n"
  end #end
end #method movie_name

#method time_slot
def time_slot
  puts "Enter Time Slot (Press):"
  while true
    puts "1 : 12:00 PM\n2 : 4:00 PM\n3 : 9:00 PM\n"
    slot = gets.chomp
    return slot if ["1","2","3"].include?(slot)
    puts "\nPlease Provide Correct Time slot from below :"
  end #while
end #method time_slot

#method row_col
def row_col
  puts "Enter Row(1-3) and Column(1-3) Respectively\n"
  while true
    row = gets.chomp.to_i
    col = gets.chomp.to_i
    return [row,col] if row+col > 0 && row+col < 7
    puts "Please enter correct row and column"
  end #true
end #method row_col

#method movie_seats_available
def movie_seats_available
  movie = movie_name
  slot  = time_slot
  check_for_seats(movie,slot)
  while true
    puts "Book Ticket for movie #{movie} : Press 1 to continue Press 0 to Exit"
    response = gets.chomp.to_i
    confirm_booking(movie,slot) if response == 1
    break
  end #while
end #method movie_seats_available

#method check_for_seats if movie and slot known
def check_for_seats(movie,slot)
  for i in 0..2
    for j in 0..2
      $seat_time[movie][slot][i][j] == 'A' ? (print ($seat_time[movie][slot][i][j] + "  ")) :(print("   "))
    end #inner for
    puts ""
    i += 1
  end # end otter for
end #method check_for_seats

#method confirm_booking
def confirm_booking(movie,slot)
  user_name   = mobile_number
  while true
    arr_row_col = row_col
    row = arr_row_col[0]
    col = arr_row_col[1]
    if( $seat_time[movie][slot][row-1][col-1] == 'A' )
      $seat_time[movie][slot][row-1][col-1] = 'B'
      puts "Booking Confirmed for #{user_name} seat number #{row}#{col}"
      $arr_of_booking_details.push({ mobile:user_name , movie:LIST_OF_MOVIES[movie] , slot:slot , seatno:"#{row}#{col}" }) 
      break
    end #end of if
      puts "This seat is already booked please check and enter correct row and col"
  end#end of while         
end #end of confirm booking

#method booking_info
def booking_info
  puts "Booking Details\n\n"
  counter = 1
  $arr_of_booking_details.each do |i|
    puts "Booking ID #{counter} - \n"
    counter+=1
    i.each do |key,value| 
      puts "#{key.to_s.upcase.ljust(10)} : #{value}" 
    end  #do
    puts "\n"
  end  #do
end #method booking_info

#method cancel_booking
def cancel_booking
  booking_info  # Display booking details
  while true
    puts "Enter the Booking ID you want to cancel 1,2,.."
    book_id = gets.chomp.to_i
    if book_id > 0 && book_id <= $arr_of_booking_details.length
      cancel_seat = $arr_of_booking_details.delete_at(book_id - 1)
      movie_key = LIST_OF_MOVIES.key(cancel_seat[:movie]) # Get the movie key (e.g., "1" or "2")
      seatno = cancel_seat[:seatno]
      row = seatno[0].to_i
      col = seatno[1].to_i
      slot = cancel_seat[:slot]
      $seat_time[movie_key][slot][row - 1][col - 1] = "A"  # Mark seat as available
      puts "Booking ID #{book_id} has been successfully canceled."
      break
    else
      puts "Wrong Booking ID provided. Try Again."
    end #if
  end #while
end #method cancel_booking

while true
  puts"\tPress 1  - List of Movies\n"  +
      "\tPress 2  - Booked Status\n"+
      "\tPress 3  - Cancel Booking\n"+
      "\tPress 0  - Exit\n"
  response = gets.chomp.to_i
  case response
    when 1
      puts "Welcome"
      movie_seats_available
    when 2
      booking_info
    when 3
      cancel_booking
    when 0
      break
    else
      puts "Wrong selection from menu please start again"
  end
end  #end of most outter While n4_correct
