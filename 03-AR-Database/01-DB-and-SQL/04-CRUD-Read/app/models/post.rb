# You can use a global variable, DB, which is an instance of SQLite3::Database
# No need to create it, you can just use it!

class Post
  # TODO  
  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    query = "SELECT * FROM posts WHERE id = ?"
    return nil if DB.execute(query, id).empty?
    result = DB.execute(query, id).first
    id = result[0]
    title = result[1]
    url = result[2]
    votes = result[3]
    return Post.new({ id: id, title: title, url: url, votes: votes })
  end

  def self.all
    query = "SELECT * FROM posts"
    return [] if DB.execute(query).empty?
    result_array = []
    result = DB.execute(query)
    result.each_with_index do |element, index|
      id = result[index][0]
      title = result[index][1]
      url = result[index][2]
      votes = result[index][3]
      result_array << Post.new({ id: id, title: title, url: url, votes: votes })  
    end
    return result_array
  end
end
