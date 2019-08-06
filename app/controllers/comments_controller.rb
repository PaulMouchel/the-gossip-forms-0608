class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    p = comment_params
    p[:user] = User.last
    @comment = Comment.new(p)#, user: User.first) 
    puts "-"*100
    puts p
 
    puts "-"*100
    puts "-"*100
    puts "-"*100

		@comment.save 
		flash[:success] = "Votre commentaire à bien été enregistré !"
		redirect_to gossips_path
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
  end

  private 

  def comment_params
    params.require(:comment).permit(:content, :gossip, :gossip_id)
  end
end