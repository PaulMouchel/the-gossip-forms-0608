class GossipsController < ApplicationController

	def index

	end

  def show
  	@id = params[:id]
  	@gossip = Gossip.all.find(@id)
  	@full_name = "#{@gossip.user.first_name} #{@gossip.user.last_name}"
  end


	def new
		@gossip = Gossip.new
	end

	def create
		@gossip = Gossip.new(title: params[:title], content: params[:content], user: User.last) # avec xxx qui sont les données obtenues à partir du formulaire
		if @gossip.save # essaie de sauvegarder en base @gossip
			flash[:success] = "Votre gossip à bien été enregistré !"
			redirect_to gossips_path
		else
			render new_gossip_path
		end
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
		# Méthode qui récupère le potin concerné et le détruit en base
		# Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
	end
end