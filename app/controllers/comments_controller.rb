class CommentsController < ApplicationController
  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @comment = Comment.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @comment = Comment.find(params[:id])
    post_params = params.require(:comment).permit(:content)
    @comment.update(post_params)
    redirect_to gossip_path(@comment.gossip_id)
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @comment = Comment.find(params[:comment_id])
    @comment.delete
    redirect_to gossip_path(params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    @comment = Comment.new
    @gossip = params[:format]
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
    
    if params[:content] == ""
      redirect_to gossip_path(params[:gossip_id])
      puts "non tu a pas remplit le formulaire"
    else
      comment = Comment.create!(content: params[:content],gossip_id: params[:gossip_id],user_id: rand((User.first.id)..(User.last.id)))
      redirect_to gossip_path(params[:gossip_id])
    end
  end
end
