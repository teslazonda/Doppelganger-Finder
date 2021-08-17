puts 'Cleaning the DB'
Doppelganger.destroy_all
User.destroy_all
puts 'DB is clean'

puts 'Creating a user'
@user = User.create!(
  first_name: "Christopher",
  last_name: "Colombus",
  email: "email@email.com",
  password: "123456"
)

puts 'Creating new Doppelgangers from Breaking Bad'
5.times do
  Doppelganger.create!(
    name: Faker::TvShows::BreakingBad.character,
    description: Faker::Lorem.sentence(word_count: 4),
    price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
    user_id: @user.id
  )
end
puts 'Breaking Bad characters created'

puts 'Creating new Doppelgangers from Star Wars'
5.times do
  Doppelganger.create!(
    name: Faker::Movies::StarWars.character,
    description: Faker::Lorem.sentence(word_count: 4),
    price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
    user_id: @user.id
  )
end
puts 'Star Wars characters created'

puts 'Creating new Doppelgangers from Harry Potter'
5.times do
  Doppelganger.create!(
    name: Faker::Movies::HarryPotter.character,
    description: Faker::Lorem.sentence(word_count: 4),
    price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
    user_id: @user.id
  )
end
puts 'Harry Potter characters created'

puts 'Creating a very dear doppelganger to us'
Doppelganger.create!(
  name: 'Conan O\'Brien',
  description: "The best Conan you have seen!",
  price: 100,
  photo_url: "https://avatars.githubusercontent.com/u/25542223?v=4",
  user_id: @user.id
)
