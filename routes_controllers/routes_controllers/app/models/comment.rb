class Comment < ActiveRecord::Base
  validates :user_id, :artwork_id, :body, presence: true

  belongs_to :commenter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork

  has_many :likes, as: :likeable

  has_many :users_whom_like,
    through: :likes,
    source: :user
end
