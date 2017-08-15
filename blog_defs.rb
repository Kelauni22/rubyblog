#method to display all blog posts when option #1 in main program is chosen
def display_posts_by_title #Display all blog posts (only the titles)
  blog.each {|x| print "[#{blog.index(x) + 1}]", x[:title], ", "}
end

#method to display the post chosen by the user in option #1 in main program
def display_full_post(post_num_input)
  blog.each do |x|
    if post_num_input == blog[post_num_input - 1]
      puts x[:title]
      puts x[:author]
      puts ''
      puts x[:body]
      puts ''
      puts x[:tags]
      puts ''
      puts 'COMMENTS'
      puts x[:comments]
    end
  end
end

#add a comment to the current blog post in option #1 in main program
def add_comment
  case y_or_n
  when 'y'
    add_comment() #Make This!
  when 'n'
    break
  else puts "That is not a correct input."
end

#adding a new post in option #3 in main program
def add_post
  puts "Please enter a title"
  title_input = gets.chomp
  final_title = title(title_input) #title helper method

  puts "What is your name?"
  post_author = gets.chomp.upcase!

  puts "Write your post. When finished, press enter."
  post_body = gets.chomp

  puts "List any tags for your post. Separate each with a space."
  tags_input = gets.chomp
  post_tags = tags_input.split(" ")

  blog << Post.new(final_title, post_author, post_body, post_tags)

  puts "Your post, #{final_title}, has been successfully posted to the Arcadia Blog!"
  puts '(SEE BELOW)'
  puts ''
  puts blog[blog.length-1].display_post #Can I do this?
end

#A helper method to make the title of the blog look like a normal title.
def title(title_input)
  words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but"]
  post_title = title_input.split(" ").map {|word|
      if words_no_cap.include?(word)
          word
      else
          word.capitalize!
      end
  }.join(" ")
  post_title[0].capitalize!
  return post_title
end
