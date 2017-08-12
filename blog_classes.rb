#Each time a new post is created, it will be an instance of the Post object

class Blog
  @@posts = [] #This will be an array of post instances
  def initialize(post)
   @@posts << @post #This puts the latest post instance into the posts array
  end

#METHODS
#Display All Posts
#Search All Posts
end

#Post has title (string), author (string), body (string), collection of tags (array),
#and comments (own class)
class Post < Comment
  attr_accessor :title :post_author :body :tags
  attr_reader :comments
  def initialize(title, post_author, body, tags, comments)
    @title = title
    @post_author = post_author
    @body = body
    @tags = tags
    @comments = comments
  #  @@tags = []
  #  @@comments = [] #This will be an array of commenets instances
    #Add each post object to the @@posts array as it's made
    #@@posts < current post

#METHODS
#Display
  def display_post #This goes in option #1 for blog.rb
    puts @title
    puts @post_author
    puts ""
    puts @body
    puts ""
    puts @tags #display each tag separated by a comma
    puts ""
    puts "COMMENTS"
    puts ""
    puts @comments #Make this a method that goes through each comment
    #and displays the author, space, comment, space, dotted line
  end
#Add
#Update
#Delete
  end
end

#Comments have an author (string) and a comment (string)
class Comment
  attr_accessor :comment
  def initialize(comment_author, comment)
    @comment_author = comment_author
    @comment = comment
  end
end

=begin

#Author has a name and a series of posts (own class).
class Author
  def initialize(name, post)
    @name = name
    @post = post
  end
end

=end
