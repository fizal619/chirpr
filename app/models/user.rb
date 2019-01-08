class User < ApplicationRecord
  has_many :posts

  def is_rockstar
    return self.posts.size > 2
  end

end
