class Example
  @@posts = [{title: "Sunrise", author: "Kelauni", body: "Because the sun came up", number: 1},
             {title: "Moonlight", author: "Kelli", body: "Because the sun went down", number: 2},
             {title: "The Tundra", author: "Charmene", body: "What environment is this?", number: 3}]

  @@hash_thing = {"title" => "Desert Dawn",
                  "author" => "Zion London"}


  def Example.display_posts
    puts @@posts
  end

  def Example.display_posts_title
    @@posts.each {|x| print "[#{x[:number]}]", x[:title], ", "}
  end

  def Example.display_full_post(post_num_input)
    @@posts.each do |x|
      if post_num_input == x[:number]
        puts x[:title]
        puts x[:author].upcase
        puts ''
        puts x[:body]
      end
    end
  end
end


class Comment
  attr_accessor :comment
  def initialize(comment_author, comment)
    @comment_author = comment_author
    @comment = comment
    @@comments = []
  end

  def Comment.add_com_to_comments(new_comment)
    @@comments << new_comment
  end
end


def new_comment
  puts "What is your name?"
  comment_author = gets.chomp.upcase
  puts "Write your comment and then press enter."
  comment = gets.chomp.capitalize!
  puts "Your comment has been posted. Thank you!"

  new_comment = Comment.new(comment_author,comment)
  return new_comment
end

Comment.add_comment_to_comments(new_comment)
print @@comments
