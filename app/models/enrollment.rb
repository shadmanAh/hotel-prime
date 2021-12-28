class Enrollment < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :user, :room, :review, :rating, presence: true

  # validates_presence_of :rating, if: :review?
  # validates_presence_of :review, if: :rating?

  validates_uniqueness_of :user_id, scope: :room_id  #user cant be subscribed to the same course twice
  validates_uniqueness_of :room_id, scope: :user_id  #user cant be subscribed to the same course twice

  scope :pending_review, -> { where(rating: [0, nil, ""], review: [0, nil, ""]) }

  extend FriendlyId
  friendly_id :to_s, use: :slugged
  
  def to_s
    user.to_s + " " + room.to_s
  end
  
end
