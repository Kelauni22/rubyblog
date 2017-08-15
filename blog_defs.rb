error = "That is not an option. Try again"
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
def comment_fun
  case y_or_n
  when 'y'
    puts "Would you like to..."
    puts "[1] add a comment"
    puts "[2] delete a comment"
    puts "[3] update a comment"
    choice = gets.chomp
    case choice
    when "1"
      add_comment()
    when "2"
      delete_comment()
    when "3"
      update_comment()
    else puts error
  when 'n'
    break
  else puts error
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

#method to delete tags from a post while updating tags in option #4 in the main program
def delete_tags(tags_input)
  tags_to_delete = tags_input.split(" ")
  blog[choice-1].tags.each do |x|
    tags_to_delete.each do |y|
      if x == y
        blog[choice-1].tags -= x
      end
    end
  end
end

#method to add tags to existing post when updating tags in option #4 of main program
def add_tags(tags_input)
  tags_to_add = tags_input.split(" ")
  tags_to_add.each do |x|
    blogs[choice-1].tags << x
  end
end

#method to delete a post from blog for option #5 of main program
def delete_post(title_num_input)
  to_delete = title_num_input - 1
  blog.delete_at(to_delete)
  return blog
  puts "Title #{blog[to_delete]} has been deleted."
end

#All Searching Methods for Option #2 in main program
#Search by title
def search_by_title
  puts "Type in all or part of the title you'd like to find."
  input = gets.chomp.downcase
  blog.each {|x| x.title.grep(/^#{input}/)} #can I do this?
end
#Search by author
def search_by_author
  puts "Type in all or part of the author's name to display all of his/her posts."
  input = gets.chomp.downcase
  blog.each {|x| x.post_author.grep(/^#{input}/)}
end
#Search by tags
def search_by_tags
  puts "Type in one or more tags to find posts. (Separate each by a space.)"
  input = gets.chomp.downcase
  input_array = input.split(" ")
  blog.each do |x|
    input_array.each do |y|
      if x.tags.select {|s| s.include? y} #Do I have to return something here to display the post(s)
    end
  end
end
#Search by text
def search_by_text
  puts "Type in one or more words to find corresponding posts. (Separate each by a space.)"
  input = gets.chomp.downcase
  input_array = input.split(" ")
  blog.each do |x|
    input_array.each do |y|
      if x.body.select {|s| s.include? y} #Do I have to return something here to display the post(s)
    end
  end
end
