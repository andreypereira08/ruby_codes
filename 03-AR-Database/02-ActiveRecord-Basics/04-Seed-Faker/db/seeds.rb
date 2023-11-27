require "faker"
# TODO: Write a seed to insert 100 posts in the database
100.times do
    Post.create(title: Faker::Music::Prince.band, url: Faker::Internet.url)
end
