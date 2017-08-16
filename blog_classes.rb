#Post has title (string), author (string), body (string), collection of tags
#(array), and comments (array with class Comment instance objects)
class Post
  attr_accessor :title, :author, :body, :tags, :comments
  def initialize(title, author, body, tags, comments)
    @title = title
    @author = author
    @body = body
    @tags = tags   #This will come in as an array
    @comments = [] #Holds instances of class Comment
  end
end

#Comments have an author (string) and a comment (string)
class Comment
  attr_accessor :username, :comment
  def initialize(username, comment)
    @username = username
    @comment = comment
  end
end
