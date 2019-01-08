class Post < ApplicationRecord
  belongs_to :user
  validates :body, length: { maximum: 140,
    too_long: "%{count} characters is the maximum allowed" }
end
