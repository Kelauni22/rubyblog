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
