class Post < ApplicationRecord
  acts_as_votable
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5 }
  validates :body, presence: true

  belongs_to :user, optional: true 
end
