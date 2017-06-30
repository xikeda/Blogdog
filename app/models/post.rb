class Post < ApplicationRecord
  has_many :comments, dependant: :destroy
  validates :title, presence: true, length: {minimum: 5 }
  validates :body, presence: true
end
