posts = {}

#Give user choices
puts"What would you like to do?"
puts "[1] Display All Blogs"
puts "[2] Search Blogs"
puts "[3] Write a Blog"
puts "[4] Update a Blog"
puts "[5] Delete a Blog"

#get the choice from the user
choice = gets.chomp

#code for each choice in case statement
case choice
  when "1"
    puts posts
    #This must display the title, author, post, labels, and comments
  when "2"
  when "3"
  when "4"
  when "5"
  else
    puts "Your input is not an option."
    #reloop here
