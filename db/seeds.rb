require 'faker' # on inclus la gem faker qui avs nous permettre de generer des donnees

# on vide toutes les tables

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table City avec des donnee cree par faker
  ville = City.create!(name: Faker::Address.city,zip_code: Faker::Address.zip_code)
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table User avec des donnee cree par faker
  utilisateur = User.create!(first_name: Faker::Name.first_name,password: Faker::Internet.password, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph,email: Faker::Internet.email, age: rand(18..75),city_id: rand((City.first.id)..(City.last.id)))
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table Gossip avec des donnee cree par faker
  tweety = Gossip.create!(title: Faker::Book.title,content: Faker::Lorem.sentence,user_id: rand((User.first.id)..(User.last.id)))
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table Tag avec des donnee cree par faker
  style = Tag.create!(title: Faker::Lorem.words(8),gossip_id: rand((Gossip.first.id)..(Gossip.last.id)))
end

# on fait 10 tours de boucle ici
10.times do
  # on remplis la table PrivateMessage avec des donnee cree par faker
  pm = PrivateMessage.create!(content: Faker::Lorem.sentence,sender_id: rand((User.first.id)..(User.last.id)),recipient_id: rand((User.first.id)..(User.last.id)))
end

Faker::Internet.password