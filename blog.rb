#Each time a new post is created, it will be an instance of the Post object


#Author has a name and a series of posts (own class).
class Author
  def initialize(name, post)
    @name = name
    @post = post
  end
end

#Post has title (string), author (string), body (string), collection of labels (array),
#and comments (own class)
class Post
  def initialize(title, author, body, labels, comments)
    @title = title
    @author = author
    @body = body
    @labels = labels
    @comments = comments
end

#Comments have an author (string) and a comment (string)
class Comments
  def initialize(author, comment)
    @author = author
    @comment = comment
end

#Ask the user for a name and password
