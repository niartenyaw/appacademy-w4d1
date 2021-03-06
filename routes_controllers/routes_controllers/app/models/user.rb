class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'Artwork'

  has_many :artwork_shares,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: 'ArtworkShare'

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment

  has_many :artworks_with_comments,
    through: :comments,
    source: :artwork

  has_many :likes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Like
end
