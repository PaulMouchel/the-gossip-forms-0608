class UsersController < ApplicationController
  def index
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
  	id = params[:id]
  	@user = User.all.find(id)
  end

  def new
    @user = User.new
    puts @user
  end

  def create
    puts "$"*1000
    puts user_params
    puts "$"*1000

    @user = User.new(user_params)
		if @user.save 
			flash[:success] = "Vous êtes inscrits !"
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
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :city, :password, :password_confirmation)
  end
end
