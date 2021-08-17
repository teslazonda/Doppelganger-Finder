puts 'Cleaning the DB'
Doppelganger.destroy_all
puts 'DB is clean'

puts 'Creating new Doppelgangers from Breaking Bad'
5.times do
  @doppelganger = Doppelganger.create(
    name: Faker::TvShows::BreakingBad.character,
    description: Faker::Lorem.sentence(word_count: 10),
    price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
    photo_url: "Faker::LoremFlickr.image(size: '500x600', search_terms: ['#{@doppelganger.name.split[0]}', '#{@doppelganger.name.split[1]}'], match_all: true)"
  )
end
puts 'Breaking Bad characters created'

puts 'Creating new Doppelgangers from Star Wars'
5.times do
  Doppelganger.create(
    name: Faker::Movies::StarWars.character,
    description: Faker::Movies::StarWars.quote,
    price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
    photo_url: "Faker::LoremFlickr.image(size: '500x600', search_terms: ['#{name.split[0]}', '#{name.split[1]}'], match_all: true)"
  )
end
puts 'Star Wars characters created'

puts 'Creating new Doppelgangers from Harry Potter'
5.times do
  Doppelganger.create(
    name: Faker::Movies::HarryPotter.character,
    description: Faker::Movies::HarryPotter.quote,
    price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
    photo_url: "Faker::LoremFlickr.image(size: '500x600', search_terms: ['#{name.split[0]}', '#{name.split[1]}'], match_all: true)"
  )
end
puts 'Harry Potter characters created'

puts 'Creating a very dear doppelganger to us'
Doppelganger.create(
  name: 'Conan O\'Brien',
  description: 'If life gives you lemons, make some kind of fruity juice.',
  price: 100,
  photo_url: "https://avatars.githubusercontent.com/u/25542223?v=4"
)
