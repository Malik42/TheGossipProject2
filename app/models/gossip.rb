class Gossip < ApplicationRecord
  belongs_to :user, optional: true # le gossip est liee a l'utilisateur qui le cree
  has_many :tags # un tag peut etre liee a plusieurs gossip
  has_many :comments, dependent: :delete_all
end
