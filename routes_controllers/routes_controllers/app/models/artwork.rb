class Artwork < ActiveRecord::Base
  validates :title, :artist_id, :image_url, presence: true
  validates_uniqueness_of :title, :scope => :artist_id

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'ArtworkShare'

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
