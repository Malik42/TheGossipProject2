class Comment < ApplicationRecord
  validates :content, length: {minimum:3}
  belongs_to :user
  belongs_to :gossip
end
