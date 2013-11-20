class UsersController < ApplicationController
def new
  @user = User.new
end

def show
  @user = User.find(params[:id])
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to restaurants_url, :notice => "Signed up!"
  else
    render :new
  end
end

private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
