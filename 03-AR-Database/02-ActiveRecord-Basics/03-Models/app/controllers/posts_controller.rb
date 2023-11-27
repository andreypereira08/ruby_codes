require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    @view.display_all_posts(Post.all)#display post
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_title
    url = @view.ask_url
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    id = @view.ask_id
    title = @view.ask_title
    url = @view.ask_url
    post = Post.find(id)
    post.title = title
    post.url = url
    post.save
  end

  def destroy
    # DO NOT WRITE SQL QUERIES
    # TODO: destroy a post
    @view.display_all_posts(Post.all)
    id = @view.ask_id
    post_to_destroy = Post.find(id)
    post_to_destroy.destroy
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    @view.display_all_posts(Post.all)
    id = @view.ask_id
    post_to_upvote = Post.find(id)
    post_to_upvote.votes += 1
    post_to_upvote.save
  end
end
