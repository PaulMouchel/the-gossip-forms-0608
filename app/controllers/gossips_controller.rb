class GossipsController < ApplicationController

	def index
		@tags = Tag.all
	end

  def show
  	@id = params[:id]
		@gossip = Gossip.all.find(@id)
		@comment = Comment.new
  end


	def new
		@gossip = Gossip.new
		@tags = Tag.all
	end

	def create
		@gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
		tag = Tag.find(params[:tag])
		@join_table = JoinTableGossipTag.create(gossip: @gossip, tag: tag)
		if @gossip.save 
			flash[:success] = "Votre gossip à bien été enregistré !"
			redirect_to gossips_path
		else
			@tags = Tag.all
			render new_gossip_path
		end
	end

	def edit
		@gossip = Gossip.find(params[:id])
		@tags = Tag.all
	end

	def update
		@gossip = Gossip.find(params[:id])
		gossip_params = params.require(:gossip).permit(:title, :content)
		tag = Tag.find(params[:tag])
		join_table = JoinTableGossipTag.where(gossip_id: @gossip.id)
		join_table.each do |join| join.update(gossip: @gossip, tag: tag) end
		if @gossip.update(gossip_params)
			flash[:success] = "Votre gossip à bien été modifié !"
			redirect_to @gossip
		else
			@tags = Tag.all
			render :edit
		end
	end	

	def destroy
		@gossip = Gossip.find(params[:id])
		@gossip.destroy
		redirect_to gossips_path
	end
end