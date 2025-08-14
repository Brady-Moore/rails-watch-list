# frozen_string_literal: true

require 'faker'

puts 'Cleaning movies...'
Movie.destroy_all
Faker::UniqueGenerator.clear

COUNT = 12
puts "Seeding #{COUNT} movies..."

COUNT.times do
  title = Faker::Movie.unique.title
  overview = Faker::Lorem.paragraph(sentence_count: 3)

  poster_url = "https://picsum.photos/seed/#{title.parameterize}/300/450"
  rating = rand(5.0..9.9).round(1)

  Movie.create!(
    title: title,
    overview: overview,
    poster_url: poster_url,
    rating: rating
  )
end

puts "Done! #{Movie.count} movies created."
