#Go back through and fix quotes
require_relative 'blog_defs'
require_relative 'blog_classes'
require_relative 'blog_array'
include BLOG_ARRAY
include BLOG_DEFS

#Give user choices
puts ''
puts"What would you like to do?"
puts "[1] Read Blog Posts"
puts "[2] Search Blogs Posts"
puts "[3] Write a Blog Post"
puts "[4] Update a Blog Post"
puts "[5] Delete a Blog Post"
puts ''

#get the choice from the user
choice = gets.chomp

#code for each choice in case statement
case choice
when "1" #Display full blog with all posts
  display_posts_by_title
  puts ''
  puts "Above is a list of our blog posts. Pick the post you'd like to read by"
  puts "typing its corresponding number."
  post_num_input = gets.chomp.to_i - 1
  display_full_post(post_num_input) #Display only 1 post
  puts "Would you like to add, update, or delete a comment on this post?"
  y_or_n = gets.chomp.downcase
  comment_fun(y_or_n, post_num_input) #Add, delete, or update comments

when "2" #Search a post by title, author ,body, or tags
  search_posts

when "3" #Add a post
  add_post

when "4" #Update a posts' title, author, body, or tags
  display_posts_by_title
  puts ''
  puts 'Which post would you like to update?'
  puts '(Type the number of the corresponding blog)'
  puts ''
  post_num_input = gets.chomp.to_i - 1
  update_post(post_num_input)

when "5" #Delete a post
  display_posts_by_title
  puts ''
  puts "Which post number would you like to delete?"
  post_num_input = gets.chomp.to_i - 1
  delete_post(post_num_input)
else
  puts ERROR_MESSAGE
  #Can do a reloop here in the future
end
