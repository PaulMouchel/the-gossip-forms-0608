class ConversationsController < ApplicationController

	def index
	end

  def show
  	@id = params[:id]
		@conversation = Conversation.all.find(@id)
		@privateMessage = PrivateMessage.new
		#@message = PrivateMessage.new
  end


	def new
		@conversation = Conversation.new
		@users_in_list = User.all.reject{|u| u == current_user}
	end

	def create
		@conversation = Conversation.new
		receiver = User.find(params[:user])
		JoinTableUsersConversation.create(user: current_user,conversation: @conversation)
		JoinTableUsersConversation.create(user: receiver,conversation: @conversation)
		PrivateMessage.create(content: params[:content],sender: current_user,conversation: @conversation)
		if @conversation.save
				flash[:success] = "Votre conversation à bien été enregistré !"
				redirect_to conversations_path
		else
				render new_conversation_path
		end
		# 		# @conversation.users.push(receiver)
		# message = PrivateMessage.new(sender: current_user, recipient: receiver)
		# conversation.messages
		# tag = Tag.find(params[:tag])
		# @join_table = JoinTableGossipTag.create(gossip: @gossip, tag: tag)
		# if @gossip.save 
		# 	flash[:success] = "Votre gossip à bien été enregistré !"
		# 	redirect_to gossips_path
		# else
		# 	@tags = Tag.all
		# 	render new_gossip_path
		# end
	end

	def edit
		# @gossip = Gossip.find(params[:id])
		# @tags = Tag.all
	end

	def update
		# @gossip = Gossip.find(params[:id])
		# gossip_params = params.require(:gossip).permit(:title, :content)
		# tag = Tag.find(params[:tag])
		# join_table = JoinTableGossipTag.where(gossip_id: @gossip.id)
		# join_table.each do |join| join.update(gossip: @gossip, tag: tag) end
		# if @gossip.update(gossip_params)
		# 	flash[:success] = "Votre gossip à bien été modifié !"
		# 	redirect_to @gossip
		# else
		# 	@tags = Tag.all
		# 	render :edit
		# end
	end	

	def destroy
		# @gossip = Gossip.find(params[:id])
		# @gossip.destroy
		# redirect_to gossips_path
	end
end