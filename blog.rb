require 'blog_defs'
require 'blog_classes'
#Go back through and do all single quotes
#My entire blog array
blog = []

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
  when "1" #INCOMPLETE
    display_posts_by_title
    puts "Above is a list of our blog posts. Pick the post you'd like to read by"
    puts "typing its corresponding number."
    post_num_input = gets.chomp.to_i
    display_full_post(post_num_input)
    puts 'Would you like to add a comment to this post?'
    y_or_n = gets.chomp.downcase
    add_comment(y_or_n) #Finish this in blog_defs.rb

  when "2" #INCOMPLETE
    puts "Would you like to search the Arcadia Blog by Title ('t'), Author ('a'), Tag ('g') or Text ('x')?"
    pick = gets.chomp.downcase
    case pick
    when 't'
      search_by_title() #make this!
    when 'a'
      search_by_author() #make this!
    when 'g'
      search_by_tag() #make this!
    when 'x'
      search_by_text() #make this!
    else puts 'That is not an option. Try again.'

  when "3"
   add_post

  when "4"
    puts "Which post would you like to update?"
    puts "(Type the number of the corresponding blog)"
    #display_blogs
    choice = gets.chomp

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
      #update title method
      puts "Your title has been updated."
    when "b"
      puts "Please enter the updated author."
      post_author = gets.chomp.upcase!
      #update author method
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
