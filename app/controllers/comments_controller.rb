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
end
