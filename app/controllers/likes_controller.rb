class LikesController < ApplicationController
  before_action :find_gossip

  def create
    @gossip.likes.create(user_id: current_user.id)
  end

  private

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
end
