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
