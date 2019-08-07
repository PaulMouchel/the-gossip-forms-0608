class LikesController < ApplicationController
  before_action :find_gossip

  def create
    @gossip.likes.create(user: current_user)
    redirect_to gossip_path(@gossip)
  end

  private

  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
end
