puts 'Cleaning the DB'
Doppelganger.destroy_all
puts 'DB is clean'

puts 'Creating new Doppelgangers from Breaking Bad'
5.times do
  Doppelganger.create(
    name: Faker::TvShows::BreakingBad.character,
    description: Faker::Lorem.sentence(word_count: 10)
  )
end
puts 'Breaking Bad characters created'

puts 'Creating new Doppelgangers from Star Wars'
5.times do
  Doppelganger.create(
    name: Faker::Movies::StarWars.character,
    description: Faker::Movies::StarWars.quote
  )
end
puts 'Star Wars characters created'

puts 'Creating new Doppelgangers from Harry Potter'
5.times do
  Doppelganger.create(
    name: Faker::Movies::HarryPotter.character,
    description: Faker::Movies::HarryPotter.quote
  )
end
puts 'Harry Potter characters created'

puts 'Creating a very dear doppelganger to us'
Doppelganger.create(
  name: 'Conan O\'Brien',
  description: 'If life gives you lemons, make some kind of fruity juice.'
)
