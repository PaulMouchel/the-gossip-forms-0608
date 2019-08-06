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
  	@gossip = Gossip.find(params[:id])
	end

	def update
		@gossip = Gossip.find(params[:id])
		gossip_params = params.require(:gossip).permit(:title, :content)
		if @gossip.update(gossip_params)
			flash[:success] = "Votre gossip à bien été modifié !"
			redirect_to @gossip
		else
			render :edit
		end
	end	

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end
end