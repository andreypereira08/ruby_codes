class PostsView
  # TODO: implement some methods here when controller needs to `puts` or `gets`
  def display_all_posts(all_posts)
    all_posts.each do |post|
      puts "\nid: #{post.id} | title: #{post.title} - votes: #{post.votes} | url: #{post.url}"
    end
  end

  def ask_title
    puts "\n--\ntype the title post"
    gets.chomp
  end

  def ask_url
    puts "\n--\ndigit the url post"
    gets.chomp
  end

  def ask_id
    puts "\n--\ndigit the id post for this action"
    gets.chomp.to_i
  end
end
