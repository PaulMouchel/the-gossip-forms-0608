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
  end

  def create
    city = City.find_or_create_by(name: params[:city], zip_code: params[:zip_code])
    @user = User.new(first_name: user_params[:first_name], last_name: user_params[:last_name], email: user_params[:email], city: city, age: user_params[:age], description: user_params[:description], password: user_params[:password], password_confirmation: user_params[:password_confirmation])
      if @user.save 
          flash[:success] = "Vous êtes inscrits !"
          session[:user_id] = @user.id
          redirect_to gossips_path
      else
          render :new
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
    params.require(:user).permit(:first_name, :last_name, :email, :age, :description, :password, :password_confirmation)
  end
end