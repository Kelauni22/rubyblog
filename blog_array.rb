module BLOG_ARRAY
  BLOG= [Post.new("Sunrise","Kelauni","Because the sun came up and flowers are blooming",
         ["sun","earth","happy","love","romance"],
         [Comment.new("happy_kitty","This story made me think of pancakes and love"),
          Comment.new("sad_kitty","This story made me want to barf. Love is for losers!")
         ]),
         Post.new("Moonlight","Kelli","Because the sun went down and I'm sleepy",
         ["moon","night","sleep","divorce","danger","romance"],
         [Comment.new("lovely_kitty","Awww! The nighttime also makes me cry. I can relate."),
          Comment.new("forgetful_kitty","I can't remember how to feel about this story....")
        ]),
         Post.new("The Desert","Charmene","It's getting hot in here, so take off all your clothes",
         ["hot","desert","earth","erotica","danger","romance"],
         [Comment.new("freaky_kitty","I read this with my clothes off. hehehe"),
          Comment.new("nun_kitty","I'm reporting your comment @freaky_kitty! Jesus is watching!")
        ])]
end
