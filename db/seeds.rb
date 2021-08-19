require "open-uri"

puts 'Cleaning the DB'
Booking.destroy_all
Doppelganger.destroy_all
User.destroy_all
puts 'DB is clean'

puts 'Creating a user'

@users = (
User.create!(
  first_name: "Christopher",
  last_name: "Columbus",
  email: "columbus@email.com",
  password: "123456"
)

User.create!(
  first_name: "Frank",
  last_name: "Columbo",
  email: "columbo@email.com",
  password: "123456"
)

User.create!(
  first_name: "Pikachu",
  last_name: "Pokemon",
  email: "pikachu@email.com",
  password: "123456"
)

User.create!(
  first_name: "Kakarot",
  last_name: "Goku",
  email: "kakarot@email.com",
  password: "123456"
)

User.create!(
  first_name: "Jean-Claude",
  last_name: "Van Damme",
  email: "jean-claude@email.com",
  password: "123456"
)
)

puts 'User created'

puts 'Creating doppelgangers' # Changed for cloudinary. We take the photo url, use it to upload a photo, and if a photo gets attached we save.

file = URI.open("https://metro.co.uk/wp-content/uploads/2017/01/ad_232850552.jpg?quality=90&strip=all&zoom=1&resize=480%2C480")
dop1 = Doppelganger.new(
  address: '2-3-1 Asakusa, Taito City, Tokyo',
  name: "Harry Potter",
  description: "I even have a scar on my forehead!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)
dop1.photo.attach(io: file, filename: 'Harry-Potter.jpg', content_type: 'image/png')
dop1.save! if dop1.photo.attached?

# seeding second doppelganger

file = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hermione-1609257109.jpg?resize=480:*")
dop2 = Doppelganger.new(
  address: '1-5-9 Yaesu, Chuo City, Tokyo',
  name: "Hermione Granger",
  description: "It's LeviOHsa, not LeviohSA",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop2.photo.attach(io: file, filename: 'Hermione-Granger.jpg', content_type: 'image/png')
dop2.save! if dop2.photo.attached?

# seeding third doppelganger

file = URI.open("https://live-production.wcms.abc-cdn.net.au/e321545c8357e7c14d3de229d05c7953?impolicy=wcms_crop_resize&cropH=595&cropW=895&xPos=105&yPos=42&width=862&height=575")
dop3 = Doppelganger.new(
  address: '2-8-1 Nishishinjuku, Shinjuku City, Tokyo',
  name: "Walter White",
  description: "I am the one who knocks!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop3.photo.attach(io: file, filename: 'Walter-White.jpg', content_type: 'image/png')
dop3.save! if dop3.photo.attached?

# seeding fourth doppelganger, Doug

file = URI.open("https://avatars.githubusercontent.com/u/25542223?v=4")
dop4 = Doppelganger.new(
  address: '2-11-3 Meguro, Meguro City, Tokyo',
  name: "Conan O\'Brien",
  description: "Just the best!",
  price: 100,
  user_id: @users.sample
)

dop4.photo.attach(io: file, filename: 'Doug.jpg', content_type: 'image/png')
dop4.save! if dop4.photo.attached?

# Seeding fifth doppelganger

file = URI.open("https://imgur.com/g3n8D8A")
dop5 = Doppelganger.new(
  address: 'Sunshine City',
  name: "Johnny Bravo",
  description: "Want to see me comb my hair really fast?",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop5.photo.attach(io: file, filename: 'bravo.jpg', content_type: 'image/png')
dop5.save! if dop5.photo.attached?

# Seeding sixth doppelganger

file = URI.open("https://www.carsandstars.nl/wp-content/uploads/2018/05/www.CARSandSTARS.nl-Bruce-Willis-Lookalike-2.jpg")
dop6 = Doppelganger.new(
  address: 'Tokyo Dome',
  name: "John McClane",
  description: "Yippee Ki Yay!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop6.photo.attach(io: file, filename: 'mcclane.jpg', content_type: 'image/png')
dop6.save! if dop6.photo.attached?

# Seeding seventh doppelganger

file = URI.open("https://lookalikes.co.uk/wp-content/uploads/2018/09/41340174_694920370888495_7084624562788237312_n.jpg")
dop7 = Doppelganger.new(
  address: 'Tokyo Skytree',
  name: "Vin Diesel",
  description: "I live my life a quarter mile at a time",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop7.photo.attach(io: file, filename: 'diesel.jpg', content_type: 'image/png')
dop7.save! if dop7.photo.attached?

# Seeding eight doppelganger

file = URI.open("https://imgur.com/TWOnVJK")
dop8 = Doppelganger.new(
  address: 'Tokyo station',
  name: "Barack Obama",
  description: "Thanks Obama!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop8.photo.attach(io: file, filename: 'obama.jpg', content_type: 'image/png')
dop8.save! if dop8.photo.attached?

# Seeding ninth doppelganger

file = URI.open("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fqph.fs.quoracdn.net%2Fmain-qimg-252b1af41af82bc478580abcf38e7ad4&f=1&nofb=1")
dop9 = Doppelganger.new(
  address: 'Waseda university',
  name: "Austin Powers",
  description: "Groovy baby, yeah!",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop9.photo.attach(io: file, filename: 'powers.jpg', content_type: 'image/png')
dop9.save! if dop9.photo.attached?

# Seeding tenth doppelganger

file = URI.open("https://media.indiatimes.in/media/content/2015/Aug/11825136_839158282858808_4556573789414508041_n_1439622131.jpg")
dop10 = Doppelganger.new(
  address: 'Roppongi Hills',
  name: "Ghandi",
  description: "Be the change you want to see in the world.",
  price: [1000, 1500, 2000, 2500, 3000, 3500, 4000].sample,
  user_id: @users.sample
)

dop10.photo.attach(io: file, filename: 'ghandi.jpg', content_type: 'image/png')
dop10.save! if dop10.photo.attached?

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
