# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
user1 = User.create(username: 'Superman')
user2 = User.create(username: 'Batman')
user3 = User.create(username: 'Flash')

Artwork.delete_all
artwork1 = Artwork.create(title: "Hello World", image_url: 'www.helloworld.com', artist_id: user1.id)
artwork2 = Artwork.create(title: "Hello Sky",  image_url: 'www.hellosky.com', artist_id: user2.id)
artwork3 = Artwork.create(title: "Hello My Baby", image_url: 'www.hellobabeee.com', artist_id: user3.id)

ArtworkShare.delete_all
share1 = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: user1.id)
share2 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user1.id)
share3 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user1.id)
share4 = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: user2.id)
share5 = ArtworkShare.create(artwork_id: artwork3.id, viewer_id: user3.id)
