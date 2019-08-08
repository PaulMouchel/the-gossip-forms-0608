class TagsController < ApplicationController
  def index

  end

  def show
    # @id = params[:id]
    # @gossip = Gossip.all.find(@id)
    # @comment = Comment.new
  end


  def new
    # @gossip = Gossip.new
    # @tags = Tag.all
  end

  def create
    @tag = Tag.new(title: params[:title], content: params[:content], user: User.last) 
    if @gossip.save 
      flash[:success] = "Votre gossip à bien été enregistré !"
      redirect_to gossips_path
    else
      render new_gossip_path
    end
  end

  def edit
    # @gossip = Gossip.find(params[:id])
  end

  def update
    # @gossip = Gossip.find(params[:id])
    # gossip_params = params.require(:gossip).permit(:title, :content)
    # if @gossip.update(gossip_params)
    #   flash[:success] = "Votre gossip à bien été modifié !"
    #   redirect_to @gossip
    # else
    #   render :edit
    # end
  end	

  def destroy
    # @gossip = Gossip.find(params[:id])
    # @gossip.destroy
    # redirect_to gossips_path
  end
end
