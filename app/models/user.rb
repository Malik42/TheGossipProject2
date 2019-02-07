class User < ApplicationRecord
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update
  validates :email,    :presence => true,
                       :uniqueness => true,
                       :format =>{ with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
                       validates :first_name,:last_name, length: { minimum: 2 }

                       



  belongs_to :city, optional: true # on fait le lien entre l'user et sa ville
  has_many :gossips # on dit qu'un user peut cree des gossip
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage" # on fait un lien entre l'utilisateur et les messages qu'il envoi
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage" # on fait le lien entre l'user et les messages qu'il recoi
  has_secure_password
end
