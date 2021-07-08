require 'open-uri'

# Optional: you can delete existing data by uncommenting below 2 lines
User.all.destroy
Costume.all.destroy

user1 = User.create!(email: "1user@user.com", first_name: "Mary", last_name: "Smith", password: "123456")
user2 = User.create!(email: "2user@user.com", first_name: "Adam", last_name: "Sandler", password: "123456")
user3 = User.create!(email: "3user@user.com", first_name: "Joe", last_name: "Collins", password: "123456")
user4 = User.create!(email: "4user@user.com", first_name: "Phil", last_name: "Collins", password: "123456")
user5 = User.create!(email: "5user@user.com", first_name: "Amy", last_name: "Adams", password: "123456")

puts "Creating stuff"

costume = Costume.new(title: "Little Mermaid Women's Ursula Prestige Costume", description: "This is a Little Mermaid Womens Ursula Prestige Costume.",
  price: 10, user_id: user1.id)

file = URI.open('https://images.halloweencostumes.com.au/products/59364/1-1/disney-little-mermaid-womens-ursula-prestige-costume.jpg')
costume.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume.save!

costume2 = Costume.new(title: "Adult Mermaid Costume", description: "So why don't you slip into this cute undersea ensemble, and make some waves of your own?!",
  price: 25, user_id: user1.id)
file = URI.open('https://images.halloweencostumes.com.au/products/32722/1-1/adult-mermaid-costume.jpg')
costume2.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume2.save!

costume3 = Costume.new(title: "Adult Beast Ultra Prestige Costume", description: "Anyway, even though your social life is non-existent and your moral character is totally shot, you should still keep this Adult Beast Ultra Prestige Costume around just in case some good-hearted, book-loving brunette comes stumbling into the castle to inspire you to love and thus break the spell! ",
  price: 50, user_id: user2.id)
file = URI.open('https://images.halloweencostumes.com.au/products/39620/1-1/adult-beast-ultra-prestige-costume.jpg')
costume3.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume3.save!

costume4 = Costume.new(title: "Inflatable Mr. Potato Head Adult Costume", description: "This clever costume looks just like everyone's beloved childhood toy, but without all the spare parts to misplace throughout the night's festivities. It features Mr. Tater's signature mustache, red nose, eyes, ears, top hat, and glove-topped hands. All that fun, plus, who doesn't love a costume that offers total anonymity? You'll be unrecognizable as yourself, but instantly beloved by all!",
  price: 10, user_id: user2.id)
file = URI.open('https://images.halloweencostumes.com.au/products/47928/1-1/inflatable-mr-potato-head-adult-costume.jpg')
costume4.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume4.save!

costume5 = Costume.new(title: "Beauty and the Beast Men's Gaston Costume", description: "The long red tunic is equipped with soft-sculpted pectoral and bicep muscles, while a big yellow collar frames the neck. A faux leather belt with a large ornate gold buckle is sewn to the front waistline. Finally, slip on the yellow gloves and cartoonish boot covers to have the complete charming look. Flash a toothy Disney-prince grin to elevate the costume.",
  price: 30, user_id: user2.id)
file = URI.open('https://images.halloweencostumes.com.au/products/46680/1-1/disney-beauty-and-the-beast-gaston-mens-costume-update.jpg')
costume5.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume5.save!

costume6 = Costume.new(title: "Toy Story Women's Jessie Classic Costume", description: "This is a Toy Story Women's Jessie Classic Costume.",
  price: 10, user_id: user2.id)
file = URI.open('https://images.halloweencostumes.com.au/products/60476/1-1/toy-story-womens-jessie-classic-costume.jpg')
costume6.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume6.save!

costume7 = Costume.new(title: "Prince Eric Deluxe Men's Costume", description: "The costume comes with everything you need (sans perfect hairstyle and boat) to become the Disney Prince! The shirt, pants, sash and boot tops will help give you a rugged sailor-prince style, which is perfect for winning the heart of any mermaid. This is a simple shirt with a fastener in the back, and a wide nautical collar.",
  price: 10, user_id: user3.id)
file = URI.open('https://images.halloweencostumes.com.au/products/43234/1-1/prince-eric-deluxe-mens-costume.jpg')
costume7.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume7.save!

costume8 = Costume.new(title: "Cinderella Fairy Godmother Plus Size Costume", description: "It's a beautiful blue sleeveless dress with an attached petticoat and a pretty printed pattern. The short, hooded jacket matches the dress design, and the brilliant pink bow complements your appearance. Get ready to wave that wand, lady, because you look simply magical!",
  price: 15, user_id: user3.id)
file = URI.open('https://images.halloweencostumes.com.au/products/55666/1-1/adult-plus-size-fairy-godmother-costume.jpg')
costume8.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume8.save!

puts "Halfway creating stuff"

costume9 = Costume.new(title: "Monsters Inc Sulley Inflatable Costume", description: "This is an Monsters Inc Adult Sulley Inflatable Costume.",
  price: 22, user_id: user4.id)
file = URI.open('https://images.halloweencostumes.com.au/products/68213/1-1/monsters-inc-adult-sulley-inflatable-costume.jpg')
costume9.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume9.save!

costume10 = Costume.new(title: "Disney Toy Story Adult Buzz Lightyear Inflatable Costume", description: "This is a Toy Story Adult Buzz Lightyear Inflatable Costume.",
  price: 18, user_id: user4.id)
file = URI.open('https://images.halloweencostumes.com.au/products/59154/1-1/toy-story-adult-buzz-lightyear-inflatable-costume.jpg')
costume10.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume10.save!

costume11 = Costume.new(title: "Brave Merida Costume for Women", description: "This is a Brave Women's Merida Costume.",
  price: 18, user_id: user4.id)
file = URI.open('https://images.halloweencostumes.com.au/products/67314/1-1/brave-womens-merida-costume.jpg')
costume11.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume11.save!

costume12 = Costume.new(title: "Tangled Adult Deluxe Rapunzel Costume", description: "This is a Tangled Adult Deluxe Rapunzel Costume.",
  price: 28, user_id: user4.id)
file = URI.open('https://images.halloweencostumes.com.au/products/66303/1-1/tangled-adult-deluxe-rapunzel-costume.jpg')
costume12.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume12.save!

costume13 = Costume.new(title: "Emperor's New Groove Kuzco Men's Costume", description: "This is a Emperor's New Groove Kuzco Men's Costume.",
  price: 23, user_id: user5.id)
file = URI.open('https://images.halloweencostumes.com.au/products/46810/1-1/disney-emperors-new-groove-kuzco-mens-costume-update.jpg')
costume13.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume13.save!

costume14 = Costume.new(title: "The Incredibles Mr. Incredible Men's Costume", description: "This is a The Incredibles Mr. Incredible Men's Costume.",
  price: 33, user_id: user5.id)
file = URI.open('https://images.halloweencostumes.com.au/products/2984/1-1/adult-mr-incredible-costume.jpg')
costume14.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume14.save!

costume15 = Costume.new(title: "The Incredibles 2 Deluxe Mrs. Incredible Women's Costume", description: "This is a Incredibles 2 Deluxe Mrs. Incredible Women's Costume.",
  price: 39, user_id: user5.id)
file = URI.open('https://images.halloweencostumes.com.au/products/45928/1-1/disney-incredibles-2-deluxe-mrs-incredible-womens-costume.jpg')
costume15.photos.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
costume15.save!

puts "Done creating stuff"

