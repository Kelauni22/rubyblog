#Post has title (string), author (string), body (string), collection of tags (array),
#and comments (own class)
class Post < Comment
  @@posts = []
  @@number = 0
  attr_accessor :title :post_author :body :tags
  attr_reader :number
  def initialize(title, post_author, body, tags, comments)
    super #I want to take the attributes from the comments
    @title = title
    @post_author = post_author
    @body = body
    @tags = tags
    @comments = comments
    @@number += 1
    @number = @@number
  #  @@tags = []
  #  @@comments = [] #This will be an array of commenets instances
    #Add each post object to the @@posts array as it's made
    #@@posts < current post
  end
#METHODS
#display_post
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
#Add_post - may involve a class variable to add the new instance to the blog array
#Update_post
 def update_title=(value)
   self.@title = value
 end

 def update_post_author=(value)
   self.@post_author = value
 end

 def update_body=(value)
   self.@body = value
 end

 def add_tags=(array)
   self.tags << array #this is wrong
 end

 def del_tags=(array)
   array.each do
     #if statement asking if the array matches any in the tags array
     #if it does, delete it
     #return the new tags array
    end
 end
#Delete_post

end

#CLASS METHODS
#Add to @@posts array
  def Posts.add_to_posts_array
    #Use .push
  end
#Display All Posts by Title
  def Posts.display_posts_by_title
    @@posts.each {|x| print "[#{x[:number]}]", x[:title], ", "}
  end
#Display full individual post
  def Posts.display_full_post(post_num_input)
    @@posts.each do |x|
      if post_num_input == x[:number]
        puts x[:title]
        puts x[:author]
        puts ''
        puts x[:body]
        puts ''
        puts x[@tags]
        puts ''
        puts x[@comments]
      end
    end
  end
end
#Search All Posts

#Comments have an author (string) and a comment (string)
class Comment
  attr_accessor :comment
  def initialize(comment_author, comment)
    @comment_author = comment_author
    @comment = comment
  end
end
