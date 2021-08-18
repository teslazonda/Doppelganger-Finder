puts 'Cleaning the DB'
Booking.destroy_all
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
puts 'User created'

puts 'Creating doppelgangers'
Doppelganger.create!(
  address: '2-8-1 Nishishinjuku, Shinjuku City, Tokyo',
  name: "Harry Potter",
  description: "I even have a scar on my forehead!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @user.id,
  photo_url: "https://metro.co.uk/wp-content/uploads/2017/01/ad_232850552.jpg?quality=90&strip=all&zoom=1&resize=480%2C480"
)
Doppelganger.create!(
  address: '2-8-1 Nishishinjuku, Shinjuku City, Tokyo',
  name: "Hermione Granger",
  description: "It's LeviohSA, not LeviOHsa",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @user.id,
  photo_url: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hermione-1609257109.jpg?resize=480:*"
)
Doppelganger.create!(
  address: '2-8-1 Nishishinjuku, Shinjuku City, Tokyo',
  name: "Walter White",
  description: "I am the one who knocks!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @user.id,
  photo_url: "https://live-production.wcms.abc-cdn.net.au/e321545c8357e7c14d3de229d05c7953?impolicy=wcms_crop_resize&cropH=595&cropW=895&xPos=105&yPos=42&width=862&height=575"
)
Doppelganger.create!(
  address: '2-8-1 Nishishinjuku, Shinjuku City, Tokyo',
  name: "Conan O\'Brien",
  description: "Just the best!",
  price: 100,
  user_id: @user.id,
  photo_url: "https://avatars.githubusercontent.com/u/25542223?v=4"
)
puts 'doppelgangers created'
# puts 'Creating new Doppelgangers from Breaking Bad'
# 5.times do
#   @dop = Doppelganger.create!(
#     name: Faker::TvShows::BreakingBad.character,
#     description: Faker::Lorem.sentence(word_count: 4),
#     price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
#     user_id: @user.id
#   )
#   @dop.photo_url = Faker::LoremFlickr.image(size: "500x600", search_terms: ["#{@dop.name.split[0]}", "#{@dop.name.split[2]}"], match_all: true)
#   @dop.save!
# end
# puts 'Breaking Bad characters created'

# puts 'Creating new Doppelgangers from Star Wars'
# 5.times do
#   @dop = Doppelganger.create!(
#     name: Faker::Movies::StarWars.character,
#     description: Faker::Lorem.sentence(word_count: 4),
#     price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
#     user_id: @user.id
#   )
#   @dop.photo_url = Faker::LoremFlickr.image(size: "500x600", search_terms: ["#{@dop.name.split[0]}", "#{@dop.name.split[2]}"], match_all: true)
#   @dop.save!
# end
# puts 'Star Wars characters created'

# puts 'Creating new Doppelgangers from Harry Potter'
# 5.times do
#   @dop = Doppelganger.create!(
#     name: Faker::Movies::HarryPotter.character,
#     description: Faker::Lorem.sentence(word_count: 4),
#     price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
#     user_id: @user.id
#   )
#   @dop.photo_url = Faker::LoremFlickr.image(size: "500x600", search_terms: ["#{@dop.name.split[0]}", "#{@dop.name.split[2]}"], match_all: true)
#   @dop.save!
# end
# puts 'Harry Potter characters created'

# puts 'Creating a very dear doppelganger to us'
# Doppelganger.create!(
#   name: 'Conan O\'Brien',
#   description: "The best Conan you have seen!",
#   price: 100,
#   photo_url: "https://avatars.githubusercontent.com/u/25542223?v=4",
#   user_id: @user.id
# )
