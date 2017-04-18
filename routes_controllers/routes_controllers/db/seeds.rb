# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(username: 'seanperfect')
user2 = User.create(username: 'aaron')
user3 = User.create(username: 'jibberish')
user4 = User.create(username: 'lameartist1234')

artwork1 = Artwork.create(title: 'mona lisa', image_url: 'thamona.com', artist_id: 1)
artwork2 = Artwork.create(title: 'starry night', image_url: 'vangohg.com', artist_id: 2)
artwork3 = Artwork.create(title: 'Sistine Chapel', image_url: 'michalangelo.com', artist_id: 3)

awshare1 = ArtworkShare.create(viewer_id: 1, artwork_id: 2)
awshare2 = ArtworkShare.create(viewer_id: 2, artwork_id: 1)
awshare3 = ArtworkShare.create(viewer_id: 3, artwork_id: 1)
awshare4 = ArtworkShare.create(viewer_id: 4, artwork_id: 2)


c1 = Comment.create(user_id: 1, artwork_id: 2, body:"This some artowrk")
c2 = Comment.create(user_id: 2, artwork_id: 3, body:"This too")
c3 = Comment.create(user_id: 3, artwork_id: 1, body:"Yup")
c4 = Comment.create(user_id: 2, artwork_id: 1, body:"beautifil")
