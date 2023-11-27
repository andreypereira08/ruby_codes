require "json"
require "rest-client"
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"
response = JSON.parse(response).take(10)
response.each_with_index do |element, i|
    response_each = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{response[i]}.json"
    result = JSON.parse(response_each)
    new_post = Post.new(title: result["title"], url: result["url"], votes: result["score"])#Post.new(result)
    new_post.save
end