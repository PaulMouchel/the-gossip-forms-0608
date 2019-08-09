class PrivateMessagesController < ApplicationController
	def create
    @conversation = Conversation.find(params[:conversation_id])
    @private_message = PrivateMessage.new(content: message_params[:content],sender: current_user,conversation: @conversation)
    if !@private_message.save
      flash[:error] = "Le message n'a pas pu être envoyé"
    end
    redirect_back fallback_location: gossips_path
  end

	private 

  def message_params
    params.require(:private_message).permit(:content, :conversation_id, :id)
  end
end
