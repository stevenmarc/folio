class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
 def index
 	 @users = User.all
 end

 def new
    @user = User.new
 end

 def show

 end

def edit
  if check_user == "false"
    render text: 'Not allowed to edit'
  end

 end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

  def check_user
      @user == current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_username(params[:id]) || User.find(params[:id])
    end

 

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :last_name, :first_name, :slug_line, :about, :country, :city, :address, :birthdate, :show_age, :show_email, :color_scheme, :fonts_choice, :background_picture_id, :layout_choice)
    end	
end