class Example
  @@posts = [{title: "Sunrise", author: "Kelauni", number: 1},
             {title: "Moonlight", author: "Kelli", number: 2},
             {title: "The Tundra", author: "Charmene", number: 3}]

  @@hash_thing = {"title" => "Desert Dawn",
                  "author" => "Zion London"}


  def Example.display_posts
    puts @@posts
  end

  def Example.display_posts_title
    @@posts.each {|x| print "[#{x[:number]}]", x[:title], ", "}
  end
end

Example.display_posts_title
