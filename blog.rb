require 'blog_defs'
require 'blog_classes'
#Go back through and do all single quotes
#My entire blog array
blog = []
error = "That is not an option. Try again"

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
  puts 'Would you like to add, update, or delete a comment on this post?'
  y_or_n = gets.chomp.downcase
  comment_fun(y_or_n) #Finish this in blog_defs.rb

when "2" #COMPLETE
  puts "Would you like to search the Arcadia Blog by Title ('t'), Author ('a'), Tag ('g') or Text ('x')?"
  pick = gets.chomp.downcase
  case pick
  when 't'
    search_by_title()
  when 'a'
    search_by_author()
  when 'g'
    search_by_tags()
  when 'x'
   search_by_text()
  else puts error
when '3' #COMPLETE
  add_post

when '4' #COMPLETE
  display_posts_by_title
  puts ''
  puts 'Which post would you like to update?'
  puts '(Type the number of the corresponding blog)'
  puts ''
  choice = gets.chomp.to_i
  if choice > blogs.length
    puts error
  end
  display_full_post(choice - 1)
  puts ''
  puts 'What would you like to update?'
  puts '[a] The Title'
  puts '[b] The Author'
  puts '[c] The body of the post.'
  puts '[d] The Tags'

  selection = gets.chomp.downcase!
  case selection
  when 'a'
    puts 'Please write your new title.'
    title_input = gets.chomp
    final_title = title(title_input)
    blog[choice - 1].title = final_title
    puts "Your title has been updated to #{final_title}"
  when 'b'
    puts "Please enter the updated author."
    post_author = gets.chomp.upcase!
    blog[choice-1].post_author = post_author
    puts "The author name has been updated to #{post_author}."
  when "c"
    puts "WARNING: This will erase your entire previous blog text."
    puts "Would you still like to update it? 'y' or 'n'"
    if 'n' then break
    if 'y' then puts "Enter your new body text."
    update_body = gets.chomp
    blog[choice-1].body = update_body
    puts "The body of your blog post has been updated!"
  when "d"
    puts "Would you like to delete a tag(s) or add a tag(s)?"
    puts "To delete, type 'd' to add type 'a'"
    tag_choice = gets.chomp
    case tag_choice
    when "d"
      puts "Type the tag(s) you'd like to delete. Leave a space between each one."
      tags_input = gets.chomp
      delete_tags(tags_input)
    when "a"
      puts "Type the tag(s) you'd like to add. Leave a space between each one."
      tags_input = gets.chomp
      add_tags(tags_input)
    else
      puts error
  else puts error

when "5" #COMPLETE
  display_posts_by_title
  puts ''
  puts "Which post number would you like to delete?"
  title_num_input = gets.chomp.to_i
  delete_post(title_num_input)
else
  puts error
  #reloop here
