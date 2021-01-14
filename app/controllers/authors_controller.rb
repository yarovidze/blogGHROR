class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update]

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end
  def create
    @author = Author.create(params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar))
    session[:author_id] = @author.id
    redirect_to home_path
  end

  def update
    if @author.update(params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar))
      redirect_to home_path, notice: "Profile was edited."
    else
      format.html { render :edit }
      format.json { render json: @author.errors, status: :unprocessable_entity }
    end
  end

  private

  def set_author
    @author = current_author
  end
end
