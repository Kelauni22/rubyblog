def title(title_input)
  words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
  post_title = title_input.split(" ").map {|word|
      if words_no_cap.include?(word)
          word
      else
          word.capitalize!
      end
  }.join(" ") # I replaced the "end" in "end.join(" ") with "}" because it wasn't working in Ruby 2.1.1
  post_title[0].capitalize!
  #Store this title somewhere
end

posts = {}

#Give user choices
puts"What would you like to do?"
puts "[1] Read Blogs"
puts "[2] Search Blogs"
puts "[3] Write a Blog"
puts "[4] Update a Blog"
puts "[5] Delete a Blog"

#get the choice from the user
choice = gets.chomp


#code for each choice in case statement
case choice
  when "1"
    puts "Here is a list of our blog posts. Which would you like to read?"
    puts "(Type the number of the corresponding title)"
    #Display all blog posts (only the titles)
    post_num_input = gets.chomp.to_i
    #Display the title, author, post, labels, and comments
    puts "Would you like to add a comment? 'Y' or 'N'"
    y_or_n = gets.chomp.upcase
    case y_or_n
    when "Y"
      puts "What is your name?"
      comment_name = gets.chomp.upcase
      puts "Write your comment and then press enter."
      post_comment = gets.chomp.capitalize!
      puts "Your comment has been posted. Thank you!"
    when "N"
      break
    else puts "That is not a correct input."

  when "2"
    #Figure out searching in Ruby
  when "3"
    puts "Please enter a title"
    title_input = gets.chomp
    title(title_input) #This is the title method. Why isn't it linking?

    puts "What is your name?"
    post_author = gets.chomp.upcase!

    puts "Write your post. When finished, press enter."
    post_body = gets.chomp

    puts "List any tags for your post. Separate each with a space."
    tags_input = gets.chomp
    post_tags = tags_input.split(" ")

    puts "Your post, #{post_title}, has been posted to the Arcadia Blog!"

  when "4"
    puts "What would you like to update?"
    puts "[a] The Title"
    puts "[b] The Author"
    puts "[c] The body of the post."
    puts "[d] The tags"

    selection = gets.chomp.downcase!

    case selection
    when "a"
      puts "Please write your new title."
      title_input = gets.chomp
      title(title_input) #This is the title method
      puts "Your title has been updated."
    when "b"
      puts "Please enter the updated author."
      post_author = gets.chomp.upcase!
      puts "The author name has been updated."
    when "c"
      #How can I make the old post editable?
    when "d"
      puts "Would you like to delete a tag(s) or add a tag(s)?"
      puts "To delete, type 'd' to add type 'a'"
      tag_choice = gets.chomp

      case tag_choice
      when "d"
        puts "type the tag(s) you'd like to delete. Leave a space between each one."
        #Create a loop in a loop that checks to see if each word is there and if it is, delete it from the tags array.
      when "a"
        puts "Type the tag(s) you'd like to add. Leave a space between each one."
        #Parse the string into an array and add each new tag to the existing tag array.
      else
        puts "Sorry, that is not a choice."
    else puts "That is not an option. Try again."

  when "5"
    puts "Here is a list of every blog title."
    #display all title of every blog post
    puts "Which number would you like to delete?"
    title_num_input = gets.chomp.to_i
    #delete that title
    puts "Title ##{title_num_input} has been deleted." #Maybe instead, display the actual title.
  else
    puts "Your input is not an option."
    #reloop here
