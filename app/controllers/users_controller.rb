class UsersController < ApplicationController
  def top
  end

  def index
    @users = User.all
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def delete
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @weight = @user.weights.build(latest_weight: @user.weight)
    @weight.save
    redirect_to users_top_path
  end

  def edit_complete
  end

  def complete
  end

   private
  def user_params
    params.require(:user).permit(:name, :gender, :height, :weight, :ideal_weight, :age, :email, :password )
  end
end
