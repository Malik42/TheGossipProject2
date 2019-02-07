class CityController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @city = City.all
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @city = City.find(params[:id])
    @user = User.all.where(city_id: params[:id])
    @gossip_tab = []
    @user.each do |user|
      gossip = Gossip.all.where(user_id: user)
      gossip.each do |gossip|
        @gossip_tab << gossip
      end
    end
  end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @city = City.new
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    city = City.create!(name: params[:name], zip_code: params[:zip_code])
    
    if city.name == ""
      city.delete
      redirect_to new_city_path
      puts "non tu a pas remplit le formulaire"
    else
      redirect_to city_path(city.id)
    end
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @city = City.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @city = City.find(params[:id])
    city_params = params.require(:city).permit(:name, :zip_code)
    @city.update(city_params)
    redirect_to city_path
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
  end
end
