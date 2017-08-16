module BLOG_DEFS
  #Variables
  #error = "That is not an option. Try again"
  #A helper method to display all comments in a post after it's been changed
  def show_comments(post_num_input)
    puts ''
    puts '----COMMENTS----'
    BLOG[post_num_input][:comments].each do |x|
      x.each_value {|y| puts y}
    end
    puts ''
  end
  #A helper method to display comments by number for user to choose from
  def numbered_comments(post_num_input)
    puts ''
    BLOG[post_num_input][:comments].each do |x|
      puts  "[#{BLOG[post_num_input][:comments].index(x) + 1}] #{x[:username]} - #{x[:comment]}"
    end
    puts ''
  end
=begin
  #method to display all blog posts (option #1)
  def display_posts_by_title #Display all blog posts (only the titles)
    BLOG.each {|x| print "[#{BLOG.index(x) + 1}]", x[:title], ", "}
  end

  #method to display the post chosen by the user (option #1)
  def display_full_post(post_num_input)
    puts ''
    puts BLOG[post_num_input][:title]
    puts "by " + BLOG[post_num_input][:author]
    puts ''
    puts BLOG[post_num_input][:body]
    puts ''
    puts '----TAGS----'
    BLOG[post_num_input][:tags].each{|x| print x," "}
    puts ''
    show_comments(post_num_input)
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


  #add a comment to a post
  def add_comment(post_num_input)
    puts "Type in a username."
    username = gets.chomp
    puts "Type your comment"
    comment = gets.chomp
    BLOG[post_num_input][:comments] << Comment.new(username,comment)
    puts "Thank you #{username}! Your comment has been added to " +
    "\"#{BLOG[post_num_input][:title]}\"!"
  end

  #delete a comment from a post
  def delete_comment(post_num_input)
    numbered_comments(post_num_input)
    puts "Which comment would you like to delete? (Type the corresponding number)."
    number = gets.chomp.to_i
    array_number = number - 1
    BLOG[post_num_input][:comments].delete_at(array_number)
    puts ''
    puts "Comment number #{number} has been deleted."
    show_comments(post_num_input)
  end
=end

  #update a comment in a post
  def update_comment(post_num_input)
    puts "WARNING: This will erase your entire previous comment text."
    puts "Would you still like to update it? 'y' or 'n'"
    input = gets.chomp
    if input == 'n'
      puts ''
      puts "Comment unchanged"
      puts ''
    elsif input == 'y'
      numbered_comments(post_num_input)
      puts "Which comment would you like to update? (Type the corresponding number)"
      comment_choice = gets.chomp.to_i
      array_number = comment_choice - 1
      puts "Type in your username."
      username = gets.chomp.downcase
      puts "Go ahead a write an updated comment."
      updated_comment = gets.chomp
      BLOG[post_num_input][:comments][array_number][:username] = username
      BLOG[post_num_input][:comments][array_number][:comment] = updated_comment
      puts "Your comment has been updated!"
      show_comments(post_num_input)
    else
      puts "\nThat is not an option."
      puts ''
    end
  end
=begin
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
=end
end
