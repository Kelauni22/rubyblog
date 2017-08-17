module BLOG_DEFS
  #Variables
  ERROR_MESSAGE = "\nThat is not an option. Try again"
  #A helper method to display all comments in a post after it's been changed
  def show_comments(post_num_input)
    puts ''
    puts '----COMMENTS----'
    BLOG[post_num_input].comments.each do |x|
      puts x.username
      puts x.comment
      puts ''
    end
    puts ''
  end

  #A helper method to display comments by number for user to choose from
  def numbered_comments(post_num_input)
    puts ''
    BLOG[post_num_input].comments.each do |x|
      puts  "[#{BLOG[post_num_input].comments.index(x) + 1}] #{x.username} - #{x.comment}"
    end
    puts ''
  end

  #method to display all blog posts (option #1)
  def display_posts_by_title #Display all blog posts (only the titles)
    puts ''
    BLOG.each {|x| puts "[#{BLOG.index(x) + 1}]" + x.title}
    puts ''
  end

  #method to display the post chosen by the user (option #1)
  def display_full_post(post_num_input)
    if post_num_input >= BLOG.length
      puts ERROR_MESSAGE
    else
      puts ''
      puts BLOG[post_num_input].title
      puts "by " + BLOG[post_num_input].author
      puts ''
      puts BLOG[post_num_input].body
      puts ''
      puts '----TAGS----'
      BLOG[post_num_input].tags.each{|x| print x," "}
      puts ''
      show_comments(post_num_input)
      puts ''
    end
  end

  def display_full_post_update_comment(post_num_input)
    display_full_post(post_num_input)
    puts "Would you like to add, update, or delete a comment on this post? 'y' or 'n'"
    y_or_n = gets.chomp.downcase
    comment_fun(y_or_n, post_num_input) #Add, delete, or update comments
  end

  #add a comment to the current blog post in option #1 in main program
  def comment_fun(y_or_n, post_num_input)
    if y_or_n == 'y'
      puts "\nWould you like to..."
      puts "[1] add a comment"
      puts "[2] delete a comment"
      puts "[3] update a comment"
      choice = gets.chomp
      case choice
      when "1"
        add_comment(post_num_input)
      when "2"
        delete_comment(post_num_input)
      when "3"
        update_comment(post_num_input)
      else
        puts ERROR_MESSAGE
      end
    elsif y_or_n == 'n'
      puts "\n nothing changed"
      puts ''
    else
      puts ERROR_MESSAGE
    end
  end

  #Searching blogs by title, author, tags, and body
  def search_posts
    #collect input from user
    puts "Search by title, author, body text or tags. Separate all words with a space."
    input = gets.chomp
    search_words = input.split(" ")
    #if the input matches anything in title, author, body, or tags...
    search_words.each do |x|
      i = 0
      while i < BLOG.length
        blog_array = []
        blog_array << BLOG[i].title
        blog_array << BLOG[i].author
        blog_array << BLOG[i].body
        tags_array = BLOG[i].tags.join(" ")
        blog_array << tags_array
    #print the title of that matching post
        blog_array.any? do |y|
          if y.include?(x)
            puts "\nYour search was found in the following title:"
            puts BLOG[i].title
            puts''
          end
        end
        i += 1
      end
    end
  end

  #add a comment to a post
  def add_comment(post_num_input)
    puts "Type in a username."
    username = gets.chomp
    puts "Type your comment"
    comment = gets.chomp
    BLOG[post_num_input].comments << Comment.new(username,comment)
    puts "Thank you #{username}! Your comment has been added to " +
    "\"#{BLOG[post_num_input].title}\"!"
    show_comments(post_num_input)
  end

  #delete a comment from a post
  def delete_comment(post_num_input)
    numbered_comments(post_num_input)
    puts "Which comment would you like to delete? (Type the corresponding number)."
    number = gets.chomp.to_i
    array_number = number - 1
    BLOG[post_num_input].comments.delete_at(array_number)
    puts ''
    puts "Comment number #{number} has been deleted."
    show_comments(post_num_input)
  end

  #update a comment in a post
  def update_comment(post_num_input)
    puts "WARNING: This will erase your entire previous comment text."
    puts "Would you still like to update it? 'y' or 'n'"
    input = gets.chomp
    if input == "n"
      puts ''
      puts "Comment unchanged"
      puts ''
    elsif input == "y"
      numbered_comments(post_num_input)
      puts "Which comment would you like to update? (Type the corresponding number)"
      comment_choice = gets.chomp.to_i
      array_number = comment_choice - 1
      puts "Type in your username."
      username = gets.chomp.downcase
      puts "Go ahead a write an updated comment."
      updated_comment = gets.chomp
      BLOG[post_num_input].comments[array_number].username = username
      BLOG[post_num_input].comments[array_number].comment = updated_comment
      puts "Your comment has been updated!"
      show_comments(post_num_input)
    else
      puts "\n" + ERROR_MESSAGE
      puts ''
    end
  end

  #adding a new post in option #3 in main program
  def add_post
    puts "Please enter a title"
    title_input = gets.chomp
    post_title = title(title_input) #title helper method

    puts "What is your name?"
    author_input = gets.chomp
    post_author = author_input.capitalize!

    puts "Write your post. When finished, press enter."
    body_input = gets.chomp
    post_body = body_input.capitalize!

    puts "List any tags for your post. Separate each with a space."
    tags_input = gets.chomp
    post_tags = tags_input.split(" ")

    BLOG << Post.new(post_title, post_author, post_body, post_tags, comments = [])
    puts ''
    puts "Your post, #{post_title}, has been successfully posted to the Arcadia Blog!"
    puts '(SEE BELOW)'
    puts ''
    puts display_full_post(BLOG.length - 1)
  end

  #A helper method to make the title of the blog look like a normal title.
  def title(title_input)
    words_no_cap = ["and", "or", "the", "over", "to", "the", "a", "but", "is", "in"]
    post_title = title_input.split(" ").map {|word|
        if words_no_cap.include?(word)
            word
        else
            word.capitalize!
        end
    }
    post_title[0] = post_title[0].capitalize
    post_title.join(" ")
  end

 #update post by title, author, body, or tags
  def update_post(post_num_input)
    if post_num_input >= BLOG.length
      puts ERROR_MESSAGE
    else
      display_full_post(post_num_input)
      puts ''
      puts "What would you like to update?"
      puts "[a] The Title"
      puts "[b] The Author"
      puts "[c] The body of the post."
      puts "[d] The Tags"
      puts ''
      input = gets.chomp
      selection = input.downcase
      case selection
      when "a"
        puts 'Please write your new title.'
        title_input = gets.chomp
        final_title = title(title_input)
        BLOG[post_num_input].title = final_title
        puts "\nYour title has been updated to \"#{final_title}\""
      when "b"
        puts "Please enter the updated author."
        post_author = gets.chomp.capitalize!
        BLOG[post_num_input].author = post_author
        puts "\nThe author name has been updated to #{post_author}."
      when "c"
        puts "WARNING: This will erase your entire previous blog text."
        puts "Would you still like to update it? 'y' or 'n'"
        input = gets.chomp
        if input == 'n'
          puts ''
          puts "Blog text unchanged"
          puts ''
        elsif input == "y"
          puts "Enter your new body text."
          update_body = gets.chomp
          BLOG[post_num_input].body = update_body
          puts "\nThe body of your blog post has been updated!"
        else
          puts ERROR_MESSAGE
        end
      when "d"
        puts "Would you like to delete a tag(s) or add a tag(s)?"
        puts "To delete, type 'd' to add type 'a'"
        tag_choice = gets.chomp
        case tag_choice
        when "d"
          puts ''
          puts BLOG[post_num_input].tags
          puts "\nType the tag(s) you'd like to delete. Leave a space between each one."
          tags_input = gets.chomp
          delete_tags(post_num_input,tags_input)
        when "a"
          puts "Type the tag(s) you'd like to add. Leave a space between each one."
          tags_input = gets.chomp
          add_tags(post_num_input, tags_input)
        else
          puts ERROR_MESSAGE
        end
      end
    end
  end

  #method to delete tags from a post while updating tags in option #4 in the main program
  def delete_tags(post_num_input, tags_input)
    tags_to_delete = tags_input.split(" ")
    tags_to_delete.each do |y|
      BLOG[post_num_input].tags.delete_if {|x| x == y}
    end
    puts ''
    puts 'Your tags have been deleted'
    puts BLOG[post_num_input].tags
    puts ''
  end

  #method to add tags to existing post when updating tags in option #4 of main program
  def add_tags(post_num_input, tags_input)
    tags_to_add = tags_input.split(" ")
    tags_to_add.each do |x|
      BLOG[post_num_input].tags << x
    end
    puts ''
    puts 'Your tags have been added'
    puts BLOG[post_num_input].tags
    puts ''
  end

  #method to delete a post from blog for option #5 of main program
  def delete_post(post_num_input)
    BLOG.delete_at(post_num_input)
    puts "\nSuccessfully deleted!"
    puts ''
    display_posts_by_title
  end
end
