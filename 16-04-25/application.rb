# frozen_string_literal: true

require_relative 'theatre'
require_relative 'screen'
require_relative 'movie'
require_relative 'ticket'
require_relative 'slot'
require_relative 'admin'
require_relative 'seat'
require_relative 'module_verify'
require 'date'
# class Application
class Application


  @@movies = [Movie.new('Sikandar', 2, 'Action'), Movie.new('chhaava ', 2, 'Adventure'), Movie.new('Minecraft', 2, 'Comedy')]
  @@theatres = [Theatre.new('PVR', 'Pune'), Theatre.new('INOX', 'Pune'), Theatre.new('Cinepolis', 'Pune')]
  @@admin = [Admin.new('pvr', 'Pvradmin@11', @@theatres[0]),Admin.new('inox','Inoxadmin@11',@@theatres[1])]
 
  @@theatres[0].screens << Screen.new(1, 3, 5)
  @@theatres[0].screens << Screen.new(2, 3, 5)

  s1 = Slot.new(Time.now, @@movies[0], @@theatres[0].screens[0])
  s2 = Slot.new(Time.now + 3 * 60 * 60, @@movies[0], @@theatres[0].screens[0])
  s3 = Slot.new(Time.now + 6 * 60 * 60, @@movies[0], @@theatres[0].screens[0])

  @@theatres[0].slots << s1
  @@theatres[0].slots << s2
  @@theatres[0].slots << s3
  @@slots = [s1, s2, s3]
  loop do
    puts "\n\nWelcome to Movie Booking Application"
    puts '1. Admin'
    puts '2. User'
    puts '3. Exit'
    print 'Please select an option: '
    response = gets.chomp.to_i
    puts '----------------------------------'
    case response
    when 1
      puts 'Enter Admin username:'
      user_name = gets.chomp
      @@admin.find do |admin|
        if admin.user_name == user_name
          puts 'Enter Password:'
          password = gets.chomp
          if admin.password == password
            @@current_loggedIn_admin = admin
            puts "Welcome Admin - #{@@current_loggedIn_admin.theatre.name}"
          else
            puts 'Invalid Password'
            exit
          end
        else
          puts 'Invalid username'
          exit
        end
      end
      puts '----------------------------------'
      puts '1 - Add Screen'
      puts '2 - Add Slot'
      print 'Please select an option: '
      response = gets.chomp.to_i
      puts '----------------------------------'
      case response
      when 1
        puts 'Enter Screen Number'
        screen_number = gets.chomp
        puts 'Enter Rows'
        row = gets.chomp.to_i
        puts 'Enter Columns'
        col = gets.chomp.to_i

        screen = Screen.new(screen_number, row, col)
        @@current_loggedIn_admin.theatre.screens << screen
      when 2
        @@movies.each do |movie|
          movie.display
        end
        puts 'Select Above Movie'
        movie_id = gets.chomp.to_i
        movie = @@movies.find { |movie| movie.id == movie_id }
        @@current_loggedIn_admin.theatre.screens.each {|screen| puts screen}
        puts 'Select SCreen from Above'
        screen_id = gets.chomp
        screen= @@current_loggedIn_admin.theatre.screens.find {|screen| screen_id = screen.id }
        puts "Enter Start Time ('yyyy,mm,dd,hh,mm')"
        start_time = Time.new(gets.chomp)
        slot = Slot.new(start_time, movie, screen)
        @@current_loggedIn_admin.theatre.slots << slot
        @@slots << slot
      end
      break
    when 2
      @@movies.each do |movie|
        movie.display
      end
      puts 'Select Above Movie'
      movie_id = gets.chomp.to_i
      movie = @@movies.find { |movie| movie.id == movie_id }

      @@theatres.each do |theatre|
        theatre.slots.each do |slot|
        puts "#{slot.id}  #{theatre.name}  #{slot.start_time.strftime('%d/%m/%Y %I:%M %p')}"  if slot.movie.id == movie.id && slot.start_time > Time.now
        end
      end

      puts 'Select Above id'
      s_id = gets.chomp.to_i
      slot = @@slots.find {|slot| slot.id == s_id}
      prev_char = "A"
      slot.screen.seats.each do |seat| 
        if seat.is_booked == true
        print ' - '
        else 

          if seat.seat_number.split("")[0] != prev_char
            puts
            prev_char = seat.seat_number.split("")[0]
          end
          print "#{seat.seat_number}  "
       end
      end
    when 3

    when 0
      break
    end
  end
  # end of most outter loop do
end
